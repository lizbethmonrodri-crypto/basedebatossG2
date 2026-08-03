```sql
/*============ CREAR BASE DE DATOS ==============*/
CREATE DATABASE company;
GO

USE company;
GO

/*============ CREAR TABLA EMPLOYEE ==============*/
CREATE TABLE employee(
    ssn CHAR(9) NOT NULL,
    lastsname VARCHAR(30) NOT NULL,
    bdate DATE NOT NULL,
    address VARCHAR(100),
    salary DECIMAL(10,2),
    sex CHAR(1),
    jef CHAR(9),

    CONSTRAINT pk_employee
    PRIMARY KEY (ssn)
);
GO

/*============ CREAR TABLA DEPARTMENT ==============*/
CREATE TABLE department(
    number INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    manager CHAR(9) NOT NULL,
    startdate DATE,

    CONSTRAINT pk_department
    PRIMARY KEY (number)
);
GO

/*============ CREAR TABLA PROJECT ==============*/
CREATE TABLE project(
    numbre INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    location VARCHAR(50),
    numberdepartment INT NOT NULL,

    CONSTRAINT pk_project
    PRIMARY KEY (numbre)
);
GO

/*============ CREAR TABLA LOCATION ==============*/
CREATE TABLE location(
    numlocation INT NOT NULL IDENTITY(1,1),
    location VARCHAR(50) NOT NULL,
    number_department INT NOT NULL,

    CONSTRAINT pk_location
    PRIMARY KEY (numlocation)
);
GO

/*============ CREAR TABLA WORKS_ON ==============*/
CREATE TABLE works_On(
    ssn CHAR(9) NOT NULL,
    number INT NOT NULL,
    hours DECIMAL(5,2),

    CONSTRAINT pk_works_on
    PRIMARY KEY (ssn, Number)
);
GO

/*============ CREAR TABLA DEPENDENT ==============*/
CREATE TABLE dependent(
    Name VARCHAR(50) NOT NULL,
    ssn CHAR(9) NOT NULL,
    birthdate DATE,
    relationship VARCHAR(30),

    CONSTRAINT pk_dependent
    PRIMARY KEY (Name, ssn)
);
GO

/*============ FOREIGN KEY EMPLOYEE -> EMPLOYEE (JEFE) ==============*/
ALTER TABLE employee
ADD CONSTRAINT fk_employee_jef
FOREIGN KEY (jef)
REFERENCES employee(ssn);
GO

/*============ FOREIGN KEY DEPARTMENT -> EMPLOYEE ==============*/
ALTER TABLE department
ADD CONSTRAINT fk_department_manager
FOREIGN KEY (manager)
REFERENCES employee(ssn);
GO

/*============ FOREIGN KEY PROJECT -> DEPARTMENT ==============*/
ALTER TABLE project
ADD CONSTRAINT fk_project_department
FOREIGN KEY (numberdepartment)
REFERENCES department(number);
GO

/*============ FOREIGN KEY LOCATION -> DEPARTMENT ==============*/
ALTER TABLE location
ADD CONSTRAINT fk_location_department
FOREIGN KEY (number_department)
REFERENCES department(number);
GO

/*============ FOREIGN KEY WORKS_ON -> EMPLOYEE ==============*/
ALTER TABLE works_On
ADD CONSTRAINT fk_workson_employee
FOREIGN KEY (ssn)
REFERENCES employee(ssn);
GO

/*============ FOREIGN KEY WORKS_ON -> PROJECT ==============*/
ALTER TABLE works_On
ADD CONSTRAINT fk_workson_project
FOREIGN KEY (number)
REFERENCES project(numbre);
GO

/*============ FOREIGN KEY DEPENDENT -> EMPLOYEE ==============*/
ALTER TABLE dependent
ADD CONSTRAINT fk_dependent_employee
FOREIGN KEY (ssn)
REFERENCES employee(ssn);
GO
```
![Ejercicio1 Construccion](../../img/CONSTRUCCION/ejercicio5primeraversion.png)