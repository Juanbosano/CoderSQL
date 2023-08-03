USE cultivo_indoor;
DROP Function if exists dias_de_vida;
DROP Function if exists ultimo_riego;
DELIMITER $$
CREATE function dias_de_vida (id_consulta  tinyint) -- Esta funcion calcula los dias de vida
Returns int 
READS SQL DATA 
BEGIN
		DECLARE Fecha_germinacion date; 
	    DECLARE Fecha_cosecha date;
		DECLARE Dias_de_vida int; 
		SET Fecha_germinacion = (select Fecha_de_Germinacion from germinacion
								where id_germinacion = id_consulta);
        SET Fecha_cosecha = (select Fecha_de_cosecha from cosecha
								where id_Siembra = id_consulta);
        Set Dias_de_vida = datediff (Fecha_cosecha, Fecha_germinacion); 
        
        RETURN Dias_de_vida;                        
END;
CREATE function ultimo_riego (id_consultas int, id_consultam  tinyint) -- Esta funcion calcula los dias de vida
Returns int 
READS SQL DATA 
BEGIN
		DECLARE ultima_fecha date; 
	    DECLARE ultima_fecha_riego date;
		DECLARE Dias_sin_riego int; 
		SET ultima_fecha = (select max(fecha) from tracking_siembra
							where id_siembra = id_consultas and  id_maceta = id_consultam);
        SET ultima_fecha_riego = (select max(Fecha) from tracking_siembra
								where Riego = 1 and id_siembra = id_consultas and  id_maceta = id_consultam);
        Set Dias_sin_riego = datediff (ultima_fecha, ultima_fecha_riego); 

        RETURN Dias_sin_riego;                        
END;
$$
Delimiter ;

select ultimo_riego (1,1)