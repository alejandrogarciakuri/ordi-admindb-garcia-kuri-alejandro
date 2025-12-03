USE `garcia-kuri-alejandro`;

INSERT INTO employees (first_name, last_name, email, phone, position, created_by, created_at, active)
VALUES
('Alejandro', 'García', 'alejandro@example.com', '9991112233', 'Manager', 1, NOW(), 1),
('Mariana', 'López', 'mariana@example.com', '9992223344', 'Supervisor', 1, NOW(), 1),
('Carlos', 'Hernández', 'carlos@example.com', '9993334455', 'Warehouse Staff', 1, NOW(), 1),
('Fernanda', 'Sánchez', 'fer@example.com', '9994445566', 'Sales', 1, NOW(), 1),
('Luis', 'Martínez', 'luis@example.com', '9995556677', 'Admin', 1, NOW(), 1);

INSERT INTO warehouses (name, city, address, phone, created_by, created_at, active)
VALUES
('Warehouse Norte', 'Mérida', 'Calle 10 #234', '9991000001', 1, NOW(), 1),
('Warehouse Centro', 'Cancún', 'Av. Kabah 123', '9982000002', 1, NOW(), 1),
('Warehouse Sur', 'CDMX', 'Eje Central 450', '5553000003', 1, NOW(), 1),
('Warehouse Pacífico', 'Guadalajara', 'Av. Vallarta 920', '3334000004', 1, NOW(), 1),
('Warehouse Golfo', 'Veracruz', 'Blvd. Ruiz 120', '2295000005', 1, NOW(), 1);

INSERT INTO suppliers (name, tax_id, phone, email, address, created_by, created_at, active)
VALUES
('ElectroMex SA', 'EMX001', '5544332211', 'contacto@electromex.com', 'CDMX', 1, NOW(), 1),
('CablesPlus', 'CBP002', '5533112299', 'ventas@cablesplus.com', 'Guadalajara', 1, NOW(), 1),
('TecnoProveed', 'TCP003', '5522991188', 'info@tecnoproveed.com', 'Monterrey', 1, NOW(), 1),
('Distribuidora Maya', 'DSM004', '9998877665', 'ventas@distmaya.com', 'Mérida', 1, NOW(), 1),
('RefaxPro', 'RFX005', '6642213455', 'contact@refaxpro.com', 'Tijuana', 1, NOW(), 1);

INSERT INTO clients (name, client_type, phone, email, address, created_by, created_at, active)
VALUES
('Comercial Santa Fe', 'wholesale', '9991002211', 'ventas@santafe.com', 'Mérida', 1, NOW(), 1),
('ElectroShop', 'retail', '9981003322', 'contacto@electroshop.com', 'Cancún', 1, NOW(), 1),
('MegaRefacciones', 'wholesale', '5559988776', 'admin@mega.com', 'CDMX', 1, NOW(), 1),
('La Bodega Tech', 'retail', '3332211199', 'labodega@gmail.com', 'Guadalajara', 1, NOW(), 1),
('Tecnopolis', 'wholesale', '2294411002', 'ventas@tecnopolis.com', 'Veracruz', 1, NOW(), 1);

INSERT INTO products (code, name, description, sale_price, unit, created_by, created_at, active)
VALUES
('USB-C-001', 'USB-C Cable', '1m fast charge cable', 120.00, 'piece', 1, NOW(), 1),
('HDMI-002', 'HDMI Cable 2m', 'High speed HDMI', 180.00, 'piece', 1, NOW(), 1),
('BATT-003', 'AA Battery Pack', 'Pack of 4 AA batteries', 85.00, 'pack', 1, NOW(), 1),
('CHARG-004', 'Wall Charger 25W', 'Fast charger', 250.00, 'piece', 1, NOW(), 1),
('ADAPT-005', 'USB-A to USB-C Adapter', 'Compact adapter', 45.00, 'piece', 1, NOW(), 1);

INSERT INTO product_supplier (product_id, supplier_id, supplier_code, purchase_price, created_by, created_at, active)
VALUES
(1, 1, 'EMX-USB-01', 70.00, 1, NOW(), 1),
(2, 2, 'CBP-HDMI-02', 90.00, 1, NOW(), 1),
(3, 3, 'TCP-BAT-04', 40.00, 1, NOW(), 1),
(4, 4, 'DSM-CHA-07', 130.00, 1, NOW(), 1),
(5, 5, 'RFX-ADA-09', 20.00, 1, NOW(), 1);

INSERT INTO warehouse_inventory (warehouse_id, product_id, current_stock, min_stock, max_stock, created_by, created_at, active)
VALUES
(1, 1, 100, 10, 300, 1, NOW(), 1),
(1, 2, 60, 5, 200, 1, NOW(), 1),
(2, 3, 150, 20, 400, 1, NOW(), 1),
(3, 4, 80, 10, 250, 1, NOW(), 1),
(4, 5, 200, 15, 350, 1, NOW(), 1);

INSERT INTO orders (client_id, employee_id, warehouse_id, order_date, status, total, created_by, created_at, active)
VALUES
(1, 5, 1, NOW(), 'placed', 650.00, 1, NOW(), 1),
(2, 4, 2, NOW(), 'placed', 480.00, 1, NOW(), 1),
(3, 3, 3, NOW(), 'placed', 300.00, 1, NOW(), 1),
(4, 2, 4, NOW(), 'placed', 200.00, 1, NOW(), 1),
(5, 1, 5, NOW(), 'placed', 1250.00, 1, NOW(), 1);

INSERT INTO order_details (order_id, product_id, quantity, unit_price, subtotal, created_by, created_at, active)
VALUES
(1, 1, 5, 120.00, 600.00, 1, NOW(), 1),
(1, 5, 1, 50.00, 50.00, 1, NOW(), 1),
(2, 2, 2, 180.00, 360.00, 1, NOW(), 1),
(3, 3, 3, 85.00, 255.00, 1, NOW(), 1),
(4, 4, 1, 250.00, 250.00, 1, NOW(), 1);
