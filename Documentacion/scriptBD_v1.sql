/*Autora: Vizuet Reyes Edna Isadora
Script para la creación de las tablas y llenado de catalogos
Version 1
*/
DROP TABLE mibd.cat_tipo_empleado;

CREATE  TABLE mibd.cat_tipo_empleado(
cve_tipo_empleado varchar(1) NOT NULL COMMENT 'Identificador del tipo de empleado'
,desc_tipo_empleado varchar(20) NOT NULL COMMENT 'Descripción del tipo de empleado'
,CONSTRAINT PK_cve_tipo_empleado PRIMARY KEY (cve_tipo_empleado)
)COMMENT "Catálogo del tipo de empleado ";

DROP TABLE mibd.cat_sucursal;

CREATE TABLE mibd.cat_sucursal(
id_sucursal numeric(1) NOT NULL COMMENT 'Identificador de la sucursal'
,nombre_sucursal varchar(40) NOT NULL COMMENT 'Nombre de la sucursal'
,CONSTRAINT PK_id_sucursal PRIMARY KEY (id_sucursal)
) COMMENT 'Catálogo de las sucursales';

/***/
DROP TABLE mibd.cat_tipo_servicio;

CREATE TABLE mibd.cat_tipo_servicio (
cve_tipo_servicio varchar(1) NOT NULL COMMENT 'Identificador del tipo de servicio'
,desc_tipo_servicio varchar(120) NOT NULL COMMENT 'Descripción del tipo de servicio'
,CONSTRAINT PK_cve_tipo_servicio PRIMARY KEY(cve_tipo_servicio)
) COMMENT 'Catálogo de los tipos de servicios';

DROP TABLE mibd.cat_servicio;

CREATE TABLE mibd.cat_servicio(
id_servicio int  NOT NULL AUTO_INCREMENT COMMENT 'Identificador del servicio'
,nombre_servicio varchar(200) NOT NULL COMMENT 'Nombre del servicio'
,cve_tipo_servicio varchar(1) NOT NULL COMMENT 'Identificador del tipo de servicio'
,duracion numeric(3) NOT NULL COMMENT 'Duración del servicio'
,precio numeric(4) NOT NULL COMMENT 'Precio del servicio'
,CONSTRAINT PK_id_servicio PRIMARY KEY(id_servicio)
,CONSTRAINT FK_cve_tipo_servicio1 FOREIGN KEY (cve_tipo_servicio) REFERENCES cat_tipo_servicio(cve_tipo_servicio)
)COMMENT 'Catálogo de los servicios';

DROP TABLE mibd.empleado;

CREATE TABLE mibd.empleado (
id_empleado int NOT NULL AUTO_INCREMENT COMMENT 'Identificador del empleado'
,nombre varchar(40) NOT NULL COMMENT 'Nombre del empleado'
,primer_apellido varchar(40) NOT NULL COMMENT 'Primer apellido del empleado'
,segundo_apellido varchar(40) COMMENT 'Segundo apellido del empleado'
,cve_tipo_empleado varchar(1) NOT NULL COMMENT 'Identificador del tipo de empleado'
,id_sucursal numeric(1) NOT NULL COMMENT 'Identificador de la sucursal'
,CONSTRAINT PK_id_empleado PRIMARY KEY (id_empleado)
,CONSTRAINT FK_cve_tipo_empleado1 FOREIGN KEY (cve_tipo_empleado) REFERENCES cat_tipo_empleado(cve_tipo_empleado)
,CONSTRAINT FK_id_sucursal1 FOREIGN KEY (id_sucursal) REFERENCES cat_sucursal(id_sucursal)
)COMMENT 'Tabla de empleados' ;

DROP TABLE mibd.cliente;

CREATE TABLE mibd.cliente (
id_cliente int NOT NULL AUTO_INCREMENT COMMENT 'Identificador del cliente'
,nombre varchar(40) NOT NULL COMMENT 'Nombre del cliente'
,primer_apellido varchar(40) NOT NULL COMMENT 'Primer apellido del cliente'
,segundo_apellido varchar(40) COMMENT 'Segundo apellido del cliente'
,domicilio varchar(250) COMMENT 'Domicilio del cliente'
,telefono numeric(10) COMMENT 'Teléfono del cliente'
,correo varchar(40) NOT NULL COMMENT 'Correo del cliente'
,CONSTRAINT PK_id_cliente PRIMARY KEY (id_cliente)
) COMMENT 'Tabla de clientes';

DROP TABLE mibd.cita;

CREATE TABLE mibd.cita (
id_cita int NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la cita'
,fecha DATETIME NOT NULL COMMENT 'Fecha en la que será la cita '
,id_sucursal numeric(1) NOT NULL COMMENT 'Identificador de la sucursal'
,id_cliente int NOT NULL  COMMENT 'Identificador del cliente'
,costo_total numeric(10) NOT NULL COMMENT 'Costo total por los servicios requeridos'
,estatus varchar(20) NOT NULL COMMENT 'Estatus de la cita'
,id_empleado int NOT NULL  COMMENT 'Identificador del estilista que se asigna para atender la cita'
,hora_inicio DATETIME NOT NULL COMMENT 'Hora de inicio de la cita'
,duracion_cita numeric(4) NOT NULL COMMENT 'Tiempo que dura la cita en minutos'
,CONSTRAINT PK_id_cita PRIMARY KEY (id_cita)
,CONSTRAINT FK_id_sucursal2 FOREIGN KEY (id_sucursal) REFERENCES cat_sucursal(id_sucursal)
,CONSTRAINT FK_id_cliente2 FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
,CONSTRAINT FK_id_empleado2 FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
) COMMENT 'Citas';

DROP TABLE mibd.detalle_cita;

CREATE TABLE mibd.detalle_cita(
id_cita int NOT NULL COMMENT 'Identificador de la cita'
,id_servicio int  NOT NULL COMMENT 'Identificador del servicio'
,CONSTRAINT PK_detalle_cita PRIMARY KEY (id_cita, id_servicio)
,CONSTRAINT FK_id_cita2 FOREIGN KEY (id_cita) REFERENCES cita(id_cita)
,CONSTRAINT FK_id_servicio2 FOREIGN KEY (id_servicio) REFERENCES cat_servicio(id_servicio)
) COMMENT 'Servicios que se pidieron por cita';

DROP TABLE mibd.pago;

CREATE TABLE mibd.pago(
id_cita int NOT NULL COMMENT 'Identificador de la cita'
,tipo_pago varchar(13) NOT NULL COMMENT 'Tipo de pago que se está realizando:ADELANTO o LIQUIDACION'
,monto_pago numeric(6) NOT NULL COMMENT 'Cantidad que se pagará'
,num_tarjeta numeric(16) NOT NULL COMMENT 'Número de la tarjeta con la que realizará el pago'
,fecha_vencimiento numeric(4) NOT NULL COMMENT 'Fecha de vencimiento de la tarjeta'
,nip numeric(3) NOT NULL COMMENT 'NIP  de la tarjeta'
,CONSTRAINT PK_pago PRIMARY KEY (id_cita,tipo_pago)
,CONSTRAINT FK_id_cita3 FOREIGN KEY (id_cita) REFERENCES cita(id_cita)
)COMMENT 'Tabla de pagos' ;

/**** LLENADO DE CATALOGOS ********************************************************************************/

INSERT INTO mibd.cat_tipo_empleado VALUES(	"G"	,	"Gerente"	);
INSERT INTO mibd.cat_tipo_empleado VALUES(	"E"	,	"Estilista"	);
INSERT INTO mibd.cat_tipo_empleado VALUES(	"A"	,	"Asistente"	);

select * from mibd.cat_tipo_empleado order by cve_tipo_empleado;

INSERT INTO mibd.cat_sucursal VALUES	(1,	"Sucursal norte"	);
INSERT INTO mibd.cat_sucursal VALUES	(2,	"Sucursal sur"	);
INSERT INTO mibd.cat_sucursal VALUES	(3,	"Sucursal oriente"	);
INSERT INTO mibd.cat_sucursal VALUES	(4,	"Sucursal poniente"	);

select * from mibd.cat_sucursal order by id_sucursal;

INSERT INTO mibd.cat_tipo_servicio VALUES	("A","Maquillaje y peinado"	);
INSERT INTO mibd.cat_tipo_servicio VALUES	("B","Manos y pies"	);
INSERT INTO mibd.cat_tipo_servicio VALUES	("C","Peluquería"	);

INSERT INTO mibd.cat_servicio VALUES(	1	,	"Premium Makeup de día	"	,	"A"	,	60	,	1400	);
INSERT INTO mibd.cat_servicio VALUES(	2	,	"Premium Makeup con aerógrafo	"	,	"A"	,	70	,	1650	);
INSERT INTO mibd.cat_servicio VALUES(	3	,	"Premium Makeup de noche	"	,	"A"	,	80	,	1750	);
INSERT INTO mibd.cat_servicio VALUES(	4	,	"Esmalte natural en mano	"	,	"B"	,	20	,	340	);
INSERT INTO mibd.cat_servicio VALUES(	5	,	"Esmalte natural en pies	"	,	"B"	,	20	,	350	);
INSERT INTO mibd.cat_servicio VALUES(	6	,	"Gel en manos	"	,	"B"	,	40	,	460	);
INSERT INTO mibd.cat_servicio VALUES(	7	,	"Gel en pies	"	,	"B"	,	45	,	480	);
INSERT INTO mibd.cat_servicio VALUES(	8	,	"Manicure para caballero	"	,	"B"	,	30	,	500	);
INSERT INTO mibd.cat_servicio VALUES(	9	,	"Manicure	"	,	"B"	,	45	,	500	);
INSERT INTO mibd.cat_servicio VALUES(	10	,	"Pedicure para caballero	"	,	"B"	,	65	,	520	);
INSERT INTO mibd.cat_servicio VALUES(	11	,	"Pedicure	"	,	"B"	,	65	,	520	);
INSERT INTO mibd.cat_servicio VALUES(	12	,	"Gel en manos con decoración	"	,	"B"	,	60	,	580	);
INSERT INTO mibd.cat_servicio VALUES(	13	,	"Acrílico y gel en manos	"	,	"B"	,	60	,	580	);
INSERT INTO mibd.cat_servicio VALUES(	14	,	"Manicure gel	"	,	"B"	,	55	,	580	);
INSERT INTO mibd.cat_servicio VALUES(	15	,	"Pedicure gel	"	,	"B"	,	75	,	620	);
INSERT INTO mibd.cat_servicio VALUES(	16	,	"Gel en manos y pies	"	,	"B"	,	70	,	650	);
INSERT INTO mibd.cat_servicio VALUES(	17	,	"Manicure y pedicure para caballero	"	,	"B"	,	100	,	720	);
INSERT INTO mibd.cat_servicio VALUES(	18	,	"Manicure y pedicure	"	,	"B"	,	120	,	720	);
INSERT INTO mibd.cat_servicio VALUES(	19	,	"Manicure y pedicure gel	"	,	"B"	,	140	,	880	);
INSERT INTO mibd.cat_servicio VALUES(	20	,	"Estilizado de extensiones	"	,	"C"	,	35	,	140	);
INSERT INTO mibd.cat_servicio VALUES(	21	,	"Aplicación de pestañas	"	,	"A"	,	20	,	210	);
INSERT INTO mibd.cat_servicio VALUES(	22	,	"Alaciado con plancha	"	,	"C"	,	50	,	490	);
INSERT INTO mibd.cat_servicio VALUES(	23	,	"Moldeado con secadora	"	,	"C"	,	50	,	490	);
INSERT INTO mibd.cat_servicio VALUES(	24	,	"Ondas surfer	"	,	"C"	,	60	,	490	);
INSERT INTO mibd.cat_servicio VALUES(	25	,	"Ondas vintage	"	,	"C"	,	60	,	490	);
INSERT INTO mibd.cat_servicio VALUES(	26	,	"Peinado sencillo	"	,	"C"	,	45	,	530	);
INSERT INTO mibd.cat_servicio VALUES(	27	,	"Peinado recogido	"	,	"C"	,	60	,	640	);
INSERT INTO mibd.cat_servicio VALUES(	28	,	"Maquillaje de día sin pestañas	"	,	"A"	,	50	,	800	);
INSERT INTO mibd.cat_servicio VALUES(	29	,	"Maquillaje de día con pestañas	"	,	"A"	,	60	,	920	);
INSERT INTO mibd.cat_servicio VALUES(	30	,	"Alto peinado	"	,	"C"	,	60	,	930	);
INSERT INTO mibd.cat_servicio VALUES(	31	,	"Maquillaje de noche sin pestañas	"	,	"A"	,	50	,	990	);
INSERT INTO mibd.cat_servicio VALUES(	32	,	"Maquillaje de noche con pestañas	"	,	"A"	,	60	,	1160	);
INSERT INTO mibd.cat_servicio VALUES(	33	,	"Estilizado de extensiones	"	,	"C"	,	35	,	140	);
INSERT INTO mibd.cat_servicio VALUES(	34	,	"Paquete maquillaje de día y Ondas	"	,	"A"	,	120	,	1150	);
INSERT INTO mibd.cat_servicio VALUES(	35	,	"Paquete maquillaje de día y peinado recogido	"	,	"A"	,	120	,	1350	);
INSERT INTO mibd.cat_servicio VALUES(	36	,	"Paquete maquillaje de noche y ondas	"	,	"A"	,	130	,	1380	);
INSERT INTO mibd.cat_servicio VALUES(	37	,	"Paquete maquillaje de noche y peinado recogido	"	,	"A"	,	130	,	1600	);
INSERT INTO mibd.cat_servicio VALUES(	38	,	"Corte individual	"	,	"C"	,	30	,	490	);
INSERT INTO mibd.cat_servicio VALUES(	39	,	"Paquete 2 cortes	"	,	"C"	,	50	,	890	);
INSERT INTO mibd.cat_servicio VALUES(	40	,	"Paquete 3 cortes	"	,	"C"	,	70	,	1090	);
INSERT INTO mibd.cat_servicio VALUES(	41	,	"Paquete 4 cortes	"	,	"C"	,	90	,	1190	);
INSERT INTO mibd.cat_servicio VALUES(	42	,	"Tratamiento de hidratación con Olaplex	"	,	"C"	,	30	,	390	);
