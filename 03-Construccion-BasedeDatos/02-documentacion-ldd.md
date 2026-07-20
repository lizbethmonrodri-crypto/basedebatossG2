<<<<<<< HEAD
# Construccion de base de dato sql server, maria db y postgres




## SQL SERVER
  ``` sql
 CREATE
 ALTER
 DROP
```
=======
## Construccion de BD en SQL Server, Mysql o MariaDB y Postgres

para la contruccion de objetos de base de datos se utiliza el lenguaje SQL (Structured Query
Languague) se divide en **cinco grandes cptegorias**

## SQL 
- DDL (Data Definition Language)
- DML (Data Manipulatio Language)
- DQL (Data Query Language)
- DCL (Data Control Languege)
- TCL (Transation Control Language)

## SQL-DDL
Lenguaje de definicion e datos

Se utiliza para **crear y modificar la estructura** de una base de datos

Con DDL trabajamos sobre los objetos de la base de datos:

- Base de datos
- Tabla
- Vistas
- Indices
- Restricciones
- Esquemas
- Procedimientos Almacenados
- Funciones
- Disparadores

**comandos principales**
| Comando | Funcion |
| :--- | :--- |
| Create | Crear Objetos |
| Alter | Modificar Objetos 
| Drop | Emilinar Objetos |
| Truncate | Vacia una tabla |
| Rename | Renombra objetos (segun el SGBD) |

### SQL-DML

**Lenguaje de manipulacion de datos**

Sirve para **trabajar con la informacion almacenada**

Nota: Aqui no cambia la estructura si no los registros

**comandos principales**

| Comando | Funcion |
| :--- | :--- |
| INSERT | Inserta Registros |
| UPDATE | Actualiza Registros |
| DELETE | Emilina Registros |

### SQL-DQL

**Lenguaje de consulta de datos**

Sufuncion es **consultar informacion**

**Comando principal**

| Comando | Funcion |
| :--- | :--- |
| SELECT | Consulatar informacion |

Generalmente se combina con:

- WHERE
- ORDER BY
- GROUP BY
- HAVING
- JOIN (LEFT, RINGHT, INNER, CROOS, FULL)
- DISTINCT
- TOP / LIMIT
- FUNCIONES DE AGREGADO
- FUNCIONES DE VENTANA

## Nomenclatura de construccion

Utilizaremos la convencion **snake_case**

| Objeto | Convencion | Ejemplo | 
| :--- | :--- | :--- | 
|  Base de datos | snake_case | control_escolar | 
|  Esquema | snake_case | ventas, rh, seguridad | 
|  Tabla | singular de snake_case | cliente, pedido, detalle_pedido |
|  Columna | snake_case | cliente_id, fecha_registro, correo_electronico |
|  PK | <tabla>_id | cliente_id, producto_id |
|  FK | Igual que la PK referenciada | cliente_id, categoria_id |
|  Tabla puente | igual que la PK refereniada | alumno_curso, producto_proveedor |

**Restricciones**

pk_cliente
fk_pedido_cliente
uq_cliente_correo_electronico
ck_producto_precio
df_cliente_activo


### DDL  en SQL Server CREATE, ALTER Y CROP para la creacion y modificacion de tablas

**SINTAXIS de creacionde tablas**

```sql
CREATE TABLE nombre_tabla
(
    columna tipo_dato restricciones,
    columna tipo_dato restricciones

)

## Alter table

Permite modificar una tabla existente

puede:

- agregar columnas
- eliminar columnas
- modificar columnas
- agregar restricciones
- eliminar restricciones

```
>>>>>>> construccion-bd
