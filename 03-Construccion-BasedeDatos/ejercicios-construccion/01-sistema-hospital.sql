
CREATE DATABASE hospitaldb;
go 

USE hospitaldb;

CREATE TABLE paciente(
    numPaciente INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50) NOT NULL,
    fechaNaci DATE NOT NULL,

    CONSTRAINT pk_paciente
    PRIMARY KEY (numPaciente)
);
GO

CREATE TABLE expediente(
    numExp INT NOT NULL,
    fechaApertura DATE NOT NULL,
    tipoSangre VARCHAR(5) NOT NULL,
    numPaciente INT NOT NULL,

    CONSTRAINT pk_expediente
    PRIMARY KEY (numExp),

    CONSTRAINT uq_expediente_numPaciente
    UNIQUE (numPaciente)
);
GO


/*============ CREAR FOREIGN KEY DE EXPEDIENTE CON PACIENTE ==============*/

ALTER TABLE expediente
ADD CONSTRAINT fk_expediente_paciente
FOREIGN KEY (numPaciente)
REFERENCES paciente(numPaciente);
GO

