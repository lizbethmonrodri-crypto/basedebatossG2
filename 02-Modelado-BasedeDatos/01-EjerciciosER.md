# Ejercicios del modelo E-R

## Ejercicio 1.

Un hospital registra informacion de sus pacientes:

> de cada paciente se almacena:
- numero de paciente que lo identifica
- nombre
- fecha de nacimiento

> de cada expediente medico se almecena:
- numero de expediente
- fecha de apertura
- tipo de sangre

> reglas de negocion:
1. cada paciente debe tener exactamente un expediente medico
2. cada expediente medico pertenece a un unico paciente
3. no puede existir un espediente sin paciente
4. no puede existir un paciente sin expediente

> que se debe realizar:

- identificar las entidades
- identificar atributos
- dibujar las relaciones
- determinar la cardinalidad
- determinar la participacion de cada entidad

![Ejemplo1](../img/ER/imagen1.jpeg)

![Ejemplo1](../img/ER/ejercicio1.png)

## Ejercicio 2.
Una universidad administra profesores y cursos

> de cada profesor se almecena :

- numero de profesor
- nombre
- especialidad

> de cada **Curso** se almecena:

- numero de curso
- nombre del curso
- creditos

> reglas del negocio

1. Un profesor puede impartir varios cursos
2. Un curso solamente puede ser impartido por un profesor
3. puede existir un profesor que actualmente no imparta cursos
4. todo curso debe estar asignado a un profesor

![Ejemplo2](../img/ER/imagen2.jpeg)

![Ejemplo2](../img/ER/ejercicio2.png)


## Ejercicio 3.0

una escuela administra alumnos y materias 

> de cada **alumno** se almacena:

- matricula
- nombre
- semestre

> de cada **materia** se almecena:

- clave de la materia
- nombre de la materia
- creditos

> reglas del negocio

1. un alumno puede inscribirse en varias materias
2. una materia puede tener muchos alumnos inscritos
3. puede existir una materia sin alumnos inscritos
4. todo alumno debe estar inscrito en almenos una materia
5. de cada inscripcion se desea almecenar:
    - fecha de inscripcion
    - calificacion final
nota: a la relacion nombrarla **INSCRIBE**

![Ejemplo3](../img/ER/imagen3.jpeg)

![Ejemplo3](../img/ER/ejercicio3.png)

## ejercicio 4.

Una empresa dedicada a las ventas al pormayor necesita registrar loo siguiente:

> para los clientes:

- numero de cliente
- nombre (el cual es una persona moral)

> pedidos

- numero de pedido
- fecha de pedido

> producto

- numero de producto
- nombre
- precio

> reglas del negocio

1. un cliente puede realizar muchos pedidos
2. cada pedido pertenece a un solo cliente
3. un pedido contiene varios productos
4. un producto puede aparecer en muchos pedidos
5. un pedido debe contener al menos un producto
6. un producto puede no haber sido vendido
7. el detalle del pedido no existe sin pedido
8. el detalle del pedido no existe sin producto
9. el detalle almacena la cantidad vendida y el precio de venta

![Ejemplo4](../img/ER/imagen4.jpeg)

![Ejemplo4](../img/ER/ejercicio4.png)

## ejercicio 5.

1. The company is organized into departments. Each department has a unique name, a unique number, and a particular employee who manages the department. We keep track of the start date when that employee began managing the department. A department may have several locations.

2. A department controls a number of projects, each of which has a unique name, a unique number, and a single location.

3. We store each employee's name, Social Security number, address, salary, sex (gender), and birth date. An employee is assigned to one department, but may work on several projects, which are not necessarily controlled by the same department. We keep track of the current number of hours per week that an employee works on each project. We also keep track of the direct supervisor of each employee (who is another employee).

4. We want to keep track of the dependents of each employee for insurance purposes. We keep each dependent's first name, sex, birth date, and relationship to the employee.

![Ejemplo5](../img/ER/imagen5.jpeg)

## ejercicio 6

![Ejemplo6](../img/ER/EJERCICIO6.jpeg)
