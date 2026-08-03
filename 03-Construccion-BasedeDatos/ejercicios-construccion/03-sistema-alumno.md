```sql
/*============ CREAR BASE DE DATOS ==============*/
CREATE DATABASE ControlEscolar;
GO

USE ControlEscolar;
GO

/*============ CREAR TABLA ALUMNO ==============*/
CREATE TABLE alumno(
    numAlumno INT NOT NULL IDENTITY(1,1),
    matricula CHAR(10) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    apellido1 VARCHAR(30) NOT NULL,
    apellido2 VARCHAR(30),
    semestre INT NOT NULL,

    CONSTRAINT pk_alumno
    PRIMARY KEY (numAlumno),

    CONSTRAINT uq_alumno_matricula
    UNIQUE (matricula),

    CONSTRAINT ck_alumno_semestre
    CHECK (semestre BETWEEN 1 AND 12)
);
GO


/*============ CREAR TABLA MATERIA ==============*/
CREATE TABLE materia(
    claveMateria CHAR(6) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    creditos INT NOT NULL,

    CONSTRAINT pk_materia
    PRIMARY KEY (claveMateria),

    CONSTRAINT uq_materia_nombre
    UNIQUE (nombre),

    CONSTRAINT ck_materia_creditos
    CHECK (creditos > 0)
);
GO


/*============ CREAR TABLA INSCRIBE ==============*/
CREATE TABLE inscribe(
    numAlumno INT NOT NULL,
    claveMateria CHAR(6) NOT NULL,
    fechaInscripcion DATE NOT NULL,
    calificacion DECIMAL(4,2),

    CONSTRAINT pk_inscribe
    PRIMARY KEY (numAlumno, claveMateria),

    CONSTRAINT ck_inscribe_calificacion
    CHECK (calificacion BETWEEN 0 AND 10)
);
GO


/*============ CREAR FOREIGN KEY DE INSCRIBE CON ALUMNO ==============*/

ALTER TABLE inscribe
ADD CONSTRAINT fk_inscribe_alumno
FOREIGN KEY (numAlumno)
REFERENCES alumno(numAlumno);
GO


/*============ CREAR FOREIGN KEY DE INSCRIBE CON MATERIA ==============*/

ALTER TABLE inscribe
ADD CONSTRAINT fk_inscribe_materia
FOREIGN KEY (claveMateria)
REFERENCES materia(claveMateria);
GO
```
![Ejercicio1 Construccion](../../img/CONSTRUCCION/ejercicio3.png)