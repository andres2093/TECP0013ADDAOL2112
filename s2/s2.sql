use tienda;

-- Ejemplo 1
-- Buscar con like
select * from empleado where nombre like "M%";
select * from empleado where nombre like "%a";
select * from empleado where nombre like "M%a";
select * from empleado where nombre like "M_losa";
-- Pantalla
select * from empleado where nombre like "%Pantalla%";

-- Reto 1
-- ¿Qué artículos incluyen la palabra Pasta en su nombre?
select * from articulo where nombre like "%pasta%";
-- ¿Qué artículos incluyen la palabra Cannelloni en su nombre?
select * from articulo where nombre like "%Cannelloni%";
-- ¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
select * from articulo where nombre like "%-%";

-- Ejemplo 2
SELECT (1 + 7) * (10 / (6 - 4));

SELECT AVG(precio) FROM articulo;
SELECT AVG(precio) FROM articulo where cantidad = 1;

SELECT count(*) FROM articulo;

SELECT max(precio) FROM articulo;

SELECT min(precio) FROM articulo;

SELECT sum(precio) FROM articulo;

-- Reto 2