from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from routes.user import userRoutes
from routes.product import productRoutes
from routes.chats import chatRoutes
from routes.ai import agentRoutes

app = FastAPI()

# Configure CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

#routers
app.include_router(productRoutes.router)
app.include_router(chatRoutes.router)
app.include_router(userRoutes.router)
app.include_router(agentRoutes.router)


@app.get(
    "/", 
    tags=["root"],
    summary="🏠 Endpoint de bienvenida",
    description="Endpoint raíz que proporciona información básica de la API y enlaces útiles."
)
def read_root():
    """
    Endpoint de bienvenida de la Apple Store API.
    Proporciona información básica y enlaces a la documentación.
    """
    return {
        "message": "🍎 Welcome to Apple Store Backend API",
        "version": "1.0.0",
        "status": "✅ Active",
        "documentation": {
            "swagger_ui": "/docs",
            "redoc": "/redoc",
            "openapi_json": "/openapi.json"
        },
        "endpoints": {
            "users": "/users",
            "products": "/products", 
            "admin_products": "/products/admin",
            "migration": "/admin/migrate"
        },
        "features": [
            "🔐 JWT Authentication",
            "📱 Complete Product Management", 
            "👥 User Administration",
            "🛠️ Technical Specifications",
            "🔍 Advanced Filtering",
            "📄 Pagination Support"
        ]
    }

@app.get("/")
async def root():
    return {"message": "Apple Store Backend API is running"}

@app.get("/health")
async def health_check():
    return {"status": "healthy", "version": "1.0.0"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)