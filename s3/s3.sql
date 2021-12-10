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

