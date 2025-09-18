import json
import pymysql
from models.productModels import Product
from typing import List, Optional

class ProductService:
    def __init__(self, get_connection):
        self.get_connection = get_connection

    def list_products(self) -> List[Product]:
        conn = self.get_connection()
        try:
            with conn.cursor() as cursor:
                cursor.execute("SELECT * FROM products WHERE is_active=TRUE")
                rows = cursor.fetchall()
                return [Product(**row) for row in rows]
        finally:
            conn.close()

    def get_product(self, product_id: int) -> Optional[Product]:
        conn = self.get_connection()
        try:
            with conn.cursor() as cursor:
                cursor.execute("SELECT * FROM products WHERE id=%s", (product_id,))
                row = cursor.fetchone()
                if row:
                    return Product(**row)
                return None
        finally:
            conn.close()

    def create_product(self, product: Product) -> int:
        conn = self.get_connection()
        try:
            with conn.cursor() as cursor:
                sql = """
                INSERT INTO products (name, category, description, price, stock, image_primary_url, image_secondary_url, image_tertiary_url, release_date, is_active, attributes)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
                """
                attributes_json = json.dumps(product.attributes) if isinstance(product.attributes, dict) else product.attributes
                cursor.execute(sql, (
                    product.name, product.category, product.description, product.price, product.stock,
                    product.image_primary_url, product.image_secondary_url, product.image_tertiary_url,
                    product.release_date, product.is_active, attributes_json
                ))
                conn.commit()
                return cursor.lastrowid
        finally:
            conn.close()

    def update_product(self, product_id: int, product: Product) -> bool:
        conn = self.get_connection()
        try:
            with conn.cursor() as cursor:
                sql = """
                UPDATE products SET name=%s, category=%s, description=%s, price=%s, stock=%s, image_primary_url=%s, image_secondary_url=%s, image_tertiary_url=%s, release_date=%s, is_active=%s, attributes=%s WHERE id=%s
                """
                cursor.execute(sql, (
                    product.name, product.category, product.description, product.price, product.stock,
                    product.image_primary_url, product.image_secondary_url, product.image_tertiary_url,
                    product.release_date, product.is_active, product.attributes, product_id
                ))
                conn.commit()
                return cursor.rowcount > 0
        finally:
            conn.close()

    def delete_product(self, product_id: int) -> bool:
        conn = self.get_connection()
        try:
            with conn.cursor() as cursor:
                cursor.execute("DELETE FROM products WHERE id=%s", (product_id,))
                conn.commit()
                return cursor.rowcount > 0
        finally:
            conn.close()
