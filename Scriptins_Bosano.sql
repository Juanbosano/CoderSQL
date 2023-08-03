Insert Into metodo_de_germinacion Values 
(Null, 'Tupper en Humedad')
, (Null,'Agua')
, (Null,'Directo en Tierra')
, (Null, 'Germinador')
;

INSERT into Tipo_de_Planta Values
(null, 'Regular')
, (null, 'Feminizada')
, (null, 'CBD')
;

Insert into fotoperiodo values
(null, 'Fotoperiodica')
,(null, 'Automatica')
;

Insert into banco_de_semillas values
(null, 'Desconocido', null, null)
,(null, 'Sweet Seeds', 'https://sweetseeds.es/es/', 'España')
,(null, 'BSF', 'https://bsfseeds.com/', 'España')
,(null, 'Ripper Seeds', 'https://www.ripperseeds.com/es/' , 'España')
, (null, 'Dutch Passion', 'https://dutch-passion.com/','Paises Bajos')
, (null, 'Humboldt Seeds', 'https://www.humboldtseeds.net/', 'Estados Unidos')
;

Insert into proveedores values
(null, 'No tiene', null, null,null)
,(null, 'Ojitos Rojos', 'https://www.instagram.com/semasojitosrojos/', 'https://www.ojitosrojos.com/', null)
,(null, 'Semillas Rolla', 'https://www.instagram.com/semillas.rolla/', null, '1123576394')
,(null, 'Tabu Growshoop', 'https://www.instagram.com/tabugrowshop' , 'https://tabugrowshop.com.ar/', '1123572495')
;

insert into origen values
(null, 'Desconocido',null, '1', '1', null, '1' , '1')
;

insert into origen (id_origen, Nombre_Comercial, Seedfinder_URL, id_Proveedor, id_banco_semillas, Satividad, id_tipo, id_fotoperiodo)
select null, 'CBD AUTO WHITE WIDOW','https://es.seedfinder.eu/strain-info/CBD_Auto_White_Widow/Dutch_Passion/', id_proveedor, 
	(select id_banco_semillas
	from banco_de_semillas 
    where Nombre_Comercial = 'Dutch Passion')
			, null
			,(Select id_tipo
			from Tipo_de_Planta
			where tipo = 'CBD')
				,(select id_fotoperiodo
				from fotoperiodo 
				where tipodefotoperiodo = 'Automatica')
from proveedores 
where Nombre_Comercial = 'Ojitos Rojos'
;

insert into origen (id_origen, Nombre_Comercial, Seedfinder_URL, id_Proveedor, id_banco_semillas, Satividad, id_tipo, id_fotoperiodo)
select null, 'Gorilla Banana','https://es.seedfinder.eu/strain-info/Gorilla_Banana/BSF_Seeds/', id_proveedor, 
	(select id_banco_semillas
	from banco_de_semillas 
    where Nombre_Comercial = 'BSF')
			, 0.40
			,(Select id_tipo
			from Tipo_de_Planta
			where tipo = 'Feminizada')
				,(select id_fotoperiodo
				from fotoperiodo 
				where tipodefotoperiodo = 'Fotoperiodica')
from proveedores 
where Nombre_Comercial = 'Semillas Rolla'
;

insert into  Germinacion values
(null, '2','1', '1','2023-05-15')
,(null, '2','1', '3','2022-12-04')
,(null, '2','1', '1','2023-06-08')
;

insert into  Producto values
(null, 'Namaste Amazonia', 'Raices', '3')
, (null, 'Namaste Oro Negro', 'Crecimiento', '3')
, (null, 'Namaste Tricomas', 'Producion', '3')
, (null, 'Namaste Flora Booster', 'Floracion', '3')
, (null, 'Namaste Bioneem', 'Control de Plagas', '3')
;

insert into  Siembras values
(null, '2023-05-21', '2','1')
,(null, '2023-06-10','2','3')
;

insert into Estado values
(null, 'Muerta')
, (null, 'No se distingue')
, (null, 'Muy debil')
, (null, 'Debil')
, (null, 'Normal')
, (null, 'Fuerte')
, (null, 'Cosechada')
, (null, 'Enferma')
;

insert into datos_siembras values
(1, 1, 6)
, (1, 2, 6)
, (2, 3, 6)
, (2, 4, 6)
;

insert into Coloracion values
(null, 'Verde intenso')
,(null, 'Verde claro')
,(null, 'Verde')
,(null, 'Naranja')
,(null, 'Purpura')
;

insert into Tricomas values
(null, 'No se distingue')
, (null, 'Transparentes')
, (null, 'Blancos')
, (null, 'Blancos y ambar')
, (null, 'Ambar')
;

insert into Sexo values
(null, 'No se distingue')
, (null, 'Femenino')
, (null, 'Masculino')
, (null, 'Hermafrodita')
;

insert into etapa_de_crecimiento values
(null, 'Plántula')
,(NULL, 'Vegetativo')
,(NULL, 'Floración')
;

INSERT INTO Tracking_Siembra (id_siembra, id_Maceta, Fecha, Horas_de_luz, Riego, id_Producto, Altura, id_Color, id_Sexo, Inflorecencias, id_Tricomas, id_Estado, id_etapa, Novedad, Descripcion)
VALUES
(1, 1, '2023-05-21', 16, 1, 1, 5.0, 1, 1, 0, 1, 4, 1, NULL, 'Plántula recién germinada.')
,(1, 1, '2023-05-22', 16, 1, 1, 6.0, 1, 1, 0, 1, 4, 1, NULL, 'Crecimiento lento pero constante.')
,(1, 1, '2023-05-23', 16, 1, 1, 7.0, 1, 1, 0, 1, 4, 1, NULL, 'Continúa creciendo bien.')
,(1, 1, '2023-05-24', 16, 1, 1, 8.0, 1, 1, 0, 1, 4, 1, NULL, 'Aparecen hojas nuevas.')
,(1, 1, '2023-05-25', 16, 1, 1, 10.0, 1, 1, 0, 1, 4, 1, NULL, 'Crecimiento saludable.')
,(1, 1, '2023-05-26', 16, 1, 1, 11.0, 1, 1, 0, 1, 4, 1, NULL, 'Altura alcanzada 11 cm, hojas verdes intensas.')
,(1, 1, '2023-05-27', 16, 1, 1, 12.0, 1, 1, 0, 1, 4, 1, NULL, 'Crecimiento constante.')
,(1, 1, '2023-05-28', 16, 1, 1, 13.0, 1, 1, 0, 1, 4, 1, NULL, 'Continúa desarrollándose.')
,(1, 1, '2023-05-29', 16, 1, 1, 14.0, 1, 1, 0, 1, 4, 1, NULL, 'Planta sana, crecimiento normal.')
,(1, 1, '2023-05-30', 16, 1, 1, 15.0, 1, 1, 0, 1, 4, 1, NULL, 'Altura alcanzada 15 cm, hojas verdes intensas.')
,(1, 1, '2023-05-31', 16, 1, 1, 16.0, 1, 1, 0, 1, 4, 1, NULL, 'Crecimiento constante y saludable.')
,(1, 1, '2023-06-01', 16, 1, 2, 18.0, 1, 1, 0, 1, 4, 2, 'Vegetativo', 'Inicia la etapa vegetativa.')
,(1, 1, '2023-06-02', 16, 1, 2, 20.0, 1, 1, 0, 1, 4, 2, NULL, 'Continúa creciendo de forma saludable.')
,(1, 1, '2023-06-03', 16, 1, 2, 22.0, 1, 1, 0, 1, 4, 2, NULL, 'Crecimiento constante, hojas verdes claras.')
,(1, 1, '2023-06-04', 16, 1, 2, 25.0, 1, 1, 0, 1, 4, 2, NULL, 'Altura alcanzada 25 cm, apariencia saludable.')
,(1, 1, '2023-06-05', 16, 1, 2, 28.0, 1, 1, 0, 1, 4, 2, NULL, 'Desarrollo de ramas laterales.')
,(1, 1, '2023-06-06', 16, 1, 2, 30.0, 1, 1, 0, 1, 4, 2, NULL, 'Planta robusta y de buen tamaño.')
,(1, 1, '2023-06-07', 16, 1, 2, 33.0, 1, 1, 0, 1, 4, 2, NULL, 'Crecimiento saludable y vigoroso.')
,(1, 1, '2023-06-08', 16, 1, 2, 36.0, 1, 1, 0, 1, 4, 2, NULL, 'Continúa vegetando, hojas verdes intensas.')
,(1, 1, '2023-06-09', 16, 1, 2, 40.0, 1, 1, 0, 1, 4, 2, NULL, 'Altura alcanzada 40 cm, hojas grandes y sanas.')
,(1, 1, '2023-06-10', 16, 1, 2, 43.0, 1, 1, 0, 1, 4, 2, NULL, 'Crecimiento constante, se añadió Namaste Oro Negro.')
,(1, 1, '2023-06-11', 12, 1, 3, 45.0, 1, 1, 0, 1, 4, 3, 'Floracion', 'Comienzo de la etapa de floración.')
,(1, 1, '2023-06-12', 12, 1, 3, 48.0, 1, 1, 0, 1, 4, 3, NULL, 'Crecimiento de cogollos incipientes.')
,(1, 1, '2023-06-13', 12, 1, 3, 51.0, 1, 1, 0, 1, 4, 3, NULL, 'Continúa floración, se añadió Namaste Tricomas.')
,(1, 1, '2023-06-14', 12, 1, 3, 54.0, 1, 1, 0, 1, 4, 3, NULL, 'Cogollos se desarrollan, altura 54 cm.')
,(1, 1, '2023-06-15', 12, 1, 3, 57.0, 1, 1, 0, 1, 4, 3, NULL, 'Floración en progreso, plantación sana.')
,(1, 1, '2023-06-16', 12, 1, 3, 60.0, 1, 1, 0, 1, 4, 3, NULL, 'Cogollos engordando, se añadió Namaste Bioneem.')
,(1, 1, '2023-06-17', 12, 1, 3, 63.0, 1, 1, 0, 1, 4, 3, NULL, 'Floración avanzada, altura 63 cm.')
,(1, 1, '2023-06-18', 12, 1, 3, 66.0, 1, 1, 0, 1, 4, 3, NULL, 'Continúa floración, cogollos con tricomas blancos.')
,(1, 1, '2023-06-19', 12, 1, 3, 69.0, 1, 1, 0, 1, 4, 3, NULL, 'Floración en su punto, se añadió Flora Booster.')
,(1, 1, '2023-06-20', 12, 0, 3, 72.0, 1, 1, 0, 1, 4, 3, 'Cosecha', 'Altura alcanzada 72 cm, cogollos con tricomas ámbar.')
;

insert into efecto values
(null, 'Psicoestimulante')
, (null, 'Relajante')
;

insert into sabor values
(null, 'Picante')
, (null, 'Dulce')
, (null, 'Acido')
, (null, 'Amargo')
;

Insert into cosecha values
(1, 1, 1, '2023-06-20', 40.00, 2, 1)
;

