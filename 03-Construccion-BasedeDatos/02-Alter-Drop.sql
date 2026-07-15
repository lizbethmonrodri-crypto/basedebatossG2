-- Alter

CREATE DATABASE escuelita;
GO

USE escuelita;
GO

CREATE TABLE alumno(
	alumno_id INT IDENTITY(1,1),
	nombre VARCHAR(20) NOT NULL,
	apellido_paterno VARCHAR (15) NOT NULL,
	apellido_materno VARCHAR(15),
	CONSTRAINT pk_alumno
	PRIMARY KEY (alumno_id)
);
GO

-- agregar una columna a una tabla existente

ALTER TABLE alumno
ADD telefono VARCHAR(20);
GO

-- agregar varias columnas a varias columnas
ALTER TABLE alumno
ADD
curp CHAR(18),
rfc CHAR(13);

-- MODIFICAR EL TIPO DE DATO
ALTER TABLE alumno
ALTER COLUMN
telefono VARCHAR (30) NOT NULL;
GO

CREATE TABLE alumno2(
	alumno_id INT IDENTITY(1,1),
	nombre VARCHAR(20) NOT NULL,
	apellido_paterno VARCHAR (15) NOT NULL,
	apellido_materno VARCHAR(15)
);
GO

-- agregar una primary key
ALTER TABLE alumno2
ADD CONSTRAINT pk_alumno2
PRIMARY KEY (alumno_id);

CREATE TABLE carrera (
carrera_id INT IDENTITY(1,1)
CONSTRAINT pk_carrera
PRIMARY KEY (carrera_id),
nombre VARCHAR(10) NOT NULL
);

-- agregar un campo para foreing key en alumno
ALTER TABLE alumno
ADD
carrera_id INT;

-- agregar restriccionde foreing key

ALTER TABLE alumno
ADD CONSTRAINT fk_alumno_carrera
FOREIGN KEY (carrera_id)
REFERENCES carrera (carrera_id)
ON DELETE CASCADE
ON UPDATE NO ACTION;

-- AGREAGAR CAMPO EDAD A LA TABLA ALUMNO
ALTER TABLE alumno
ADD
edad INT;

-- agregar una restriccion check

ALTER TABLE alumno
ADD CONSTRAINT ck_alumno_edad
CHECK (edad>=18);
GO

-- Default
ALTER TABLE alumno
ADD activo BIT NOT NULL;
GO

SELECT * FROM alumno;

ALTER TABLE alumno
ADD CONSTRAINT df_alumno_activo
DEFAULT 1
FOR activo;

-- eliminar restricciones
-- EXEC sp_help alumno;

-- consulta para conocer los tipos y nombres de las restricciones de una tabla

SELECT
	o.name AS nombre_Restriccion,
	o.type_desc AS tipo_resticcion
FROM sys.objects AS o
WHERE o.parent_object_id = OBJECT_ID('alumno')
AND o.type IN ('PK' , 'F' , 'UQ' , 'C' , 'D' )
ORDER BY o.type_desc;
GO

-- ELIMINAR UNA PRIMARY KEY
ALTER TABLE alumno
DROP CONSTRAINT pk_alumno;

-- eliminar un check
ALTER TABLE alumno
DROP CONSTRAINT ck_alumno_edad;

-- eliminar un UNIQUE
ALTER TABLE alumno
ADD matricula VARCHAR(12) NOT NULL;

ALTER TABLE alumno
ADD CONSTRAINT uq_alumno_matricula
UNIQUE (matricula);


ALTER TABLE alumno
DROP CONSTRAINT uq_alumno_matricula;  -- drop eliminna objetos completos (tabla etc.)

-- eliminar el default

ALTER TABLE alumno
DROP CONSTRAINT df_alumno_activo;

-- eliminar la fk
ALTER TABLE alumno
DROP CONSTRAINT fk_alumno_carrera;

-- drop (elimina objetos completos)

-- muestra las tablas de la base de datos
SELECT name 
FROM sys.tables;

DROP TABLE alumno;
GO
DROP TABLE alumno2;
GO
DROP TABLE carrera;
GO

USE master;
GO

DROP DATABASE escuelita;
GO
