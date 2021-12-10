-- Ejemplo 1

show keys from venta;

-- Inner join
select * from empleado e
join puesto p
on e.id_puesto = p.id_puesto;

-- Left join
select * from empleado e
left join puesto p
on e.id_puesto = p.id_puesto;

-- Left join
select * from empleado e
right join puesto p
on e.id_puesto = p.id_puesto;

-- Reto 1
-- ¿Cuál es el nombre de los empleados que realizaron cada venta?
SELECT clave, nombre, apellido_paterno
FROM venta v
JOIN empleado e
  ON v.id_empleado = e.id_empleado
ORDER BY clave;
-- ¿Cuál es el nombre de los artículos que se han vendido?
SELECT clave, nombre
FROM venta v
JOIN articulo a
  ON v.id_articulo = a.id_articulo
ORDER BY clave;
-- ¿Cuál es el total de cada venta?
-- SELECT clave, round(sum(precio) + sum(iva), 2) as totalConIva 
SELECT clave, round(sum(precio),2) AS total
FROM venta v
JOIN articulo a
  ON v.id_articulo = a.id_articulo
GROUP BY clave
ORDER BY clave;

-- Ejemplo 2
SELECT v.clave, v.fecha, a.nombre as producto, a.precio, 
concat(e.nombre, ' ', e.apellido_paterno, ' ', e.apellido_materno) as empleado 
FROM venta v
JOIN empleado e
  ON v.id_empleado = e.id_empleado
JOIN articulo a
  ON v.id_articulo = a.id_articulo;
  
-- Ventas totales por empleado
SELECT sum(a.precio) as total, 
concat(e.nombre, ' ', e.apellido_paterno, ' ', e.apellido_materno) as empleado 
FROM venta v
JOIN empleado e
  ON v.id_empleado = e.id_empleado
JOIN articulo a
  ON v.id_articulo = a.id_articulo
group by v.id_empleado
order by total desc;

-- Creación de vista
create view tickets_071 as ( 
	SELECT v.clave, v.fecha, a.nombre as producto, a.precio, 
	concat(e.nombre, ' ', e.apellido_paterno, ' ', e.apellido_materno) as empleado 
	FROM venta v
	JOIN empleado e
	  ON v.id_empleado = e.id_empleado
	JOIN articulo a
	  ON v.id_articulo = a.id_articulo
);

-- Consultar vista
select * from tickets_071;

select clave, round(sum(precio), 2) as total
from tickets_071
group by clave
order by total desc;

-- Reto 2
-- Obtener el puesto de un empleado.
CREATE VIEW puestos_071 AS
SELECT concat(e.nombre, ' ', e.apellido_paterno), p.nombre
FROM empleado e
JOIN puesto p
  ON e.id_puesto = p.id_puesto;
  
SELECT * FROM puestos_071;
-- Saber qué artículos ha vendido cada empleado.
CREATE VIEW empleado_articulo_071 AS
SELECT v.clave, concat(e.nombre, ' ', e.apellido_paterno) as nombre, a.nombre as articulo
FROM venta v
JOIN empleado e
  ON v.id_empleado = e.id_empleado
JOIN articulo a
  ON v.id_articulo = a.id_articulo
ORDER BY v.clave;

SELECT * FROM  empleado_articulo_071;
-- Saber qué puesto ha tenido más ventas.
CREATE VIEW puesto_ventas_071 AS
SELECT p.nombre, count(v.clave) as total
FROM venta v
JOIN empleado e
  ON v.id_empleado = e.id_empleado
JOIN puesto p
  ON e.id_puesto = p.id_puesto
GROUP BY p.nombre;

SELECT * FROM puesto_ventas_071
ORDER BY total DESC
LIMIT 5;