Create or replace view Ciclo_de_vida as
Select b.nombre_comercial as 'Banco de semillas' , o.Nombre_Comercial, p.Nombre_Comercial as proveedor, g.fecha_de_germinacion, s.fecha_de_siembra, ds.id_maceta, estado, fecha_de_cosecha
	from banco_de_semillas as b
    left join origen as o
	on b.id_Banco_semillas = o.id_Banco_semillas
    left join proveedores as p
    on o.id_Proveedor = p.id_Proveedor
    left join germinacion as g
    on o.id_Origen = g.id_origen
    left join siembras as s
    on g.id_Germinacion = s.id_Germinacion
    left join datos_siembras as ds
    on s.id_siembras = ds.id_siembra
    left join estado as e
    on ds.id_estado = e.id_estado
    left join cosecha as c
    on ds.id_Siembra = c.id_siembra AND ds.id_Maceta = c.id_maceta
    where Fecha_de_Germinacion is not null
    ;
    
select * from Ciclo_de_vida
;

Create or replace view Contacto as
select 'Banco de Semilla' as 'Tipo' , Nombre_comercial, Sitio_Web, null as 'instagram' from banco_de_semillas
union 
select 'Proveedores', Nombre_Comercial, Sitio_web, Instragram from proveedores
;

select * from Contacto;

Create or replace view Ultima_semana as
Select * from tracking_siembra
where Fecha >=
			(select max(Fecha) from tracking_siembra) - interval 
			 6 day
            ;
Select * from ultima_semana;