# Modelo de producto para PyMySQL

class Product:
    def __init__(self, id=None, name=None, category=None, description=None, price=None, stock=None,image_primary_url=None, image_secondary_url=None, image_tertiary_url=None,release_date=None, is_active=True, attributes=None,created_at=None,updated_at=None):
        self.id = id
        self.name = name
        self.category = category
        self.description = description
        self.price = price
        self.stock = stock
        self.image_primary_url = image_primary_url
        self.image_secondary_url = image_secondary_url
        self.image_tertiary_url = image_tertiary_url
        self.release_date = release_date
        self.is_active = is_active
        self.attributes = attributes
        self.created_at = created_at
        self.updated_at = updated_at

    def to_dict(self):
        d = self.__dict__.copy()
        # Convert release_date to string if it's a date object
        import datetime
        if isinstance(d.get('release_date'), datetime.date):
            d['release_date'] = d['release_date'].isoformat()
        return d
