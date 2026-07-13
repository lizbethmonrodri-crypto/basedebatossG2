-- crea una base de datos
CREATE DATABASE universidad;
GO

-- utilizaR LA BASE DE DATOS
USE universidad;
GO

--   crear una tabla
CREATE TABLE alumno (
alumno_id INT,
nombre VARCHAR (100),
edad INT
);
GO

CREATE TABLE alumno_2(
	alumno_id INT,
	nombre VARCHAR(50),
	apellido_paterno VARCHAR(50),
	apellido_materno VARCHAR(50),
	fecha_nacimiento DATE,
	correo VARCHAR (45)
);
GO

-- Restricciones
CREATE TABLE alumno_3(
	alumno_id INT PRIMARY KEY,
	nombre VARCHAR(100),
	correo VARCHAR(40)
);
GO

CREATE TABLE alumno_4(
	alumno_id INT NOT NULL,
	nombre VARCHAR(100),
	correo VARCHAR(40)
	CONSTRAINT pk_alumno_4
	PRIMARY KEY (alumno_id)
);
GO

INSERT INTO alumno_4
VALUES (1, 'PANFILO', 'correo@correo.com')

INSERT INTO alumno_4
VALUES (2, 'Monico', 'correo2@correo.com')

-- Primary key con IDENTITY
CREATE TABLE profesor(
profesor_id INT NOT NULL IDENTITY (1,1),
nombre VARCHAR(50) NOT NULL,
edad INT NULL,
CONSTRAINT pk_profesor
PRIMARY KEY (profesor_id)
);
GO
INSERT INTO profesor
VALUES ('German',29),
		('Maricha', 22);

SELECT *
FROM profesor;

-- Restriccion Unique
CREATE TABLE materia(
msteris_id INT NOT NULL IDENTITY(1,1),
correo VARCHAR(50)NOT NULL UNIQUE 
);


CREATE TABLE materia_2(
msteria_id INT NOT NULL IDENTITY(1,1),
correo VARCHAR(50)NOT NULL,
CONSTRAINT pk_materia_2
PRIMARY KEY (msteria_id),
CONSTRAINT uq_materia_2_correo
UNIQUE (correo)

);

INSERT INTO materia_2
VALUES ('correo@correo.com');

INSERT INTO materia_2
VALUES ('correo2@correo.com');

-- Restriccion Default

CREATE TABLE categoria(
	categoria_id INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL UNIQUE,
	activo BIT DEFAULT 1	
);
GO

CREATE TABLE categoria (
	categoria_id INT NOT NULL IDENTITY (1,1)
	CONSTRAINT pk_categoria
	PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL 
	CONSTRAINT uq_categoria_nombre
	UNIQUE,
	activo BIT 
	CONSTRAINT df_categoria_activo
	DEFAULT 1	
);
GO

CREATE TABLE categoria (
	categoria_id INT NOT NULL IDENTITY (1,1),
	nombre VARCHAR(30) NOT NULL,
	activo BIT 
	CONSTRAINT df_categoria_activo
	DEFAULT 1,
	CONSTRAINT pk_categoria
	PRIMARY KEY (categoria_id),
	CONSTRAINT uq_categoria_nombre
	UNIQUE(nombre)
	
);
GO
	DROP TABLE categoria;

INSERT INTO categoria
VALUES ('Carnes Frias', 1);

INSERT INTO categoria
VALUES ('Carnes calientes', DEFAULT);

INSERT INTO categoria (nombre)
VALUES ('Chochos');

-- restriccion check
-- opcion de construccion 1

CREATE TABLE producto (
	producto_id INT IDENTITY(1,1) PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL UNIQUE,
	precio DECIMAL (10,2) NOT NULL CHECK (precio>0),
	existencia INT NOT NULL CHECK (existencia>0 AND existencia<=100),
	activo BIT NOT NULL DEFAULT 1
);
GO

-- opcion de construccion 2
CREATE TABLE producto (
	producto_id INT IDENTITY(1,1) 
	CONSTRAINT pk_producto
	PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL
	CONSTRAINT uq_producto_nombre
	UNIQUE,
	precio DECIMAL (10,2) NOT NULL 
	CONSTRAINT ck_producto_precio
	CHECK (precio>0),
	existencia INT NOT NULL 
	CONSTRAINT ck_producto_existencia
	CHECK (existencia > 0 AND existencia<=100),
	activo BIT NOT NULL 
	CONSTRAINT df_producto_activo
	DEFAULT 1
);
GO

-- opcion de construccion 3
CREATE TABLE producto (
	producto_id INT NOT NULL,
	nombre VARCHAR (20) NOT NULL,
	descripcion VARCHAR(80),
	precio DECIMAL (10,2) NOT NULL,
	existencia INT NOT NULL,
	activo BIT NOT NULL
	CONSTRAINT dk_producto_activo
	DEFAULT 1,
	-- restriccion de pk
	CONSTRAINT pk_producto
	PRIMARY KEY(producto_id),
	-- restriccion UNINQUE
	CONSTRAINT uq_producto_nombre
	UNIQUE (nombre),
	-- restriccion check para precio
	CONSTRAINT ck_producto_precio
	CHECK (precio > 0.0),
	-- restriccion heck para existencia
	CONSTRAINT ck_producto_existencia
	CHECK (existencia BETWEEN 1 AND 100)
);
GO

	DROP TABLE producto;
	GO

INSERT INTO producto
VALUES (1,'pitufo',null, 200, 99, 0);

INSERT INTO producto
VALUES (2 ,'QUEMADITA',NULL, 200, 100, DEFAULT);

INSERT INTO producto (producto_id,nombre, existencia, precio)
VALUES (3,'pantera rosa', 47, 80);

SELECT *
FROM producto;

-- crear una base de datos, empresa patito

-- CREAR BASE DE DATOS

CREATE DATABASE empresa_patito
GO

-- Usar la base de datos
USE empresa_patito;
GO

-- RESTRICCION DE FORENIGN KEY

CREATE TABLE proveedor (
	proveedor_id INT NOT NULL IDENTITY(1,1),
	empresa VARCHAR(35) NOT NULL,
	direccion VARCHAR(80) NULL,
	limite_credito DECIMAL(10,2) NOT NULL,
	-- PRIMERY KEY
	CONSTRAINT pk_proveedor
	PRIMARY KEY (proveedor_id),
	-- unique
	CONSTRAINT uq_proveedor_empresa
	UNIQUE (empresa),
	-- check limite de credito
	CONSTRAINT ck_proveedor_limite_credito
	CHECK (limite_credito>0.0 AND limite_credito <=10000),
);
GO

CREATE TABLE producto (
	fabricante_id CHAR(3) NOT NULL,
	producto_id INT NOT NULL,
	nombre VARChAR(20) NOT NULL
	CONSTRAINT uq_producto_nombre
	UNIQUE,
	shock INT NOT NULL
	CONSTRAINT ck_producto_stock
	CHECK (shock BETWEEN 1 AND 100),
	precio DECIMAL (10,2) NOT NULL
	CONSTRAINT ck_producto_precio
	CHECK (precio> 0.0),
	activo BIT NOT NULL
	CONSTRAINT df_producto_activo
	DEFAULT 1,
	proveedor_id INT NOT NULL,
	CONSTRAINT pk_producto
	PRIMARY KEY (fabricante_id, producto_id),
	CONSTRAINT fk_producto_proveedor
	FOREIGN KEY(proveedor_id)
	REFERENCES proveedor (proveedor_id)

);
GO

-- integridades referenciales on DELETE Y ON UPDATE NO ACTION, CASCADE, SET NULL, SET DEFAULT

CREATE DATABASE construccion;
GO

USE construccion;
GO

--NO ACTION

CREATE TABLE cliente (
	cliente_id INT
	CONSTRAINT pk_cliente
	PRIMARY KEY,
	empresa VARCHAR (20)
	CONSTRAINT uq_cliente_empresa
	UNIQUE,
	direccion VARCHAR (50),
	telefono VARCHAR (15) NOT NULL,
	activo BIT NOT NULL,
	created_at DATETIME2 NOT NULL 
	CONSTRAINT df_cliente_created_at
	DEFAULT SYSDATETIME (),
	updated_at DATETIME2 NOT NULL
	DEFAULT SYSDATETIME ()
);
GO

CREATE TABLE telefono (
	telefono_id INT IDENTITY (1,1),
	numero_telefono VARCHAR (15) NOT NULL,
	created_at DATETIME2 NOT NULL
	CONSTRAINT df_telefono_created_at
	DEFAULT SYSDATETIME(),
	updated_at DATETIME2 NOT NULL
	CONSTRAINT df_telefono_update_at
	DEFAULT SYSDATETIME(),
	cliente_id INT,
	CONSTRAINT pk_telefono
	PRIMARY KEY (telefono_id),
	CONSTRAINT uq_telefono_numero_telefono
	UNIQUE (numero_telefono),
	CONSTRAINT ck_telefono_numero_telefono
	CHECK (numero_telefono LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
	CONSTRAINT fk_telefono_cliente
	FOREIGN KEY (cliente_id)
	REFERENCES cliente (cliente_id)
	-- valor por default
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
);
GO

INSERT INTO cliente
VALUES (1, 'Patito de Hule', NULL, '773-def-123', 1, DEFAULT, DEFAULT );

INSERT INTO cliente (cliente_id, empresa, telefono, activo)
VALUES (2, 'Taqueria Mr.Linux','7731234567',1 );

INSERT INTO telefono (numero_telefono, cliente_id)
VALUES ( '773-456-7894', 1 );

INSERT INTO telefono (numero_telefono, cliente_id)
VALUES ( '773-235-7294', 1 ),
		('123-147-2589',1),
		('236-456-7802',1),
		('594-783-4160',1),
		('561-154-2933',2);

DROP TABLE telefono

SELECT * FROM cliente;
SELECT * FROM telefono;


-- actualizar ON UPDATE en NO ACTION

-- se actualiza el hijo (poniendolo en null)
UPDATE telefono
SET cliente_id = NULL
WHERE cliente_id = 2;

-- ACTUALIZA EL HIJO CON EL NUEVO ID DEL PADRE
UPDATE telefono
SET cliente_id = 3
WHERE cliente_id IS NULL;

-- actualiza el padre
UPDATE cliente
SET cliente_id = 3
WHERE cliente_id = 2;


-- eliminar por on delete por no action

-- eliminar los hijos
DELETE FROM telefono
WHERE cliente_id = 1;

DELETE FROM cliente
WHERE cliente_id=1;




-- INTEGRIDAD REFERENCIAL on delete y on update cascade

CREATE TABLE cliente (
	cliente_id INT
	CONSTRAINT pk_cliente
	PRIMARY KEY,
	empresa VARCHAR (20)
	CONSTRAINT uq_cliente_empresa
	UNIQUE,
	direccion VARCHAR (50),
	telefono VARCHAR (15) NOT NULL,
	activo BIT NOT NULL,
	created_at DATETIME2 NOT NULL 
	CONSTRAINT df_cliente_created_at
	DEFAULT SYSDATETIME (),
	updated_at DATETIME2 NOT NULL
	DEFAULT SYSDATETIME ()
);
GO

CREATE TABLE telefono (
	telefono_id INT IDENTITY (1,1),
	numero_telefono VARCHAR (15) NOT NULL,
	created_at DATETIME2 NOT NULL
	CONSTRAINT df_telefono_created_at
	DEFAULT SYSDATETIME(),
	updated_at DATETIME2 NOT NULL
	CONSTRAINT df_telefono_update_at
	DEFAULT SYSDATETIME(),
	cliente_id INT,
	CONSTRAINT pk_telefono
	PRIMARY KEY (telefono_id),
	CONSTRAINT uq_telefono_numero_telefono
	UNIQUE (numero_telefono),
	CONSTRAINT ck_telefono_numero_telefono
	CHECK (numero_telefono LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
	CONSTRAINT fk_telefono_cliente
	FOREIGN KEY (cliente_id)
	REFERENCES cliente (cliente_id)
	-- valor por default
	ON DELETE CASCADE
	ON UPDATE CASCADE
);
GO

SELECT * FROM cliente;
SELECT * FROM telefono;

INSERT INTO cliente
VALUES (1, 'Patito de Hule', NULL, '773-def-123', 1, DEFAULT, DEFAULT );

INSERT INTO telefono (numero_telefono, cliente_id)
VALUES ( '773-235-7294', 1 ),
		('123-147-2589',2),
		('236-456-7802',2),
		('594-783-4160',2)


-- ELIMINAR EN on delete cascade

--eliminar al padre

DELETE FROM cliente
WHERE cliente_id = 1 ;

-- actualizar en ON UPDATE CASCADE
UPDATE cliente
SET cliente_id = 10
WHERE cliente_id = 1;

DROP TABLE telefono;

CREATE TABLE telefono (
	telefono_id INT IDENTITY (1,1),
	numero_telefono VARCHAR (15) NOT NULL,
	created_at DATETIME2 NOT NULL
	CONSTRAINT df_telefono_created_at
	DEFAULT SYSDATETIME(),
	updated_at DATETIME2 NOT NULL
	CONSTRAINT df_telefono_update_at
	DEFAULT SYSDATETIME(),
	cliente_id INT,
	CONSTRAINT pk_telefono
	PRIMARY KEY (telefono_id),
	CONSTRAINT uq_telefono_numero_telefono
	UNIQUE (numero_telefono),
	CONSTRAINT ck_telefono_numero_telefono
	CHECK (numero_telefono LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
	CONSTRAINT fk_telefono_cliente
	FOREIGN KEY (cliente_id)
	REFERENCES cliente (cliente_id)
	-- valor por default
	ON DELETE SET NULL
	ON UPDATE SET NULL
);
GO

INSERT INTO cliente (cliente_id, empresa, telefono, activo)
VALUES (11,'BIMBO', '5646825791', 1);

INSERT INTO telefono (numero_telefono, cliente_id)
VALUES ( '773-456-7894', 11 );

INSERT INTO telefono (numero_telefono, cliente_id)
VALUES ( '773-235-7294', 11 ),
		('123-147-2589',11),
		('236-456-7802',11),
		('594-783-4160',3);

DELETE FROM cliente
WHERE cliente_id = 11;

UPDATE cliente
SET cliente_id = 15
WHERE cliente_id = 3;

SELECT * FROM cliente;

select * from telefono;

-- on delete y on update set null
DROP TABLE telefono;

CREATE TABLE telefono (
	telefono_id INT IDENTITY (1,1),
	numero_telefono VARCHAR (15) NOT NULL,
	created_at DATETIME2 NOT NULL
	CONSTRAINT df_telefono_created_at
	DEFAULT SYSDATETIME(),
	updated_at DATETIME2 NOT NULL
	CONSTRAINT df_telefono_update_at
	DEFAULT SYSDATETIME(),
	cliente_id INT
	CONSTRAINT df_telefono_cliente_id
	DEFAULT 0,
	CONSTRAINT pk_telefono
	PRIMARY KEY (telefono_id),
	CONSTRAINT uq_telefono_numero_telefono
	UNIQUE (numero_telefono),
	CONSTRAINT ck_telefono_numero_telefono
	CHECK (numero_telefono LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
	CONSTRAINT fk_telefono_cliente
	FOREIGN KEY (cliente_id)
	REFERENCES cliente (cliente_id)
	-- valor por default
	ON DELETE SET DEFAULT
	ON UPDATE SET DEFAULT
);
GO

INSERT INTO cliente (cliente_id, empresa, telefono, activo)
VALUES (0,'mostrador', '56780825791', 1);

INSERT INTO telefono (numero_telefono, cliente_id)
VALUES ( '753-456-7894', 11 );

INSERT INTO telefono (numero_telefono, cliente_id)
VALUES ( '783-235-7294', 10 ),
		('173-147-2589',10),
		('234-456-7802',10),
		('593-783-4160',15);

DELETE FROM cliente
WHERE cliente_id = 10;

UPDATE cliente
SET cliente_id = 17
WHERE cliente_id = 15 ;

SELECT * FROM cliente;

select * from telefono;