USE `garcia-kuri-alejandro`;

CREATE ROLE IF NOT EXISTS role_admin_full;
CREATE ROLE IF NOT EXISTS role_almacen_rw;
CREATE ROLE IF NOT EXISTS role_almacen_r;

GRANT SELECT, INSERT, UPDATE, DELETE ON `garcia-kuri-alejandro`.* TO role_admin_full;
GRANT SELECT, INSERT, UPDATE ON `garcia-kuri-alejandro`.* TO role_almacen_rw;
GRANT SELECT ON `garcia-kuri-alejandro`.* TO role_almacen_r;

CREATE USER IF NOT EXISTS 'admin'@'%' IDENTIFIED BY 'admin123';
CREATE USER IF NOT EXISTS 'almacenista'@'%' IDENTIFIED BY 'almacenista123';
CREATE USER IF NOT EXISTS 'aux'@'%' IDENTIFIED BY 'aux123';

GRANT role_admin_full TO 'admin'@'%';
GRANT role_almacen_rw TO 'almacenista'@'%';
GRANT role_almacen_r TO 'aux'@'%';
