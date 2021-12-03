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

-- Reto 2
-- ¿Cuál es el nombre de los empleados con el puesto 4?
select nombre from empleado where id_puesto = 4;
-- ¿Qué puestos tienen un salario mayor a $10,000?
select nombre, id_puesto, salario from puesto where salario > 10000;
-- ¿Qué articulos tienen un precio mayor a $1,000 y un iva mayor a 100?
select * from articulo where precio > 1000 and iva > 100;
-- ¿Qué ventas incluyen los artículos 135 o 963 y fueron hechas por los empleados 835 o 369?
SELECT * FROM venta WHERE (id_articulo = 135 OR id_articulo = 963) and (id_empleado = 835 OR id_empleado = 369);
SELECT * FROM venta WHERE id_articulo IN (135, 963) and id_empleado IN (835, 369);

-- Ejemplo 4 Ordenamientos y limites
select * from puesto order by salario desc;
select * from puesto order by salario asc;

select * from empleado limit 5;

-- Reto 3
-- obtener el top 5 de puestos por salarios
select * from puesto order by salario desc limit 5;