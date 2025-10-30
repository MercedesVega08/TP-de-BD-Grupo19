/**------Ejercicio 6 b) ----------------*/

select u.nro_reclamo, u.cod_material, m.descripcion 
from (grupo19.reclamo  r left join 
grupo19.uso u 
on u.nro_reclamo = r.nro_reclamo 
left join grupo19.materiales m 
on u.cod_material = m.cod_material)  
group by u.nro_reclamo, u.cod_material, m.descripcion;

/**------Ejercicio 6 b) ----------------*/

select id_usuario, count(nro_reclamo) as cant_reclamo
from grupo19.reclamo
group by id_usuario
having count(nro_reclamo) > 1;

/**------Ejercicio 6 c) ----------------*/

SELECT d.nro_reclamo, count(d.nro_reclamo) as varios_em 
FROM grupo19.deriva d 
group by d.nro_reclamo 
having varios_em > 1;

/**----------- respuesta -----------*/

/**select * from grupo19.reclamo;
select * from grupo19.auditoria:*/
