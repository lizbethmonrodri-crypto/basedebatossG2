## EJERCICIO 3
Diccionario de Datos de la Base de Datos
1. Información General

| Elemento | Valor                             |
| :------- | :-------------------------------- |
| Proyecto | Control Escolar                   |
| Versión  | 1.0                               |
| Fecha    | Junio 2026                        |
| Elaboró  | Diana Monroy |
| SGBD     | SQL Server                        |
2. Descripción de la Base de Datos

La base de datos administra la información de los alumnos, las materias disponibles y las inscripciones realizadas por cada estudiante.

Permite llevar el control de las materias cursadas y las calificaciones obtenidas por los alumnos.

3. Catálogo de Restricciones Utilizadas

| Catálogo | Significado               |
| :------- | :------------------------ |
| PK       | Primary Key               |
| FK       | Foreign Key               |
| NN       | Not Null                  |
| UQ       | Unique                    |
| CK       | Check                     |
| AI       | Identity (Autoincremento) |

4. Diccionario de Datos
Tabla: Alumno

Descripción: Almacena la información de los estudiantes.

| Campo     | Tipo    | Longitud | Restricciones | Descripción             |
| :-------- | :------ | :------- | :------------ | :---------------------- |
| NumAlumno | INT     | -        | PK, AI, NN    | Número único del alumno |
| Matricula | VARCHAR | 10       | UQ, NN        | Matrícula institucional |
| Nombre    | VARCHAR | 50       | NN            | Nombre del alumno       |
| Apellido1 | VARCHAR | 50       | NN            | Primer apellido         |
| Apellido2 | VARCHAR | 50       | NULL          | Segundo apellido        |
| Semestre  | INT     | -        | NN, CK (1-12) | Semestre que cursa      |

Tabla: Materia

Descripción: Almacena la información de las materias.

| Campo        | Tipo    | Longitud | Restricciones | Descripción               |
| :----------- | :------ | :------- | :------------ | :------------------------ |
| ClaveMateria | VARCHAR | 10       | PK, NN        | Clave única de la materia |
| Nombre       | VARCHAR | 100      | UQ, NN        | Nombre de la materia      |
| Creditos     | INT     | -        | NN, CK (>0)   | Créditos de la materia    |

Tabla: Inscribe

Descripción: Registra las materias inscritas por cada alumno.

| Campo            | Tipo         | Longitud | Restricciones    | Descripción           |
| :--------------- | :----------- | :------- | :--------------- | :-------------------- |
| NumAlumno        | INT          | -        | PK, FK, NN       | Alumno inscrito       |
| ClaveMateria     | VARCHAR      | 10       | PK, FK, NN       | Materia inscrita      |
| FechaInscripcion | DATE         | -        | NN               | Fecha de inscripción  |
| Calificacion     | DECIMAL(4,2) | -        | NULL, CK (0-100) | Calificación obtenida |

5. Relaciones de la Base de Datos

| Relación           | Cardinalidad | Descripción                                       |
| :----------------- | :----------- | :------------------------------------------------ |
| Alumno → Inscribe  | 1:N          | Un alumno puede inscribirse en muchas materias.   |
| Materia → Inscribe | 1:N          | Una materia puede ser cursada por muchos alumnos. |

6. Matriz de Claves Foráneas

| Tabla    | Campo FK     | Referencia            |
| :------- | :----------- | :-------------------- |
| Inscribe | NumAlumno    | Alumno(NumAlumno)     |
| Inscribe | ClaveMateria | Materia(ClaveMateria) |

7. Integridad Referencial

| Clave | Regla                                                                  |
| :---- | :--------------------------------------------------------------------- |
| IR-01 | No se puede registrar una inscripción para un alumno inexistente.      |
| IR-02 | No se puede registrar una inscripción para una materia inexistente.    |
| IR-03 | No se puede eliminar un alumno si tiene inscripciones registradas.     |
| IR-04 | No se puede eliminar una materia si existen alumnos inscritos en ella. |

8. Reglas del Negocio

| Clave | Regla                                                         |
| :---- | :------------------------------------------------------------ |
| RN-01 | Un alumno puede inscribirse en varias materias.               |
| RN-02 | Una materia puede ser cursada por varios alumnos.             |
| RN-03 | Un alumno no puede inscribirse dos veces en la misma materia. |
| RN-04 | La calificación debe estar entre 0 y 100.                     |
| RN-05 | Cada inscripción debe tener una fecha de registro.            |



![Ejemplo3](../../img/ER/ejercicio3.png/)