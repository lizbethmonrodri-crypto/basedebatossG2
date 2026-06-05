CREATE DATABASE bdejemplo;

USE dbejemplo;

CREATE TABLE categoria(
	id INT NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	CONSTRAINT pk_categoria
	PRIMARY KEY (id)
);


INSERT INTO categoria
VALUES(1, 'CARNES fRIAS'),
	(2, 'VINOS Y LICORES');	
	
SELECT * FROM categoria;


--MANEJO DE ERRORES NULOS
USE bdejemplo;
GO

CREATE TABLE alumno (
	iddAlunmo INT NOT NULL PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	apellidoPaterno VARCHAR(20) NOT NULL,
	apellidoMaterno VARCHAR(20) NULL,
	fechaNaci DATE NOT NULL,
	calle VARCHAR(50) NOT NULL,
	numeroInt INT,
	numeroExt INT
);

INSERT INTO alumno
VALUES (1, 'MONSERRAT', 'MUÑOS', NULL, '2007-07-17', 'CALLE DEL INFIERNO', NULL, 666);


INSERT INTO alumno (iddAlunmo,nombre,apellidoPaterno,fechaNaci,calle)
VALUES (3, 'CRISTOFER','GARCIA','2007-11-03','CONOCIDA');

SELECT *
FROM alumno;

--RAZÓN DE CARDINALIDAD 1:N

CREATE TABLE categoria2(
	categoriaId INT NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	CONSTRAINT pk_categoria2
	PRIMARY KEY (categoriaId)

);

CREATE TABLE producto2 (
	productoid INT NOT NULL PRIMARY KEY,
	nombre VARCHAR(35) NOT NULL,
	existencia INT NOT NULL,
	percio DECIMAL(10,2) NOT NULL,
	categoriaId INT,
	CONSTRAINT fk_producto2_categoria2
	FOREIGN KEY (categoriaId)
	REFERENCES categoria2(categoriaId)

);