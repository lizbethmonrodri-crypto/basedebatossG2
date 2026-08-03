
/*============ CREAR BASE DE DATOS ==============*/
CREATE DATABASE Ventas;
GO

USE Ventas;
GO

/*============ CREAR TABLA CLIENTE ==============*/
CREATE TABLE cliente(
    numCliente INT NOT NULL IDENTITY(1,1),
    nombre VARCHAR(30) NOT NULL,
    apellido1 VARCHAR(30) NOT NULL,
    apellido2 VARCHAR(30),

    CONSTRAINT pk_cliente
    PRIMARY KEY (numCliente)
);
GO


/*============ CREAR TABLA PEDIDO ==============*/
CREATE TABLE pedido(
    numPedido INT NOT NULL IDENTITY(1,1),
    fechaPedido DATE NOT NULL,
    cliente INT NOT NULL,

    CONSTRAINT pk_pedido
    PRIMARY KEY (numPedido)
);
GO


/*============ CREAR TABLA PRODUCTO ==============*/
CREATE TABLE producto(
    numProducto INT NOT NULL IDENTITY(1,1),
    nombre VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,

    CONSTRAINT pk_producto
    PRIMARY KEY (numProducto),

    CONSTRAINT uq_producto_nombre
    UNIQUE (nombre),

    CONSTRAINT ck_producto_precio
    CHECK (precio > 0)
);
GO


/*============ CREAR TABLA DETALLE_PEDIDO ==============*/
CREATE TABLE detalle_pedido(
    numPedido INT NOT NULL,
    numProducto INT NOT NULL,
    precioVenta DECIMAL(10,2) NOT NULL,
    cantidadVenta INT NOT NULL,

    CONSTRAINT ck_detalle_pedido_precioVenta
    CHECK (precioVenta > 0),

    CONSTRAINT ck_detalle_pedido_cantidadVenta
    CHECK (cantidadVenta > 0),

    CONSTRAINT pk_detalle_pedido
    PRIMARY KEY (numPedido, numProducto)
);
GO


/*============ CREAR FOREIGN KEY DE PEDIDO CON CLIENTE ==============*/

ALTER TABLE pedido
ADD CONSTRAINT fk_pedido_cliente
FOREIGN KEY (cliente)
REFERENCES cliente(numCliente);
GO


/*============ CREAR FOREIGN KEY DE DETALLE_PEDIDO CON PEDIDO ==============*/

ALTER TABLE detalle_pedido
ADD CONSTRAINT fk_detalle_pedido_pedido
FOREIGN KEY (numPedido)
REFERENCES pedido(numPedido);
GO


/*============ CREAR FOREIGN KEY DE DETALLE_PEDIDO CON PRODUCTO ==============*/

ALTER TABLE detalle_pedido
ADD CONSTRAINT fk_detalle_pedido_producto
FOREIGN KEY (numProducto)
REFERENCES producto(numProducto);
