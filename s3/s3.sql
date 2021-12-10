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