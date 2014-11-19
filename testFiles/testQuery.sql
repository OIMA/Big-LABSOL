select 
d.id_sector as sector,
d.id_dependencia as dependencia,
ef.s03c_objeti as eje,
ef.s04c_progra as linea,
ef.s05c_subpro as estrategia,
p.no_proyecto as proyecto,
p.nombre as nombre_proyecto,
po.s11c_compon as componente,
po.s25c_accion as accion,
o.consxdep as consxdep,
o.obra as num_obra,
o.descripcion as descripcion,
mp.id_finanzas as municipio,
lo.id_finanzas as localidad,
o.fecha_inicio as fecha_inicio,
o.fecha_fin as fecha_fin,
o.modalidad as modalidad,
o.retencion as retencion,
o.programa_poa as pro_poa,
o.subprograma_poa as subpro_poa,
o.u_medida as unidad_medida,
o.cantidad as cantidad,
o.ben_h as ben_h,
o.ben_m as ben_m,
mp.id_reg_finanzas as region,
mar.descripcion as marginacion
from oficio_aprobacion oa 
inner join detalle_oficio dof on(dof.id_oficio = oa.id_oficio)
inner join proyectos p on(p.id_proyecto = dof.id_proyecto)
inner join dependencias d on (d.id_dependencia = p.id_dependencia)
inner join obras o on (o.id_obra = dof.id_poa02)
inner join poa02_origen po on (po.id_poa02 = o.obra)
inner join estados_financieros ef on (
ef.	s01c_sector = d.id_sector and
ef.s02c_depend = d.id_dependencia and 
ef.s06c_proyec = po.s06c_proyec and
ef.s07c_partid = po.s07c_partid and
ef.s08c_origen = po.s08c_origen and
ef.s11c_compon = po.s11c_compon and
ef. s25c_accion = po.s25c_accion
)
inner join municipios mp on (o.municipio = mp.id_finanzas)
inner join localidades lo on (o.localidad = lo.id_finanzas and o.municipio = mp.id_finanzas)
inner join marginacion mar on (mar.id_marginacion = lo.id_marginacion)
where oa.estatus_sefin = 0 and oa.tipo = 0 and p.anual_pr = 2014 and d.id_dependencia = 12 group by oa.no_oficio ASC;--bjhdgfkdfh