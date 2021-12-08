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
-- ¿Cuál es el promedio de salario de los puestos?
SELECT avg(salario) FROM puesto;
-- ¿Cuántos artículos incluyen la palabra Pasta en su nombre?
SELECT count(*) FROM articulo WHERE nombre LIKE '%pasta%';
-- ¿Cuál es el salario mínimo y máximo?
SELECT min(salario), max(salario) FROM puesto;
-- ¿Cuál es la suma del salario de los últimos cinco puestos agregados?
-- opc1
SELECT sum(salario)
FROM puesto
WHERE id_puesto >= (SELECT max(id_puesto) - 5 FROM puesto);
-- opc2
SELECT sum(salario) AS Suma_Salario_Ultimos_5 FROM (SELECT salario FROM puesto order by id_puesto DESC LIMIT 5) AS subconsulta;

-- Ejemplo 3
SELECT sum(precio) as sumaDePrecios FROM articulo;

-- select * from articulo where nombre = 'Pork - Smoked Back Bacon';

select nombre, sum(precio) as total from articulo group by nombre;

select nombre, count(*) as cantidad from articulo group by nombre order by cantidad desc;

select nombre, min(salario) as menor, max(salario) as mayor from puesto group by nombre;

-- Reto 3
-- ¿Cuántos registros hay por cada uno de los puestos?

-- ¿Cuánto dinero se paga en total por puesto?

-- ¿Cuál es el número total de ventas por vendedor?

-- ¿Cuál es el número total de ventas por artículo?


-- Ejemplo 4
select id_puesto from puesto where nombre = 'Junior executive'; -- (79, 152, 161, 392, 511,725, 948)

select * from empleado where id_puesto in (79, 152, 161, 392, 511,725, 948);

-- Ejemplo consultas anidadas
SELECT * FROM tienda.puesto;

SELECT * FROM tienda.puesto where nombre = "Account Coordinator"; -- (60, 97, 161, 217, 627, 671)
SELECT id_puesto FROM tienda.puesto where nombre = "Account Coordinator"; -- (60, 97, 161, 217, 627, 671)

select id_puesto, nombre from empleado where id_puesto in (60, 97, 162, 217, 627, 671);
select id_puesto, nombre from empleado where id_puesto in (SELECT id_puesto FROM tienda.puesto where nombre = "Account Coordinator");
-- Fin Ejemplo consultas anidadas

-- 
select salario from puesto where id_puesto = 1;

select nombre, apellido_paterno from empleado as e;

-- Sin alias
select nombre, apellido_paterno, (select salario from puesto where id_puesto = empleado.id_puesto) as salario from empleado;
-- Cona alias
select nombre, apellido_paterno, (select salario from puesto where id_puesto = e.id_puesto) as salario from empleado e;