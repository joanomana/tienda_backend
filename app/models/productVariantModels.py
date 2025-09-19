class ProductVariant:
    def __init__(self, id=None, product_id=None, color=None, storage=None, price=None, stock=None, is_active=True, attributes=None, created_at=None, updated_at=None):
        self.id = id
        self.product_id = product_id
        self.color = color
        self.storage = storage
        self.price = price
        self.stock = stock
        self.is_active = is_active
        self.attributes = attributes
        self.created_at = created_at
        self.updated_at = updated_at

    def to_dict(self):
        d = self.__dict__.copy()
        import datetime
        if isinstance(d.get('created_at'), datetime.date):
            d['created_at'] = d['created_at'].isoformat()
        if isinstance(d.get('updated_at'), datetime.date):
            d['updated_at'] = d['updated_at'].isoformat()
        if d.get('id') is not None:
            try:
                d['id'] = int(d['id'])
            except Exception:
                pass
        if d.get('product_id') is not None:
            try:
                d['product_id'] = int(d['product_id'])
            except Exception:
                pass
        if d.get('price') is not None:
            try:
                d['price'] = float(d['price'])
            except Exception:
                pass
        if d.get('stock') is not None:
            try:
                d['stock'] = int(d['stock'])
            except Exception:
                pass
        if d.get('is_active') is not None:
            if isinstance(d['is_active'], bool):
                pass
            elif isinstance(d['is_active'], int):
                d['is_active'] = bool(d['is_active'])
            elif isinstance(d['is_active'], str):
                d['is_active'] = d['is_active'].lower() in ['true', '1', 'yes']
        return d
