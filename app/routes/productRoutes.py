# Rutas para el CRUD de productos
from fastapi import APIRouter, HTTPException, Depends
from models.productModels import Product
from schemas.productSchemas import ProductSchema, ProductUpdateSchema, ProductDBSchema
from services.productServices import ProductService
from typing import List
from database import get_connection


productRoutes = APIRouter()

service = ProductService(get_connection)

@productRoutes.get('/products', response_model=List[ProductDBSchema])
def list_products():
    return [p.to_dict() for p in service.list_products()]


@productRoutes.get('/products/{product_id}', response_model=ProductDBSchema)
def get_product(product_id: int):
    product = service.get_product(product_id)
    if not product:
        raise HTTPException(status_code=404, detail='Producto no encontrado')
    return product.to_dict()


@productRoutes.post('/products', response_model=ProductDBSchema)
def create_product(product: ProductSchema):
    prod = Product(**product.dict())
    prod_id = service.create_product(prod)
    prod_db = service.get_product(prod_id)
    return prod_db.to_dict()


@productRoutes.put('/products/{product_id}', response_model=ProductDBSchema)
def update_product(product_id: int, product: ProductUpdateSchema):
    prod_actual = service.get_product(product_id)
    if not prod_actual:
        raise HTTPException(status_code=404, detail='Producto no encontrado')
    prod_data = prod_actual.to_dict()
    prod_data.update(product.dict(exclude_unset=True))
    prod = Product(**prod_data)
    service.update_product(product_id, prod)
    return service.get_product(product_id).to_dict()


@productRoutes.delete('/products/{product_id}')
def delete_product(product_id: int):
    if not service.delete_product(product_id):
        raise HTTPException(status_code=404, detail='Producto no encontrado')
    return {'detail': 'Producto eliminado'}
