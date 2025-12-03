USE garcia-kuri-alejandro;

CREATE TABLE IF NOT EXISTS employees (
    employee_id      INT AUTO_INCREMENT PRIMARY KEY,
    first_name       VARCHAR(100) NOT NULL,
    last_name        VARCHAR(100) NOT NULL,
    middle_name      VARCHAR(100),
    email            VARCHAR(150) NOT NULL UNIQUE,
    phone            VARCHAR(20),
    position         VARCHAR(100),

    created_by       INT,
    created_at       DATETIME,
    updated_by       INT,
    updated_at       DATETIME,
    active           TINYINT(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS warehouses (
    warehouse_id     INT AUTO_INCREMENT PRIMARY KEY,
    name             VARCHAR(100) NOT NULL,
    city             VARCHAR(100) NOT NULL,
    address          VARCHAR(200),
    phone            VARCHAR(20),

    created_by       INT,
    created_at       DATETIME,
    updated_by       INT,
    updated_at       DATETIME,
    active           TINYINT(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS suppliers (
    supplier_id      INT AUTO_INCREMENT PRIMARY KEY,
    name             VARCHAR(150) NOT NULL,
    tax_id           VARCHAR(20),
    phone            VARCHAR(20),
    email            VARCHAR(150),
    address          VARCHAR(200),

    created_by       INT,
    created_at       DATETIME,
    updated_by       INT,
    updated_at       DATETIME,
    active           TINYINT(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS clients (
    client_id        INT AUTO_INCREMENT PRIMARY KEY,
    name             VARCHAR(150) NOT NULL,
    client_type      VARCHAR(50),
    phone            VARCHAR(20),
    email            VARCHAR(150),
    address          VARCHAR(200),

    created_by       INT,
    created_at       DATETIME,
    updated_by       INT,
    updated_at       DATETIME,
    active           TINYINT(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS products (
    product_id       INT AUTO_INCREMENT PRIMARY KEY,
    code             VARCHAR(50) NOT NULL UNIQUE,
    name             VARCHAR(150) NOT NULL,
    description      VARCHAR(255),
    sale_price       DECIMAL(10,2) NOT NULL,
    unit             VARCHAR(50),

    created_by       INT,
    created_at       DATETIME,
    updated_by       INT,
    updated_at       DATETIME,
    active           TINYINT(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS product_supplier (
    product_supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id          INT NOT NULL,
    supplier_id         INT NOT NULL,
    supplier_code       VARCHAR(50),
    purchase_price      DECIMAL(10,2),

    created_by          INT,
    created_at          DATETIME,
    updated_by          INT,
    updated_at          DATETIME,
    active              TINYINT(1) NOT NULL DEFAULT 1,

    CONSTRAINT fk_product_supplier_product
        FOREIGN KEY (product_id) REFERENCES products(product_id),
    CONSTRAINT fk_product_supplier_supplier
        FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id),

    CONSTRAINT uq_product_supplier UNIQUE (product_id, supplier_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS warehouse_inventory (
    inventory_id    INT AUTO_INCREMENT PRIMARY KEY,
    warehouse_id    INT NOT NULL,
    product_id      INT NOT NULL,
    current_stock   INT NOT NULL DEFAULT 0,
    min_stock       INT NOT NULL DEFAULT 0,
    max_stock       INT,

    created_by      INT,
    created_at      DATETIME,
    updated_by      INT,
    updated_at      DATETIME,
    active          TINYINT(1) NOT NULL DEFAULT 1,

    CONSTRAINT fk_inventory_warehouse
        FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id),
    CONSTRAINT fk_inventory_product
        FOREIGN KEY (product_id) REFERENCES products(product_id),

    CONSTRAINT uq_inventory_warehouse_product UNIQUE (warehouse_id, product_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS orders (
    order_id        INT AUTO_INCREMENT PRIMARY KEY,
    client_id       INT NOT NULL,
    employee_id     INT NOT NULL,
    warehouse_id    INT NOT NULL,
    order_date      DATETIME NOT NULL,
    status          VARCHAR(20),
    total           DECIMAL(10,2) NOT NULL DEFAULT 0.00,

    created_by      INT,
    created_at      DATETIME,
    updated_by      INT,
    updated_at      DATETIME,
    active          TINYINT(1) NOT NULL DEFAULT 1,

    CONSTRAINT fk_orders_client
        FOREIGN KEY (client_id) REFERENCES clients(client_id),
    CONSTRAINT fk_orders_employee
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    CONSTRAINT fk_orders_warehouse
        FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS inventory_movements (
    movement_id     INT AUTO_INCREMENT PRIMARY KEY,
    product_id      INT NOT NULL,
    warehouse_id    INT NOT NULL,
    employee_id     INT NOT NULL,
    movement_type   ENUM('IN','OUT') NOT NULL,
    movement_date   DATETIME NOT NULL,
    quantity        INT NOT NULL,
    reference       VARCHAR(100),
    notes           VARCHAR(255),

    created_by      INT,
    created_at      DATETIME,
    updated_by      INT,
    updated_at      DATETIME,
    active          TINYINT(1) NOT NULL DEFAULT 1,

    CONSTRAINT fk_movements_product
        FOREIGN KEY (product_id) REFERENCES products(product_id),
    CONSTRAINT fk_movements_warehouse
        FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id),
    CONSTRAINT fk_movements_employee
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS order_details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id        INT NOT NULL,
    product_id      INT NOT NULL,
    quantity        INT NOT NULL,
    unit_price      DECIMAL(10,2) NOT NULL,
    subtotal        DECIMAL(10,2) NOT NULL,

    created_by      INT,
    created_at      DATETIME,
    updated_by      INT,
    updated_at      DATETIME,
    active          TINYINT(1) NOT NULL DEFAULT 1,

    CONSTRAINT fk_order_details_order
        FOREIGN KEY (order_id) REFERENCES orders(order_id),
    CONSTRAINT fk_order_details_product
        FOREIGN KEY (product_id) REFERENCES products(product_id)
) ENGINE=InnoDB;

SET FOREIGN_KEY_CHECKS = 1;
