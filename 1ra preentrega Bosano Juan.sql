Create Database Cultivo_Indoor;

Use cultivo_indoor;
Create Table Metodo_de_germinacion (
id_metodo TINYINT NOT NULL UNIQUE AUTO_INCREMENT
, Metodo VARCHAR (120) NOT NULL UNIQUE 
, Primary Key (id_metodo)
);

Create Table Tipo_de_Planta (
id_tipo TINYINT NOT NULL UNIQUE AUTO_INCREMENT
, Tipo VARCHAR (120) NOT NULL UNIQUE 
, Primary Key (id_tipo)
);

Create Table Fotoperiodo (
id_Fotoperiodo TINYINT NOT NULL UNIQUE AUTO_INCREMENT
, TipodeFotoperiodo VARCHAR (120) NOT NULL UNIQUE 
, Primary Key (id_Fotoperiodo)
);

Create Table Banco_de_semillas (
id_Banco_semillas INT NOT NULL UNIQUE AUTO_INCREMENT
, Nombre_Comercial VARCHAR (120) NOT NULL 
, Sitio_Web VARCHAR (120)  
, Pais VARCHAR (120)  
, Primary Key (id_Banco_semillas)
);

Create Table Proveedores (
id_Proveedor INT NOT NULL UNIQUE AUTO_INCREMENT
, Nombre_Comercial VARCHAR (120) NOT NULL 
, Instragram VARCHAR (120)  
, Sitio_Web VARCHAR (120)  
, Celular VARCHAR (120)  
, Primary Key (id_Proveedor)
);

Create Table Origen (
id_Origen INT NOT NULL UNIQUE AUTO_INCREMENT
, Nombre_Comercial VARCHAR (120) NOT NULL 
, Seedfinder_URL VARCHAR (120)  
, id_Proveedor INT  
, id_Banco_semillas INT  
, Satividad Decimal (3,2)  
, Primary Key (id_Origen)
, FOREIGN KEY (id_Proveedor) References Proveedores (id_Proveedor)
, FOREIGN KEY (id_Banco_semillas) References Banco_de_semillas (id_Banco_semillas)
);

Create Table Germinacion (
id_Germinacion INT NOT NULL UNIQUE AUTO_INCREMENT
, Cant_germinada TINYINT NOT NULL 
, id_metodo TINYINT NOT NULL 
, id_tipo TINYINT NOT NULL 
, id_fotoperiodo TINYINT NOT NULL 
, id_origen INT NOT NULL 
, Primary Key (id_Germinacion)
, FOREIGN KEY (id_metodo) References Metodo_de_germinacion (id_metodo)
, FOREIGN KEY (id_tipo) References Tipo_de_Planta (id_tipo)
, FOREIGN KEY (id_fotoperiodo) References Fotoperiodo (id_Fotoperiodo)
, FOREIGN KEY (id_origen) References Origen (id_Origen)
);

Create Table Producto (
id_Producto INT NOT NULL UNIQUE AUTO_INCREMENT
, Nombre VARCHAR (120) NOT NULL 
, Funcion VARCHAR (120) NOT NULL 
, id_Proveedor TINYINT 
, Primary Key (id_Producto)
);

Create Table Siembras (
id_siembras INT NOT NULL UNIQUE AUTO_INCREMENT
, Fecha_de_Siembra DATE NOT NULL default(curdate())
, Cantidad_Sembrada TINYINT NOT NULL
, id_Germinacion INT NOT NULL
, Primary Key (id_siembras)
, FOREIGN KEY (id_Germinacion) References Germinacion (id_Germinacion)
);

Create Table Estado (
id_estado TINYINT NOT NULL UNIQUE AUTO_INCREMENT
, Estado VARCHAR (120) NOT NULL 
, Primary Key (id_estado)
);

Create Table Datos_Siembras (
id_siembra INT NOT NULL 
, id_Maceta TINYINT NOT NULL 
, id_estado TINYINT NOT NULL 
, Primary Key (id_siembra, id_Maceta)
, FOREIGN KEY (id_siembra) References Siembras (id_siembras)
, FOREIGN KEY (id_estado) References Estado (id_estado)
);

Create Table Coloración (
id_Color TINYINT NOT NULL UNIQUE AUTO_INCREMENT
, Color VARCHAR (120) NOT NULL 
, Primary Key (id_Color)
);

Create Table Tricomas (
id_Tricomas TINYINT NOT NULL UNIQUE AUTO_INCREMENT
, Descripcion VARCHAR (120) NOT NULL 
, Primary Key (id_Tricomas)
);

Create Table Sexo (
id_Sexo TINYINT NOT NULL UNIQUE AUTO_INCREMENT
, Descripcion VARCHAR (120) NOT NULL 
, Primary Key (id_Sexo)
);

Create Table Etapa_de_crecimiento (
id_etapa TINYINT NOT NULL UNIQUE AUTO_INCREMENT
, Descripcion VARCHAR (120) NOT NULL 
, Primary Key (id_etapa)
);


Create Table Tracking_Siembra (
id_siembra INT NOT NULL
, id_Maceta TINYINT NOT NULL 
, Fecha Date NOT NULL default(curdate())
, Horas_de_luz TINYINT NOT NULL 
, Riego TINYINT NOT NULL default(true)
, id_Producto INT  
, Altura Decimal (5,2) NOT NULL 
, Cantidad_de_Hojas INT  NOT NULL 
, id_Color TINYINT  NOT NULL 
, id_Sexo TINYINT  NOT NULL 
, Inflorecencias TINYINT  NOT NULL Default(true)
, id_Tricomas TINYINT  NOT NULL 
, id_Estado TINYINT  NOT NULL 
, id_etapa tinyint NOT NULL
, Novedad VARCHAR (255)  
, Descripcion VARCHAR (255)  
, FOREIGN KEY (id_siembra, id_Maceta) References Datos_Siembras (id_siembra, id_Maceta) on update cascade 
, FOREIGN KEY (id_Color) References Coloración (id_Color)
, FOREIGN KEY (id_Tricomas) References Tricomas (id_Tricomas)
, FOREIGN KEY (id_Sexo) References Sexo (id_Sexo)
, FOREIGN KEY (id_Estado) References Estado (Id_Estado)
, FOREIGN KEY (id_etapa) References Etapa_de_crecimiento (Id_Etapa)
);

Create Table Trazabilidad (
id_Siembra INT NOT NULL
, id_Maceta_anterior TINYINT NOT NULL 
, id_Maceta_Nueva TINYINT NOT NULL 
, Fecha_de_Traspaso Date NOT NULL default(curdate())
, FOREIGN KEY (id_siembra, id_Maceta_anterior) References Datos_Siembras (id_siembra, id_Maceta)
, FOREIGN KEY (id_siembra, id_Maceta_nueva) References Datos_Siembras (id_siembra, id_Maceta)
);

Create Table Efecto (
id_Efecto TINYINT NOT NULL UNIQUE AUTO_INCREMENT
, Descripcion VARCHAR (120) NOT NULL 
, Primary Key (id_Efecto)
);

Create Table Sabor (
id_Sabor TINYINT NOT NULL UNIQUE AUTO_INCREMENT
, Descripcion VARCHAR (120) NOT NULL 
, Primary Key (id_Sabor)
);

Create Table Cosecha (
id_Siembra INT NOT NULL
, id_Maceta TINYINT  NOT NULL 
, Numero_de_Corte TINYINT  NOT NULL 
, Fecha_de_Cosecha Date  NOT NULL default(curdate())
, Gramos_Cosechas Decimal (5,2) NOT NULL 
, id_Sabor TINYINT  NOT NULL 
, id_Efecto TINYINT  NOT NULL 
, FOREIGN KEY (id_Siembra, id_Maceta) References Datos_Siembras (id_siembra, id_Maceta)
, FOREIGN KEY (id_Efecto) References Efecto (id_Efecto)
, FOREIGN KEY (id_Sabor) References Sabor (id_Sabor)
);
