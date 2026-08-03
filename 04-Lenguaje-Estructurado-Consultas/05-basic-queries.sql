/*========================================================================

Tema:Consultas Basicas con Select

Archivo: 05-basic-queries.sql

Descripcion:
Desarrollar la capacidad para construir consultas basicas mediante select

=========================================================================*/

USE comercial_db;
GO

/*==========================================

Uso del SELECT *

Sintaxis:

SELECT *
FROM nombre_tabla;

NOTA: el * significa todas las columnas de una tabla (no es recomendable su uso) campos NO atributos

porqe no se recomienda utilizarlo siempre

1.recupera informacion innecesaria
2.reduce la claridad de la consulta
3.puede aumentar el consumo de recursos

=========================================*/

--seleccionar todos los registros y campos de la tabla productos

SELECT *
FROM productos;

--proyeccion (forma correcta de preferencia- consultas)
SELECT
	codigo,
	nombre,
	precio
FROM productos;
GO

--alias de columna
-- un alias de columna es un nombre temporal asignado a una columna 
--dentro del resultado de una columna

SELECT 
	codigo,
	nombre,
	precio
FROM productos

--DIFERENTES FORMAS DE PONERLO

SELECT 
	codigo AS codigo_producto,
	nombre AS nombre_producto,
	precio AS precio_producto
FROM productos;
GO

SELECT 
	codigo AS [codigo_producto],
	nombre AS [nombre_producto],
	precio AS [precio_producto]
FROM productos;
GO

SELECT 
	codigo AS 'codigo_producto',
	nombre AS 'nombre_producto',
	precio AS 'precio_producto'
FROM productos;
GO

-- poner el AS para que se sepa que es un alias
SELECT 
	codigo 'codigo_producto',
	nombre 'nombre_producto',
	precio 'precio_producto'
FROM productos;
GO

SELECT 
	codigo AS [codigo_producto],
	nombre 'nombre_producto',
	precio precio_producto
FROM productos;
GO

-- alias de tabla
--tambien se puede asignar un alias temporal a una tabla

--sintaxis

/*
SELECT alias_tabla.columna
FROM nombre_tabla AS alias_tabla;
*/

SELECT
	p.codigo,
	p.nombre,
	p.precio
FROM productos AS p;

SELECT categorias.nombre, productos.nombre 
FROM categorias
INNER JOIN productos
ON categorias.id_categoria = productos.id_categoria;
GO

SELECT 
c.id_categoria AS  [#categoria] ,
c.nombre AS [nombre categoria] ,
p.id_producto AS [#producto] ,
p.nombre AS [nombre producto] ,
p.precio,
p.existencia 
FROM categorias AS c
INNER JOIN productos AS p
ON c.id_categoria = p.id_categoria;
GO

-- campos calculados/columnas calculadas
--una columna calculada es el resultdo de una exxpresion incluida 
--en la lista de seleccion
--No existe fisicamente en la tabla

SELECT 
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	p.existencia * p.precio AS valor_inventario
FROM productos AS p;

--seleccionar el nombre, apellido paterno, salario, y simular 
-- como quedaria el salario de cada empleado si recibiera un 
-- aumento fijo de $1000, el campo se debe llamar salario_simulado


SELECT 
	e.nombre,
	e.apellido_paterno,
	CONCAT(e.nombre, '' , e.apellido_paterno, '' , e.apellido_materno) AS nombre_completo,
	YEAR(e.fecha_ingreso) AS año_ingreso,
	MONTH (e.fecha_ingreso) AS mes_ingreso,
	DAY(e.fecha_ingreso) AS dia_ingreso,
	e.fecha_ingreso,
	e.salario,
	(e.salario + 1000) AS salario_simulado
FROM empleados AS e;
GO

-- monstrar de una venta cual es su numero, cantidad vendida, precio,
-- descuento, importe_bruto (cantidadpor el precio) y ademas el
-- importe_descuento (importe_bruto por el descuento dividido entre 100)

SELECT
	dv.id_detalle_venta AS numero_ventas,
	dv.cantidad,
	dv.precio,
	dv.descuento,
	dv.cantidad * dv.precio AS importe_bruto,
	(dv.cantidad * dv.precio * dv.descuento / 100.0) AS importe_descuento
FROM detalle_ventas AS dv;
GO


/* ===============================================
operadores aritmeticos en SQL SERVER

+ suma
- resta
* multiplicacion
/ division
% modulo - residuo de division
====================================================*/

-- uso de la clausula DISTINCT
--elimina del resultado las filas que tengas valores repetidos en todas 
--las columnas seleccionadas 

SELECT c.sexo
FROM clientes AS c;

SELECT COUNT (c.sexo) AS cantidad_sexo
FROM clientes AS c;

SELECT DISTINCT sexo
FROM clientes AS c;

SELECT COUNT (DISTINCT sexo) AS numero_sexos
FROM clientes AS c;

--selecionar los distintos descuentos que se realizan a las  ventas

SELECT
descuento
FROM detalle_ventas
ORDER BY descuento DESC;

-- todo: disting con mas de un campo