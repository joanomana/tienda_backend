CREATE DATABASE IF NOT EXISTS market_db
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE market_db;

-- Users
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    role ENUM('admin','user') DEFAULT 'user',
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    register_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Products
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category ENUM('Iphone','Mac','Ipad','Watch','Accessories') NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    image_primary_url VARCHAR(255),
    image_secondary_url VARCHAR(255),
    image_tertiary_url VARCHAR(255),
    release_date DATE,
    is_active BOOLEAN DEFAULT TRUE,
    attributes JSON, -- aquí guardas los detalles específicos
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Sales
CREATE TABLE IF NOT EXISTS sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

-- Tabla intermedia: productos por venta
CREATE TABLE IF NOT EXISTS sales_products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sale_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    discount DECIMAL(10,2) DEFAULT 0,
    FOREIGN KEY (sale_id) REFERENCES sales(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

-- ===== SISTEMA DE CHATS SIMPLIFICADO =====

CREATE TABLE IF NOT EXISTS chats (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NULL, -- Puede ser NULL para usuarios no registrados
    channel ENUM('whatsapp','web','telegram','messenger') NOT NULL,
    external_id VARCHAR(100) NOT NULL, -- número, id de chat, id en Telegram, etc.
    last_message TEXT NULL, -- Último mensaje para preview
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_activity TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL,
    UNIQUE KEY uniq_chat (channel, external_id), -- evita duplicados del mismo usuario en el mismo canal
    INDEX idx_last_activity (last_activity)
);


-- Tabla de mensajes 
CREATE TABLE IF NOT EXISTS messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    chat_id INT NOT NULL,
    sender ENUM('user','bot','system') NOT NULL, -- Quien envía el mensaje
    body TEXT NOT NULL, -- Contenido del mensaje
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha del mensaje
    
    FOREIGN KEY (chat_id) REFERENCES chats(id) ON DELETE CASCADE,
    INDEX idx_chat_id (chat_id),
    INDEX idx_sender (sender),
    INDEX idx_created_at (created_at)
);