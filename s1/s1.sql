-- EJEMPLO 1
-- Conectarse a la DB

-- EJEMPLO 2
-- Mostrar las bases de datos
/*
Mostrar las bases de datos
*/
SHOW DATABASES;

-- Seleccionar una DB
USE tienda;

-- Mostrar tablas
SHOW TABLES;

-- Mostrar campos
DESCRIBE articulo;

-- RETO 1
DESCRIBE empleado;
DESCRIBE puesto;
DESCRIBE venta;

-- Ejemplo 3
-- Consultar todos los registros de la tabla
SELECT * FROM empleado;

-- Consultar todos los registros de la tabla "Solo ciertos campos"
SELECT nombre, rfc FROM empleado;

-- Filtrar registros
SELECT * FROM empleado WHERE apellido_paterno = 'Risom';
SELECT nombre, apellido_paterno FROM empleado WHERE apellido_paterno = 'Risom';

SELECT * FROM empleado WHERE id_puesto > 100;

SELECT * FROM empleado WHERE id_puesto >= 100 AND id_puesto <= 200;
SELECT * FROM empleado WHERE id_puesto between 100 AND 200;

SELECT * FROM empleado WHERE id_puesto = 100 OR id_puesto = 200;
SELECT * FROM empleado WHERE id_puesto IN (100, 200);