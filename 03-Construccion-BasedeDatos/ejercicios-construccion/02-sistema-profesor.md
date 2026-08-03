```sql
/*============ CREAR BASE DE DATOS ==============*/
CREATE DATABASE Escuela;
GO

USE Escuela;
GO

/*============ CREAR TABLA PROFESOR ==============*/
CREATE TABLE profesor(
    numProfesor INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50) NOT NULL,

    CONSTRAINT pk_profesor
    PRIMARY KEY (numProfesor)
);
GO

/*============ CREAR TABLA CURSO ==============*/
CREATE TABLE curso(
    numCurso INT NOT NULL,
    nombreCurso VARCHAR(100) NOT NULL,
    creditos INT NOT NULL,
    profesor INT NOT NULL,

    CONSTRAINT pk_curso
    PRIMARY KEY (numCurso)
);
GO

/*============ CREAR TABLA ESPECIALIDAD ==============*/
CREATE TABLE especialidad(
    especialidad INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    profesor INT NOT NULL,

    CONSTRAINT pk_especialidad
    PRIMARY KEY (especialidad)
);
GO

/*============ CREAR FOREIGN KEY DE CURSO CON PROFESOR ==============*/

ALTER TABLE curso
ADD CONSTRAINT fk_curso_profesor
FOREIGN KEY (profesor)
REFERENCES profesor(numProfesor);
GO

/*============ CREAR FOREIGN KEY DE ESPECIALIDAD CON PROFESOR ==============*/

ALTER TABLE especialidad
ADD CONSTRAINT fk_especialidad_profesor
FOREIGN KEY (profesor)
REFERENCES profesor(numProfesor);
GO
```
![Ejercicio2  Construccion](../../img/CONSTRUCCION/ejercicio2.png)