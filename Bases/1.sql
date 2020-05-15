DROP DATABASE IF EXISTS concesionario;
CREATE DATABASE concesionario CHARSET utf8mb4;
USE concesionario;

DROP TABLE IF EXISTS concesionario;
CREATE TABLE concesionario (
       CIF varchar(9) NOT NULL PRIMARY KEY,
       nombre varchar(20) NOT NULL,
       ubicación varchar(20) NOT NULL
);
INSERT INTO concesionario VALUES
('B12345678','DAB','Madrid');

DROP TABLE IF EXISTS garantia;
CREATE TABLE garantia (
	id_garantia VARCHAR(5) NOT NULL PRIMARY KEY,
	tiempo_inicio DATE DEFAULT NULL,
	tiempo_final DATE DEFAULT NULL
);
INSERT INTO garantia VALUES
 ('1','2017-08-22','2022-08-22'),
 ('2','2018-12-30','2023-12-30'),
 ('3','2020-05-01','2025-05-01'),
 ('4','2019-06-09','2024-06-09'),
 ('5','2017-03-12','2022-03-12'); 

DROP TABLE IF EXISTS usuario;
CREATE TABLE usuario(
	DNI VARCHAR(9) NOT NULL PRIMARY KEY,
	Presupuesto INT UNSIGNED NOT NULL,
	Nombre VARCHAR(25) NOT NULL,
	Apellidos VARCHAR(25) NOT NULL
);

INSERT INTO usuario VALUES
 ('34353685M','2100000','Julio','Ruiz Gomez'),
 ('34859985B','2000000','Diego','Sanchez Rodriguez'),
 ('50688585J','450000','Carlos','Perez Ruiz'),
 ('53585586X','450000','Laura','Garcia Diaz'),
 ('63585253P','45000','Paco','Iglesias Sanz'),
 ('52487123V','130000','Ana','Crespo Martinez'),
 ('15245278C','10000000','Julian','Gil Muñoz'),
 ('34578514L','80000','Alvaro','Añon Marco'),
 ('56874528B','135000','Pepe','Romero Perez'),
 ('36584528B','200000','Jaime','Lorenzo Diego'),
 ('63585223P','120000','Jorge','Cuesta Santos'),
 ('12334355T','23000','Paco', 'Sanz Sanz'),
 ('98765432S','15500','Lucia', 'Jimenez Mar'),
 ('32243243R','60000', 'Jaime', 'Martin Isoler');

DROP TABLE IF EXISTS marca; 
CREATE TABLE marca (
	id_marca VARCHAR(20) NOT NULL PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL,
	pais VARCHAR(3) NOT NULL
);
INSERT INTO marca VALUES
 ('1','Lamborghini','IT'),
 ('2','Nissan','JP'),
 ('3','BMW','DEU'),
 ('4','Mercedes','DEU'),
 ('5','Ford','USA'),
 ('6','Ferrari','IT'),
 ('7','Jaguar','UK'),
 ('8','Chevrolet','USA'),
 ('9','Tesla','USA'),
 ('10','Porsche','DEU'),
 ('11','Seat','ES'),
 ('12','Peugeot','FR'),
 ('13','Koenigsegg','SE'),
 ('14','Kawasaki','JP'),
 ('15','Ducati','IT'),
 ('16','Harley-Davidson','USA'),
 ('17','Suzuki','JP'),
 ('18','Ktm','AT');
 
 


DROP TABLE IF EXISTS extra_moto;
CREATE TABLE extra_moto(
	id_extramoto VARCHAR(20) NOT NULL PRIMARY KEY,
	radio BOOLEAN,
	puño_calefactable BOOLEAN,
	alforjas BOOLEAN,
	neumaticos_antipinchazos BOOLEAN
);
INSERT INTO extra_moto VALUES
('1',TRUE,FALSE,FALSE,TRUE),
('2',TRUE,TRUE,FALSE,TRUE),
('3',TRUE,TRUE,TRUE,FALSE),
('4',TRUE,FALSE,FALSE,FALSE),
('5',TRUE,TRUE,TRUE,TRUE),
('6',TRUE,FALSE,TRUE,FALSE);

DROP TABLE IF EXISTS motor;
CREATE TABLE motor (
	id_motor VARCHAR(20) NOT NULL PRIMARY KEY,
	caballos VARCHAR(20),
	combustible VARCHAR(10) NOT NULL,
	cilindros VARCHAR(20),
	consumo_litros INT UNSIGNED NOT NULL
);
INSERT INTO motor VALUES
 ('1','100cv','diesel','No dispone','25'),
 ('2','250cv','electrico','No dispone','50'),
 ('3','800cv','gasolina','No dispone','70'),
 ('4','No dispone','diesel','125cc','35'),
 ('5','No dispone','electrico','600cc','45'),
 ('6','No dispone','gasolina','1000cc','60'),
 ('7','No dispone','gasolina','1000cc','60');

DROP TABLE IF EXISTS modelo;
CREATE TABLE modelo (
	id_modelo VARCHAR(30) NOT NULL PRIMARY KEY,
	id_marca VARCHAR(20) NOT NULL,
	id_motor VARCHAR(20) NOT NULL,
	nombre VARCHAR(20) NOT NULL, 
	descripcion VARCHAR(50) NOT NULL,
	FOREIGN KEY(id_marca) REFERENCES marca(id_marca),
	FOREIGN KEY(id_motor) REFERENCES motor(id_motor)
);
INSERT INTO modelo VALUES
('1','1','3','Urus', 'Suv'),
('2','1','3','Aventador', 'Deportivo'),
('3','2','2','Gtr', 'Deportivo'),
('4','2','1','Juke', 'Comun'),
('5','3','7','S1000rr','Moto de lujo'),
('6','3','2','M4','Deportivo'),
('7','4','1','B180', 'Comun'),
('8','4','2','C63AMG','Deportivo'),
('9','5','1','Fiesta','Comun'),
('10','5','3','GT','Deportivo'),
('11','6','3','LaFerrari','Lujo'),
('12','6','3','488','Deportivo'),
('13','7','2','XF','Deportivo'),
('14','7','2','F-Pace','Suv'),
('15','8','1','Malibu','Comun'),
('16','8','2','camaro','Deportivo'),
('17','9','4','Model X','Elon Car'),
('18','9','4','Model S','Elon Car'),
('19','10','2','Panamera','Deportivo'),
('20','10','2','Cayenne','Suv'),
('21','11','2','Leon cupra','Deportivo'),
('22','11','1','Ibiza','Comun'),
('23','12','1','308','Comun'),
('24','13','3','Agera RS','Lujo'),
('25','14','6','Z600','Naked'),
('26','15','7','Panigale','Moto de lujo'),
('27','16','7','Iron1200','Travesia'),
('28','17','6','GSX','Deportivo'),
('29','18','5','Duke','Comun');


DROP TABLE IF EXISTS motos;
CREATE TABLE motos (
	id_moto VARCHAR(7) NOT NULL PRIMARY KEY,
	id_extramoto VARCHAR(20) NOT NULL,
	id_garantia VARCHAR(15) NOT NULL,
	CIF VARCHAR(9) NOT NULL,
	id_modelo VARCHAR(30) NOT NULL,
	tipo VARCHAR(20) NOT NULL,
	precio INT UNSIGNED NOT NULL,
	velocidad_max INT UNSIGNED NOT NULL,
	FOREIGN KEY(id_extramoto) REFERENCES extra_moto(id_extramoto),
	FOREIGN KEY(id_garantia) REFERENCES garantia(id_garantia),
	FOREIGN KEY(CIF) REFERENCES concesionario(CIF),
	FOREIGN KEY(id_modelo) REFERENCES modelo(id_modelo) 	
);
INSERT INTO motos VALUES
 ('1','1','1','B12345678','5','Deportiva','21000','300'),
 ('2','2','2','B12345678','25','Deportiva','15000','250'),
 ('3','3','3','B12345678','27','Viajera','12000','220'),
 ('4','4','4','B12345678','29','Comun','5000','150'),
 ('5','5','5','B12345678','28','Deportiva','7500','200'),
 ('6','6','2','B12345678','26','Deportiva','25000','300');
 
 
DROP TABLE IF EXISTS extra_coche;
CREATE TABLE extra_coche(
	id_extracoche VARCHAR(20) NOT NULL PRIMARY KEY,
	techo_solar BOOLEAN,
	asientos_de_cuero BOOLEAN,
	volante_deportivo BOOLEAN,
	faros_led BOOLEAN,
	navegador BOOLEAN
);
INSERT INTO extra_coche VALUES
('1',FALSE,FALSE,FALSE,TRUE,FALSE),
('2',TRUE,TRUE,FALSE,TRUE,FALSE),
('3',FALSE,TRUE,TRUE,FALSE,TRUE),
('4',TRUE,FALSE,FALSE,FALSE,TRUE),
('5',TRUE,TRUE,TRUE,TRUE,FALSE),
('6',FALSE,FALSE,TRUE,FALSE,TRUE);


DROP TABLE IF EXISTS coches;
CREATE TABLE coches(
	id_coche VARCHAR(20) NOT NULL PRIMARY KEY,
	id_extracoche VARCHAR(20) NOT NULL,
	id_garantia VARCHAR(15) NOT NULL,
	id_modelo VARCHAR(30) NOT NULL,
	CIF VARCHAR(9) NOT NULL,
	tipo VARCHAR(10) NOT NULL,
	precio INT NOT NULL,
	plazas INT NOT NULL,
        velocidad_maxima INT NOT NULL,
	FOREIGN KEY(id_extracoche) REFERENCES extra_coche(id_extracoche),
	FOREIGN KEY(CIF) REFERENCES concesionario(CIF),
	FOREIGN KEY(id_modelo) REFERENCES modelo(id_modelo),
	FOREIGN KEY(id_garantia) REFERENCES garantia(id_garantia)
 	
);
INSERT INTO coches VALUES
 ('1','6','5','1','B12345678','Suv','250000','5','250'),
 ('2','5','4','2','B12345678','Deportivo','300000','2','280'),
 ('3','4','3','3','B12345678','Deportivo','100000','4','230'),
 ('4','3','2','4','B12345678','Comun','15000','5','120'),
 ('5','2','1','6','B12345678','Deportivo','40000','4','220'),
 ('6','1','5','7','B12345678','Comun','12000','5','110'),
 ('7','1','4','8','B12345678','Deportivo','60000','5','200'),
 ('8','2','3','9','B12345678','Comun','8000','5','120'),
 ('9','3','2','10','B12345678','Deportivo','150000','2','260'),
 ('10','4','1','11','B12345678','Lujo','1500000','2','300'),
 ('11','5','2','12','B12345678','Deportivo','200000','2','250'),
 ('12','6','1','13','B12345678','Deportivo','45000','2','210'),
 ('13','6','5','14','B12345678','Suv','30000','5','160'),
 ('14','5','4','15','B12345678','Comun','12000','5','130'),
 ('15','4','3','16','B12345678','Deportivo','45000','5','200'),
 ('16','3','2','17','B12345678','Elon Car','150000','7','220'),
 ('17','2','1','18','B12345678','Elon Car','120000','5','210'),
 ('18','1','3','19','B12345678','Deportivo','100000','5','200'),
 ('19','1','4','20','B12345678','Suv','65000','5','197'),
 ('20','2','5','21','B12345678','Deportivo','37000','5','200'),
 ('21','3','4','22','B12345678','Comun','11000','5','130'),
 ('22','4','1','23','B12345678','Comun','9000','5','105'),
 ('23','5','4','24','B12345678','Lujo','1850000','2','447');

DROP TABLE IF EXISTS venta_coche;
CREATE TABLE venta_coche (
       id_ventacoche VARCHAR(4) NOT NULL PRIMARY KEY,
       id_coche VARCHAR(20) NOT NULL,
       DNI VARCHAR(9) NOT NULL,
       fecha_compra DATE NOT NULL,
       precio_total INT UNSIGNED NOT NULL,
       FOREIGN KEY(DNI) REFERENCES usuario(DNI),
       FOREIGN KEY(id_coche) REFERENCES coches(id_coche)
); 

INSERT INTO venta_coche VALUES
('1','2','34353685M','2020-05-20','300000'),
('2','4','34578514L','2019-04-19','15000'),
('3','7','56874528B','2018-09-18','60000'),
('4','11','34859985B','2018-01-20','200000'),
('5','13','63585223P','2019-05-19','30000'),
('6','9','36584528B','2018-05-02','150000'),
('7','10','34353685M','2017-10-29','1500000'),
('8','17','34859985B','2019-12-09','120000'),
('9','12','53585586X','2018-12-16','45000'),
('10','6','56874528B','2018-06-15','12000'),
('11','23','15245278C','2017-09-13','1850000'),
('12','3','52487123V','2018-07-12','100000'),
('13','1','50688585J','2019-11-19','250000'),
('14','5','53585586X','2017-10-09','40000');


DROP TABLE IF EXISTS venta_moto;
CREATE TABLE venta_moto(
    id_ventamoto VARCHAR (10) NOT NULL PRIMARY KEY,
    id_moto VARCHAR(20) NOT NULL,
    DNI VARCHAR(9) NOT NULL,
    fecha_compra DATE NOT NULL,
    precio_total INT UNSIGNED NOT NULL,
    FOREIGN KEY(DNI) REFERENCES usuario(DNI),
       FOREIGN KEY(id_moto) REFERENCES motos(id_moto)
);
INSERT INTO venta_moto VALUES
('1','1','15245278C','2019-09-19','21000'),
('2','2','52487123V','2018-09-20','15000'),
('3','6','56874528B','2019-06-18','25000');


DROP TABLE IF EXISTS concesionario_moto;
CREATE TABLE concesionario_moto (
	id_moto VARCHAR(20) NOT NULL,
	CIF VARCHAR(9) NOT NULL,
	fecha_llegada DATE NOT NULL,
	FOREIGN KEY(CIF) REFERENCES concesionario(CIF),
       FOREIGN KEY(id_moto) REFERENCES motos(id_moto)	
);
INSERT INTO concesionario_moto VALUES
('1','B12345678','2019-10-02'), 
('2','B12345678','2017-12-12'), 
('3','B12345678','2015-11-10'), 
('4','B12345678','2016-07-06'), 
('5','B12345678','2019-06-07'), 
('6','B12345678','2020-02-01');


DROP TABLE IF EXISTS concesionario_coche;
CREATE TABLE concesionario_coche(
	id_coche VARCHAR(20) NOT NULL PRIMARY KEY,
	CIF VARCHAR(9) NOT NULL,
	fecha_llegada DATE NOT NULL,
	FOREIGN KEY(CIF) REFERENCES concesionario(CIF),
       FOREIGN KEY(id_coche) REFERENCES coches(id_coche)	
);
INSERT INTO concesionario_coche VALUES
('1','B12345678','2019-11-19'),
('2','B12345678','2019-12-17'),
('3','B12345678','2019-09-15'),
('4','B12345678','2016-01-16'),
('5','B12345678','2017-02-19'),
('6','B12345678','2019-05-20'),
('7','B12345678','2018-08-17'),
('8','B12345678','2019-05-18'),
('9','B12345678','2019-03-17'),
('11','B12345678','2020-10-12'),
('12','B12345678','2020-11-16'),
('13','B12345678','2019-12-18'),
('14','B12345678','2018-07-19'),
('15','B12345678','2017-12-14'),
('16','B12345678','2014-10-12'),
('17','B12345678','2019-08-13'),
('18','B12345678','2018-01-14'),
('19','B12345678','2018-03-15'),
('20','B12345678','2019-04-16'),
('21','B12345678','2019-09-17'),
('22','B12345678','2015-10-19'),
('23','B12345678','2019-07-19');
