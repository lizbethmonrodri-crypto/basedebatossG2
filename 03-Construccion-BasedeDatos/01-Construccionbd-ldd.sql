
-- Crea una base de datos
CREATE DATABASE universidad;
GO

-- Utilizar la base de datos
USE universidad;
GO

-- crear una tabla
CREATE TABLE alumno (
alumno_id INT,
nombre VARCHAR (100),
edad INT
);
GO

CREATE TABLE alumno_2(
	alumno_id INT,
	nombre VARCHAR (100),
	apellido_paterno VARCHAR (50),
	apellido_meterno VARCHAR (50),
	fecha_nacimiento DATE,
	correo VARCHAR (45)
);
GO

-- Restricciones

CREATE TABLE alumno_3(
	alumno_id INT PRIMARY KEY,
	nombre VARCHAR(100),
	correo VARCHAR (40),
);
GO

CREATE TABLE alumno_4(
	alumno_id INT NOT NULL,
	nombre VARCHAR(100),
	correo VARCHAR (40),
	CONSTRAINT pk_alumno_4
	PRIMARY KEY (alumno_id)
);
GO

INSERT INTO alumno_4
VALUES (1, 'PANFILO', 'correo1@correo.com');

INSERT INTO alumno_4
VALUES (2, 'monico', 'correo1@correo.com');

-- primari key con idenity

CREATE TABLE profesor (
	profesor_id INT NOT NULL IDENTITY (1, 1),
	nombre VARCHAR(50) NOT NULL,
	edad INT NULL,
	CONSTRAINT pk_profesor
	PRIMARY KEY (profesor_id)
);
GO

INSERT INTO profesor
VALUES ('GERMAN', 29),
		('MARICHA', 22);

SELECT *
FROM profesor;

-- restriccion UNIQUE
CREATE TABLE materia(
	materia_id INT NOT NULL IDENTITY(1,1),
	correo VARCHAR (50) NOT NULL UNIQUE

);

CREATE TABLE materia_2(
	materia_id INT NOT NULL IDENTITY(1,1),
	correo VARCHAR (50) NOT NULL UNIQUE,
	CONSTRAINT pk_materia_2
	PRIMARY KEY (materia_id),
	CONSTRAINT uq_materia_2_correo
	UNIQUE (correo)

);
GO

INSERT INTO materia_2
VALUES('correo@correo.com');


INSERT INTO materia_2
VALUES('correo3@correo.com');

