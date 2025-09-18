# Esquema de validación para productos
from pydantic import BaseModel, Field
from typing import Optional, Any

class ProductSchema(BaseModel):
    name: str = Field(..., max_length=100)
    category: str = Field(...)
    description: Optional[str]
    price: float = Field(..., gt=0)
    stock: int = Field(default=0, ge=0)
    image_primary_url: Optional[str]
    image_secondary_url: Optional[str]
    image_tertiary_url: Optional[str]
    release_date: Optional[str]  # ISO date string
    is_active: Optional[bool] = True
    attributes: Optional[Any]
    

class ProductUpdateSchema(ProductSchema):
    name: Optional[str]
    category: Optional[str]
    price: Optional[float]
    stock: Optional[int]
    is_active: Optional[bool]

class ProductDBSchema(ProductSchema):
    id: int
