from pydantic import BaseModel, Field
from typing import Optional, Any, List
from schemas.productVariantSchemas import ProductVariantSchema, ProductVariantDBSchema

class ProductSchema(BaseModel):
    name: str = Field(..., max_length=100)
    category: str = Field(...)
    description: Optional[str] = None
    image_primary_url: Optional[str] = None
    image_secondary_url: Optional[str] = None
    image_tertiary_url: Optional[str] = None
    release_date: Optional[str] = None  # ISO date string
    attributes: Optional[Any] = None
    variants: Optional[List[ProductVariantSchema]] = None

class ProductUpdateSchema(BaseModel):
    name: Optional[str] = None
    category: Optional[str] = None
    description: Optional[str] = None
    image_primary_url: Optional[str] = None
    image_secondary_url: Optional[str] = None
    image_tertiary_url: Optional[str] = None
    release_date: Optional[str] = None
    is_active: Optional[bool] = None
    attributes: Optional[Any] = None
    variants: Optional[List[ProductVariantSchema]] = None

class ProductDBSchema(ProductSchema):
    id: int

class ProductWithVariantsSchema(ProductDBSchema):
    variants: Optional[List[ProductVariantDBSchema]]
