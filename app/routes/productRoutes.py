from fastapi import APIRouter, HTTPException, Depends
from models.productModels import Product
from schemas.productSchemas import ProductSchema, ProductUpdateSchema, ProductDBSchema, ProductWithVariantsSchema
from schemas.productVariantSchemas import ProductVariantSchema, ProductVariantUpdateSchema, ProductVariantDBSchema
from services.productServices import ProductService
from services.productVariantServices import ProductVariantService
from typing import List
from database import get_connection


productRoutes = APIRouter()

service = ProductService(get_connection)
variant_service = ProductVariantService(get_connection)

@productRoutes.get('/products', response_model=List[ProductWithVariantsSchema])
def list_products():
    products = service.list_products()
    result = []
    for product in products:
        product_dict = product.to_dict()
        variants = [v.to_dict() for v in variant_service.list_variants(product.id)]
        product_dict['variants'] = variants
        result.append(product_dict)
    return result




@productRoutes.get('/products/{product_id}', response_model=ProductWithVariantsSchema)
def get_product(product_id: int):
    product = service.get_product(product_id)
    if not product:
        raise HTTPException(status_code=404, detail='Producto no encontrado')
    product_dict = product.to_dict()
    variants = [v.to_dict() for v in variant_service.list_variants(product_id)]
    product_dict['variants'] = variants
    return product_dict



@productRoutes.post('/products', response_model=ProductWithVariantsSchema)
def create_product(product: ProductSchema):
    prod = Product(**product.dict(exclude={'variants'}))
    prod_id = service.create_product(prod)
    # Procesar variantes si se incluyen
    if product.variants:
        from models.productVariantModels import ProductVariant
        for v in product.variants:
            v_dict = v if isinstance(v, dict) else v.dict() if hasattr(v, 'dict') else {}
            v_dict['product_id'] = prod_id
            variant_obj = ProductVariant(**v_dict)
            variant_service.create_variant(variant_obj)
    prod_db = service.get_product(prod_id)
    product_dict = prod_db.to_dict()
    variants = [v.to_dict() for v in variant_service.list_variants(prod_id)]
    product_dict['variants'] = variants
    return product_dict


@productRoutes.put('/products/{product_id}', response_model=ProductWithVariantsSchema)
def update_product(product_id: int, product: ProductUpdateSchema):
    prod_actual = service.get_product(product_id)
    if not prod_actual:
        raise HTTPException(status_code=404, detail='Producto no encontrado')
    prod_data = prod_actual.to_dict()
    prod_data.update(product.dict(exclude_unset=True, exclude={'variants'}))
    prod = Product(**prod_data)
    service.update_product(product_id, prod)
    # Procesar variantes si se incluyen
    if product.variants:
        from models.productVariantModels import ProductVariant
        for v in product.variants:
            v_dict = v if isinstance(v, dict) else v.dict() if hasattr(v, 'dict') else {}
            v_dict['product_id'] = product_id
            variant_obj = ProductVariant(**v_dict)
            variant_service.create_variant(variant_obj)
    prod_db = service.get_product(product_id)
    product_dict = prod_db.to_dict()
    variants = [v.to_dict() for v in variant_service.list_variants(product_id)]
    product_dict['variants'] = variants
    return product_dict


@productRoutes.delete('/products/{product_id}')
def delete_product(product_id: int):
    if not service.delete_product(product_id):
        raise HTTPException(status_code=404, detail='Producto no encontrado')
    return {'detail': 'Producto eliminado'}

@productRoutes.put('/products/{product_id}/variants/{variant_id}')
def update_product_variant(product_id: int, variant_id: int, variant: ProductVariantUpdateSchema):
    from models.productVariantModels import ProductVariant
    variant_actual = variant_service.get_variant(variant_id)
    if not variant_actual or variant_actual.product_id != product_id:
        raise HTTPException(status_code=404, detail='Variante no encontrada para este producto')
    variant_data = variant_actual.to_dict()
    variant_data.update(variant.dict(exclude_unset=True))
    variant_obj = ProductVariant(**variant_data)
    variant_service.update_variant(variant_id, variant_obj)
    return variant_service.get_variant(variant_id).to_dict()


@productRoutes.delete('/products/{product_id}/variants/{variant_id}')
def delete_product_variant(product_id: int, variant_id: int):
    variant_actual = variant_service.get_variant(variant_id)
    if not variant_actual or variant_actual.product_id != product_id:
        raise HTTPException(status_code=404, detail='Variante no encontrada para este producto')
    if not variant_service.delete_variant(variant_id):
        raise HTTPException(status_code=404, detail='No se pudo eliminar la variante')
    return {'detail': 'Variante eliminada'}