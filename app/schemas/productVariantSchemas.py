from pydantic import BaseModel, Field
from typing import Optional, Any

class ProductVariantSchema(BaseModel):
    product_id: Optional[int] = None
    color: Optional[str] = None
    storage: Optional[str] = None
    price: float = Field(..., gt=0)
    stock: int = Field(default=0, ge=0)
    is_active: Optional[bool] = True
    attributes: Optional[Any] = None

class ProductVariantUpdateSchema(ProductVariantSchema):
    color: Optional[str]
    storage: Optional[str]
    price: Optional[float]
    stock: Optional[int]
    is_active: Optional[bool]

class ProductVariantDBSchema(ProductVariantSchema):
    id: int
    created_at: Optional[str]
    updated_at: Optional[str]
