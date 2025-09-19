import pymysql
from models.productVariantModels import ProductVariant
from typing import List, Optional
import json

class ProductVariantService:
    def __init__(self, get_connection):
        self.get_connection = get_connection

    def list_variants(self, product_id: Optional[int] = None) -> List[ProductVariant]:
        conn = self.get_connection()
        try:
            with conn.cursor() as cursor:
                if product_id:
                    cursor.execute("SELECT * FROM product_variants WHERE product_id=%s", (product_id,))
                else:
                    cursor.execute("SELECT * FROM product_variants")
                rows = cursor.fetchall()
                return [ProductVariant(**row) for row in rows]
        finally:
            conn.close()

    def get_variant(self, variant_id: int) -> Optional[ProductVariant]:
        conn = self.get_connection()
        try:
            with conn.cursor() as cursor:
                cursor.execute("SELECT * FROM product_variants WHERE id=%s", (variant_id,))
                row = cursor.fetchone()
                if row:
                    return ProductVariant(**row)
                return None
        finally:
            conn.close()

    def create_variant(self, variant: ProductVariant) -> int:
        conn = self.get_connection()
        try:
            with conn.cursor() as cursor:
                sql = """
                INSERT INTO product_variants (product_id, color, storage, price, stock, is_active, attributes)
                VALUES (%s, %s, %s, %s, %s, %s, %s)
                """
                attributes_json = json.dumps(variant.attributes) if isinstance(variant.attributes, dict) else variant.attributes
                cursor.execute(sql, (
                    variant.product_id, variant.color, variant.storage, variant.price, variant.stock,
                    variant.is_active, attributes_json
                ))
                conn.commit()
                return cursor.lastrowid
        finally:
            conn.close()

    def update_variant(self, variant_id: int, variant: ProductVariant) -> bool:
        conn = self.get_connection()
        try:
            with conn.cursor() as cursor:
                sql = """
                UPDATE product_variants SET color=%s, storage=%s, price=%s, stock=%s, is_active=%s, attributes=%s WHERE id=%s
                """
                attributes_json = json.dumps(variant.attributes) if isinstance(variant.attributes, dict) else variant.attributes
                cursor.execute(sql, (
                    variant.color, variant.storage, variant.price, variant.stock,
                    variant.is_active, attributes_json, variant_id
                ))
                conn.commit()
                return cursor.rowcount > 0
        finally:
            conn.close()

    def delete_variant(self, variant_id: int) -> bool:
        conn = self.get_connection()
        try:
            with conn.cursor() as cursor:
                cursor.execute("DELETE FROM product_variants WHERE id=%s", (variant_id,))
                conn.commit()
                return cursor.rowcount > 0
        finally:
            conn.close()
