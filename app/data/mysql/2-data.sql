

-- Usuarios (4: 2 admins, 2 users) - Contraseñas hasheadas con bcrypt

INSERT INTO users (role, name, email, password) VALUES
('admin', 'Ana Rodríguez', 'ana.rodriguez@applestore.com', 'Admin123'),
('admin', 'Carlos Mendoza', 'carlos.mendoza@applestore.com', 'Admin456'),
('user', 'Beatriz Silva', 'beatriz.silva@gmail.com', 'User123'),
('user', 'David González', 'david.gonzalez@outlook.com', 'User456');

-- ===== PRODUCTOS GENERALES =====
INSERT INTO products (id, name, category, description, image_primary_url, image_secondary_url, image_tertiary_url, release_date, attributes) VALUES
-- iPhones
(1, 'iPhone 15 Pro Max', 'Iphone', 'El iPhone más avanzado con titanio, cámara de 48MP con zoom óptico 5x y chip A17 Pro revolucionario.', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-15-pro-max-naturaltitanium-select.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-15-pro-max-camera.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-15-pro-max-action-button.jpg', '2023-09-22', NULL),
(2, 'iPhone 15 Pro', 'Iphone', 'iPhone Pro con diseño de titanio, cámara avanzada de 48MP y el potente chip A17 Pro para un rendimiento excepcional.', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-15-pro-naturaltitanium-select.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-15-pro-camera-system.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-15-pro-usbc.jpg', '2023-09-22', NULL),
(3, 'iPhone 15', 'Iphone', 'iPhone con cámara principal de 48MP, Dynamic Island innovadora y conectividad USB-C para todos.', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-15-pink-select.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-15-camera.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-15-dynamic-island.jpg', '2023-09-22', NULL),
(4, 'iPhone 14', 'Iphone', 'iPhone con cámara mejorada, detección de choques, conectividad satelital de emergencia y gran duración de batería.', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-14-midnight-select.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-14-camera.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-14-emergency-sos.jpg', '2022-09-16', NULL),
(5, 'iPhone SE', 'Iphone', 'iPhone más accesible con el poderoso chip A15 Bionic, Touch ID y compatibilidad con 5G.', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-se-midnight-select.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-se-chip.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-se-touch-id.jpg', '2022-03-18', NULL),

-- MacBooks e iMacs
(6, 'MacBook Pro 16" M3 Max', 'Mac', 'MacBook Pro definitivo con chip M3 Max de hasta 40 núcleos GPU, pantalla Liquid Retina XDR y hasta 128GB de memoria unificada.', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/mbp16-spacegray-select.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/mbp16-keyboard.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/mbp16-ports.jpg', '2023-10-30', NULL),
(7, 'MacBook Pro 14" M3 Pro', 'Mac', 'MacBook Pro con chip M3 Pro, pantalla Liquid Retina XDR de 14 pulgadas y hasta 36GB de memoria unificada.', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/mbp14-spacegray-select.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/mbp14-display.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/mbp14-performance.jpg', '2023-10-30', NULL),
(8, 'MacBook Air 15" M3', 'Mac', 'MacBook Air espacioso de 15 pulgadas con chip M3, diseño extremadamente delgado y hasta 18 horas de duración de batería.', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/mba15-midnight-select.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/mba15-keyboard.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/mba15-portability.jpg', '2024-03-04', NULL),
(9, 'MacBook Air 13" M3', 'Mac', 'MacBook Air clásico de 13 pulgadas con chip M3, diseño icónico y la mejor relación rendimiento-portabilidad.', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/mba13-starlight-select.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/mba13-magsafe.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/mba13-performance.jpg', '2024-03-04', NULL),
(10, 'iMac 24" M3', 'Mac', 'iMac todo en uno con pantalla Retina 4.5K de 24 pulgadas, chip M3 y diseño vibrante en siete colores.', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/imac-24-blue-select.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/imac-24-display.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/imac-24-colors.jpg', '2023-10-30', NULL),

-- iPads
(11, 'iPad Pro 12.9" M2', 'Ipad', 'iPad Pro máximo con pantalla Liquid Retina XDR de 12.9 pulgadas, chip M2 y compatibilidad total con Apple Pencil y Magic Keyboard.', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/ipad-pro-12-silver-select.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/ipad-pro-12-apple-pencil.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/ipad-pro-12-magic-keyboard.jpg', '2022-10-18', NULL),
(12, 'iPad Pro 11" M2', 'Ipad', 'iPad Pro con pantalla Liquid Retina de 11 pulgadas, chip M2 y diseño portátil perfecto para creativos y profesionales.', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/ipad-pro-11-spacegray-select.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/ipad-pro-11-display.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/ipad-pro-11-versatility.jpg', '2022-10-18', NULL),
(13, 'iPad Air 10.9" M1', 'Ipad', 'iPad Air con chip M1, pantalla Liquid Retina de 10.9 pulgadas y compatibilidad con Apple Pencil de 2ª generación.', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/ipad-air-blue-select.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/ipad-air-performance.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/ipad-air-apple-pencil.jpg', '2022-03-18', NULL),
(14, 'iPad 10.9" 10ª gen', 'Ipad', 'iPad versátil de 10ª generación con pantalla Liquid Retina de 10.9 pulgadas, chip A14 Bionic y diseño completamente rediseñado.', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/ipad-10th-gen-pink-select.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/ipad-10th-gen-landscape.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/ipad-10th-gen-colors.jpg', '2022-10-26', NULL),
(15, 'iPad mini 8.3" 6ª gen', 'Ipad', 'iPad mini compacto con pantalla Liquid Retina de 8.3 pulgadas, chip A15 Bionic y compatibilidad con Apple Pencil de 2ª generación.', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/ipad-mini-purple-select.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/ipad-mini-portability.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/ipad-mini-apple-pencil.jpg', '2021-09-24', NULL),

-- Apple Watch
(16, 'Apple Watch Series 9 45mm', 'Watch', 'Apple Watch más avanzado con chip S9, pantalla Always-On más brillante, nuevos gestos y aplicaciones de salud revolucionarias.', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/watch-s9-45-midnight-select.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/watch-s9-health-features.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/watch-s9-double-tap.jpg', '2023-09-22', NULL),
(17, 'Apple Watch Ultra 2 49mm', 'Watch', 'Apple Watch más resistente con caja de titanio, Digital Crown más grande, resistencia extrema y batería de hasta 36 horas.', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/watch-ultra2-titanium-select.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/watch-ultra2-ocean-band.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/watch-ultra2-action-button.jpg', '2023-09-22', NULL),
(18, 'Apple Watch SE 40mm', 'Watch', 'Apple Watch esencial con funciones fundamentales de salud y fitness, detección de caídas y notificaciones inteligentes.', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/watch-se-40-starlight-select.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/watch-se-fitness.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/watch-se-value.jpg', '2022-09-16', NULL),

-- Accesorios
(19, 'AirPods Pro 2ª gen USB-C', 'Accessories', 'AirPods Pro con cancelación activa de ruido mejorada, audio espacial personalizado y estuche con USB-C.', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/airpods-pro-2nd-gen-usbc-select.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/airpods-pro-2nd-gen-case.jpg', NULL, '2023-09-22', NULL),
(20, 'AirPods 3ª generación', 'Accessories', 'AirPods con audio espacial, resistencia al agua IPX4 y hasta 30 horas de duración total de batería.', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/airpods-3rd-gen-select.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/airpods-3rd-gen-case.jpg', NULL, '2021-10-26', NULL),
(21, 'Magic Keyboard para iPad Pro 12.9"', 'Accessories', 'Magic Keyboard con trackpad, retroiluminación de teclas y puerto USB-C pass-through para iPad Pro de 12.9 pulgadas.', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/magic-keyboard-ipad-pro-12-white-select.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/magic-keyboard-ipad-typing.jpg', NULL, '2022-10-18', NULL),
(22, 'Apple Pencil 2ª generación', 'Accessories', 'Apple Pencil con doble toque, carga inalámbrica magnética y latencia ultra baja para dibujo y escritura precision.', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/apple-pencil-2nd-gen-select.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/apple-pencil-2nd-gen-drawing.jpg', NULL, '2018-11-07', NULL),
(23, 'MagSafe Charger', 'Accessories', 'Cargador inalámbrico MagSafe con alineación magnética perfecta y carga rápida de hasta 15W para iPhone.', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/magsafe-charger-select.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/magsafe-charger-iphone.jpg', NULL, '2020-10-23', NULL),
(24, 'AirTag 4-pack', 'Accessories', 'Localizadores AirTag con tecnología de Red Buscar, resistencia al agua IP67 y batería reemplazable de un año.', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/airtag-4pack-select.jpg', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/airtag-precision-finding.jpg', NULL, '2021-04-30', NULL);

-- ===== VARIANTES DE PRODUCTOS =====
-- Variantes para iPhone 15 Pro Max
INSERT INTO product_variants (product_id, color, storage, price, stock, is_active, attributes) VALUES
(1, 'Titanium', '256GB', 1499.99, 10, TRUE, '{"edition": "Pro Max"}'),
(1, 'Titanium', '512GB', 1599.99, 8, TRUE, '{"edition": "Pro Max"}'),
(1, 'Black', '256GB', 1499.99, 7, TRUE, '{"edition": "Pro Max"}'),
(1, 'Black', '512GB', 1599.99, 5, TRUE, '{"edition": "Pro Max"}'),
-- Variantes para MacBook Pro 16" M3 Max
(6, 'Space Gray', '1TB', 3999.99, 3, TRUE, '{"gpu": "40-core"}'),
(6, 'Space Gray', '2TB', 4299.99, 2, TRUE, '{"gpu": "40-core"}'),
-- Variantes para iPad Pro 12.9" M2
(11, 'Silver', '256GB', 1399.99, 5, TRUE, '{"accessory": "Magic Keyboard"}'),
(11, 'Silver', '512GB', 1499.99, 3, TRUE, '{"accessory": "Magic Keyboard"}');


-- ===== VENTAS Y PRODUCTOS POR VENTA =====
INSERT INTO sales (user_id, total) VALUES
(1, 4999.97), -- Ana Rodríguez (admin)
(2, 3799.96), -- Carlos Mendoza (admin)
(3, 1749.98), -- Beatriz Silva (user)
(4, 2199.97); -- David González (user)

-- Productos por venta (sales_products)
-- Venta 1: Ana compra MacBook Pro 16" M3 Max, iPad Pro 12.9" M2, AirPods Pro
INSERT INTO sales_products (sale_id, product_id, quantity, unit_price, subtotal) VALUES
(1, 6, 1, 3999.99, 3999.99),
(1, 11, 1, 1399.99, 1399.99),
(1, 19, 2, 279.99, 559.98),
-- Venta 2: Carlos compra MacBook Air 15" M3, Apple Watch Series 9, Magic Keyboard
(2, 8, 1, 1699.99, 1699.99),
(2, 16, 1, 529.99, 529.99),
(2, 21, 1, 449.99, 449.99),
(2, 22, 2, 149.99, 299.98),
-- Venta 3: Beatriz compra iPhone 15, AirPods 3ª gen
(3, 3, 1, 999.99, 999.99),
(3, 20, 1, 199.99, 199.99),
(3, 23, 1, 49.99, 49.99),
(3, 24, 1, 119.99, 119.99),
-- Venta 4: David compra iPhone 15 Pro, iPad Air
(4, 2, 1, 1299.99, 1299.99),
(4, 13, 1, 749.99, 749.99),
(4, 23, 3, 49.99, 149.97);
