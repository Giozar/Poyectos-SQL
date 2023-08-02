-- creamos la base de datos de ventas
create database venta;
use venta;
-- creamos la tablas del proyecto
-- tabla 1 cliente
create table cliente (
    id_cliente INT AUTO_INCREMENT,
    nombre VARCHAR (50) NOT NULL,
    direccion VARCHAR (50) NOT NULL,
    telefono VARCHAR (50) NOT NULL,
    RFC VARCHAR (50) NOT NULL,
    PRIMARY KEY (id_cliente)
);
-- tabla 2 sucursal
create table sucursal (
    id_sucursal INT AUTO_INCREMENT,
    nombre VARCHAR (50) NOT NULL,
    direccion VARCHAR (50) NOT NULL,
    PRIMARY KEY (id_sucursal)
);

-- tabla 3 proovedor
create table proveedor (
    id_proveedor INT AUTO_INCREMENT,
    nombre VARCHAR (50) NOT NULL,
    direccion VARCHAR (50) NOT NULL,
    RFC VARCHAR (50) NOT NULL,
    PRIMARY KEY (id_proveedor)
);
-- tabla 4 tipoProducto
create table tipoProducto (
    id_tipoProducto INT AUTO_INCREMENT,
    nombre VARCHAR (50) NOT NULL,
    descripcion VARCHAR (50) NOT NULL,
    proveedor_idproveedor INT NOT NULL,
    PRIMARY KEY (id_tipoProducto),
    CONSTRAINT fk_tipoProducto_proveedor1 FOREIGN KEY (proveedor_idproveedor) REFERENCES proveedor (id_proveedor)
);

-- tabla 5 producto
create table producto (
    id_producto INT AUTO_INCREMENT,
    nombre VARCHAR (50) NOT NULL,
    descripcion VARCHAR (50) NOT NULL,
    precio DOUBLE NOT NULL,
    tipoProducto_idtipoProducto INT NOT NULL,
    PRIMARY KEY (id_producto),
    CONSTRAINT fk_producto_tipoProducto1
        FOREIGN KEY (tipoProducto_idtipoProducto) REFERENCES tipoProducto (id_tipoProducto)
);

-- tabla 6 traspaso
create table traspaso (
    id_traspaso INT AUTO_INCREMENT,
    sucursal_idsucursalOrigen INT NOT NULL,
    sucursal_idsucursalDestino INT NOT NULL,
    producto_idproducto INT NOT NULL,
    fecha_traspaso DATE NOT NULL,
    PRIMARY KEY (id_traspaso),
    CONSTRAINT fk_traspaso_sucursal1
        FOREIGN KEY (sucursal_idsucursalOrigen) REFERENCES sucursal (id_sucursal),
    CONSTRAINT fk_traspaso_sucursal2
        FOREIGN KEY (sucursal_idsucursalDestino) REFERENCES sucursal (id_sucursal),
    CONSTRAINT fk_traspaso_producto1
        FOREIGN KEY (producto_idproducto) REFERENCES producto (id_producto)
);

-- tabla 7 venta
create table venta (
    id_venta INT AUTO_INCREMENT,
    cliente_idcliente INT NOT NULL,
    sucursal_idsucursal INT NOT NULL,
    fecha DATE NOT NULL,
    total DOUBLE NOT NULL,
    PRIMARY KEY (id_venta),
    CONSTRAINT fk_venta_cliente1
        FOREIGN KEY (cliente_idcliente) REFERENCES cliente (id_cliente),
    CONSTRAINT fk_venta_sucursal1
        FOREIGN KEY (sucursal_idsucursal) REFERENCES sucursal (id_sucursal)
);

-- tabla 8 productoVenta
create table productoVenta (
    id_productoVenta INT AUTO_INCREMENT,
    venta_idventa INT NOT NULL,
    producto_idproducto INT NOT NULL,
    sucursal_idsucursal INT NOT NULL,
    PRIMARY KEY (id_productoVenta),
    CONSTRAINT fk_productoVenta_venta1
        FOREIGN KEY (venta_idventa) REFERENCES venta (id_venta),
    CONSTRAINT fk_productoVenta_producto1
        FOREIGN KEY (producto_idproducto) REFERENCES producto (id_producto),
    CONSTRAINT fk_productoVenta_sucursal1
        FOREIGN KEY (sucursal_idsucursal) REFERENCES sucursal (id_sucursal)
);

-- tabla 9 productoTraspaso
create table productoTraspaso (
    id_productoTraspaso INT AUTO_INCREMENT,
    traspaso_idtraspaso INT NOT NULL,
    producto_idproducto INT NOT NULL,
    sucursal_idsucursalOrigen INT NOT NULL,
    sucursal_idsucursalDestino INT NOT NULL,
    PRIMARY KEY (id_productoTraspaso),
    CONSTRAINT fk_productoTraspaso_traspaso1
        FOREIGN KEY (traspaso_idtraspaso) REFERENCES traspaso (id_traspaso),
    CONSTRAINT fk_productoTraspaso_producto1
        FOREIGN KEY (producto_idproducto) REFERENCES producto (id_producto),
    CONSTRAINT fk_productoTraspaso_sucursal1
        FOREIGN KEY (sucursal_idsucursalOrigen) REFERENCES sucursal (id_sucursal),
    CONSTRAINT fk_productoTraspaso_sucursal2
        FOREIGN KEY (sucursal_idsucursalDestino) REFERENCES sucursal (id_sucursal)
);

-- tabla 10 devolucion
create table devolucion (
    id_devolucion INT AUTO_INCREMENT,
    venta_idventa INT NOT NULL,
    sucursal_idsucursal INT NOT NULL,
    fecha DATE NOT NULL,
    total DOUBLE NOT NULL,
    PRIMARY KEY (id_devolucion),
    CONSTRAINT fk_devolucion_venta1
        FOREIGN KEY (venta_idventa) REFERENCES venta (id_venta),
    CONSTRAINT fk_devolucion_sucursal1
        FOREIGN KEY (sucursal_idsucursal) REFERENCES sucursal (id_sucursal)
);
-- tabla 11 devolucionProducto
create table devolucionProducto (
    id_devolucionProducto INT AUTO_INCREMENT,
    productoVenta_idproductoVenta INT NOT NULL,
    devolucion_iddevolucion INT NOT NULL,
    PRIMARY KEY (id_devolucionProducto),
    CONSTRAINT fk_devolucionProducto_productoVenta1
        FOREIGN KEY (productoVenta_idproductoVenta) REFERENCES productoVenta (id_productoVenta),
    CONSTRAINT fk_devolucionProducto_devolucion1
        FOREIGN KEY (devolucion_iddevolucion) REFERENCES devolucion (id_devolucion)
);

-- 1 Llene las tablas Proveedor, tipoProducto, cliente, y sucursal con al menos 5 instancias.
-- Llenar tabla proveedor
insert into proveedor (nombre, direccion, RFC) values ('Luca Biyin Lavouer', 'Paris, Francia av 12', 'LBL1234');
insert into proveedor (nombre, direccion, RFC) values ('Anderson Green Ligth', 'Silicon valley, USA 134', 'AND1234');
insert into proveedor (nombre, direccion, RFC) values ('Alluka Kamado Akaza', ' Tokio, Japon av 35', 'AKA1234');
insert into proveedor (nombre, direccion, RFC) values ('Yo Chon Sue', 'Yingu Building, Pekín, China', 'YCS1234');
insert into proveedor (nombre, direccion, RFC) values ('Wong Moni Ru', 'Deagu, corea del sur', ' WMR1234');
-- Llenar tipoProducto
insert into tipoProducto (nombre, descripcion, proveedor_idproveedor) values ('Apple', 'Gama Alta', 1);
insert into tipoProducto (nombre, descripcion, proveedor_idproveedor) values ('Samsung', 'Gama media', 2);
insert into tipoProducto (nombre, descripcion, proveedor_idproveedor) values ('Sony', 'Gama baja', 3);
insert into tipoProducto (nombre, descripcion, proveedor_idproveedor) values ('Xiaomi', 'Uso rudo', 4);
insert into tipoProducto (nombre, descripcion, proveedor_idproveedor) values ('Alcatel', 'Clasico', 5);
-- Llenar tabla cliente
insert into cliente (nombre, direccion, telefono, RFC) values ('Juan Colorado Perez', 'Calle enrrique zegobiano', '55234567', 'JCP');
insert into cliente (nombre, direccion, telefono, RFC) values ('Andra cruz sanchez', 'Calle venustiano carranza 101', '5525234896', 'ACS');
insert into cliente (nombre, direccion, telefono, RFC) values ('Isabella Rose Fiona', 'Avenida shrek para siempre', '5568423985', 'IRF');
insert into cliente (nombre, direccion, telefono, RFC) values ('Gustavo rodriguez Dios', 'Andador Paloma', '9931269856', 'GRD');
insert into cliente (nombre, direccion, telefono, RFC) values ('Jaime Ruiz Odette', 'Infonavit', '5225648932', 'JRO');

-- Llenar tabla sucursal
insert into sucursal (nombre, direccion) values ('Arboledo 101', 'Calle Francisco 1');
insert into sucursal (nombre, direccion) values ('Chabusco 102', 'Calle Genao 22');
insert into sucursal (nombre, direccion) values ('Arandano 103', 'Allende 33');
insert into sucursal (nombre, direccion) values ('Molina 104', 'Robledo 44');
insert into sucursal (nombre, direccion) values ('Puente 105', 'Garcia 35');

-- 2 Llene las tablas Producto, Venta y Traspaso con al menos 10 instancias
-- insertamos datos en tabla producto
insert into producto (nombre, descripcion, precio, tipoProducto_idtipoProducto) values ('Iphone 12', '128gb ', 18000, 1);
insert into producto (nombre, descripcion, precio, tipoProducto_idtipoProducto) values ('Iphone 11', '256gb ', 25000, 1);  
insert into producto (nombre, descripcion, precio, tipoProducto_idtipoProducto) values ('Galxy', '32gb ', 15000, 2);
insert into producto (nombre, descripcion, precio, tipoProducto_idtipoProducto) values ('Galaxy S10', '64gb ', 10000, 2);
insert into producto (nombre, descripcion, precio, tipoProducto_idtipoProducto) values ('Sony xperia', '16gb ', 18000, 3);
insert into producto (nombre, descripcion, precio, tipoProducto_idtipoProducto) values ('Sony xperia xz', '32gb ', 25000, 3);
insert into producto (nombre, descripcion, precio, tipoProducto_idtipoProducto) values ('Xiaomi red note', '64gb ', 15000, 4);
insert into producto (nombre, descripcion, precio, tipoProducto_idtipoProducto) values ('Xiaomi red note pro', '128gb ', 10000, 4);
insert into producto (nombre, descripcion, precio, tipoProducto_idtipoProducto) values ('Alcatel', '16gb ', 1800, 5);
insert into producto (nombre, descripcion, precio, tipoProducto_idtipoProducto) values ('Alcatel', '32gb ', 2500, 5);

-- insertamos datos en tabla venta
insert into venta (cliente_idcliente, sucursal_idsucursal, fecha, total) values (1, 1, '2021-01-11',18000 );
insert into venta (cliente_idcliente, sucursal_idsucursal, fecha, total) values (2, 2, '2021-02-12',25000 );
insert into venta (cliente_idcliente, sucursal_idsucursal, fecha, total) values (3, 3, '2021-03-25',15000 );
insert into venta (cliente_idcliente, sucursal_idsucursal, fecha, total) values (4, 4, '2021-04-16',10000 );
insert into venta (cliente_idcliente, sucursal_idsucursal, fecha, total) values (2, 5, '2021-05-08',18000 );
insert into venta (cliente_idcliente, sucursal_idsucursal, fecha, total) values (5, 2, '2021-05-27',25000 );
insert into venta (cliente_idcliente, sucursal_idsucursal, fecha, total) values (4, 3, '2021-07-09',15000 );
insert into venta (cliente_idcliente, sucursal_idsucursal, fecha, total) values (5, 5, '2021-08-20',10000 );
insert into venta (cliente_idcliente, sucursal_idsucursal, fecha, total) values (1, 3, '2021-09-21',1800 );
insert into venta (cliente_idcliente, sucursal_idsucursal, fecha, total) values (3, 4, '2021-11-24',2500 );

-- Llenar tabla traspaso
insert into traspaso (sucursal_idsucursalOrigen, sucursal_idsucursalDestino, producto_idproducto, fecha_traspaso) values (1, 2, 1, '2021-01-11');
insert into traspaso (sucursal_idsucursalOrigen, sucursal_idsucursalDestino, producto_idproducto, fecha_traspaso) values (2, 3, 2, '2021-02-11');
insert into traspaso (sucursal_idsucursalOrigen, sucursal_idsucursalDestino, producto_idproducto, fecha_traspaso) values (3, 4, 3, '2021-03-22');
insert into traspaso (sucursal_idsucursalOrigen, sucursal_idsucursalDestino, producto_idproducto, fecha_traspaso) values (4, 5, 4, '2021-04-18');
insert into traspaso (sucursal_idsucursalOrigen, sucursal_idsucursalDestino, producto_idproducto, fecha_traspaso) values (2, 1, 5, '2021-05-08');
insert into traspaso (sucursal_idsucursalOrigen, sucursal_idsucursalDestino, producto_idproducto, fecha_traspaso) values (5, 2, 6, '2021-05-05');
insert into traspaso (sucursal_idsucursalOrigen, sucursal_idsucursalDestino, producto_idproducto, fecha_traspaso) values (4, 3, 7, '2021-07-29');
insert into traspaso (sucursal_idsucursalOrigen, sucursal_idsucursalDestino, producto_idproducto, fecha_traspaso) values (5, 2, 8, '2021-08-22');
insert into traspaso (sucursal_idsucursalOrigen, sucursal_idsucursalDestino, producto_idproducto, fecha_traspaso) values (1, 3, 9, '2021-09-22');
insert into traspaso (sucursal_idsucursalOrigen, sucursal_idsucursalDestino, producto_idproducto, fecha_traspaso) values (3, 4, 10, '2021-11-28');

-- 3 Llene las tablas Producto, Venta y Traspaso con al menos 10 instancias.

insert into producto (nombre, descripcion, precio, tipoProducto_idtipoProducto) values ('Iphone 13 Pro Max', '256gb 64mpx ', 30000, 1);
insert into producto (nombre, descripcion, precio, tipoProducto_idtipoProducto) values ('Iphone 13', '256gb 32mpx ', 28000, 1);  
insert into producto (nombre, descripcion, precio, tipoProducto_idtipoProducto) values ('Galaxy tab', '64gb ', 21000, 2);
insert into producto (nombre, descripcion, precio, tipoProducto_idtipoProducto) values ('Galaxy S12', '64gb ', 18000, 2);
insert into producto (nombre, descripcion, precio, tipoProducto_idtipoProducto) values ('Sony ericson ', '64gb ', 19000, 3);
insert into producto (nombre, descripcion, precio, tipoProducto_idtipoProducto) values ('Sony xperia', '32gb ', 20000, 3);
insert into producto (nombre, descripcion, precio, tipoProducto_idtipoProducto) values ('Xiaomi red note 10', '64gb ', 13000, 4);
insert into producto (nombre, descripcion, precio, tipoProducto_idtipoProducto) values ('Xiaomi platinum', '128gb ', 120000, 4);
insert into producto (nombre, descripcion, precio, tipoProducto_idtipoProducto) values ('Alcatel z', '16gb ', 2800, 5);
insert into producto (nombre, descripcion, precio, tipoProducto_idtipoProducto) values ('Alcatel x', '32gb ', 2000, 5);

-- insertamos datos en tabla venta
insert into venta (cliente_idcliente, sucursal_idsucursal, fecha, total) values (1, 1, '2021-01-11',30000 );
insert into venta (cliente_idcliente, sucursal_idsucursal, fecha, total) values (2, 2, '2021-02-11',28000 );
insert into venta (cliente_idcliente, sucursal_idsucursal, fecha, total) values (3, 3, '2021-03-22',21000 );
insert into venta (cliente_idcliente, sucursal_idsucursal, fecha, total) values (4, 4, '2021-04-18',18000 );
insert into venta (cliente_idcliente, sucursal_idsucursal, fecha, total) values (5, 5, '2021-05-08',19000 );
insert into venta (cliente_idcliente, sucursal_idsucursal, fecha, total) values (1, 3, '2021-05-05',20000 );
insert into venta (cliente_idcliente, sucursal_idsucursal, fecha, total) values (3, 4, '2021-07-29',13000 );
insert into venta (cliente_idcliente, sucursal_idsucursal, fecha, total) values (5, 2, '2021-08-22',120000 );
insert into venta (cliente_idcliente, sucursal_idsucursal, fecha, total) values (1, 4, '2021-09-22',2800 );
insert into venta (cliente_idcliente, sucursal_idsucursal, fecha, total) values (3, 5, '2021-11-28',2000 );
-- insertamos en tabla traspaso
insert into traspaso (sucursal_idsucursalOrigen, sucursal_idsucursalDestino, producto_idproducto, fecha_traspaso) values (1, 2, 11, '2021-02-13');
insert into traspaso (sucursal_idsucursalOrigen, sucursal_idsucursalDestino, producto_idproducto, fecha_traspaso) values (2, 3, 12, '2021-03-22');
insert into traspaso (sucursal_idsucursalOrigen, sucursal_idsucursalDestino, producto_idproducto, fecha_traspaso) values (3, 4, 13, '2021-04-18');
insert into traspaso (sucursal_idsucursalOrigen, sucursal_idsucursalDestino, producto_idproducto, fecha_traspaso) values (4, 5, 14, '2021-05-08');
insert into traspaso (sucursal_idsucursalOrigen, sucursal_idsucursalDestino, producto_idproducto, fecha_traspaso) values (5, 2, 15, '2021-05-05');
insert into traspaso (sucursal_idsucursalOrigen, sucursal_idsucursalDestino, producto_idproducto, fecha_traspaso) values (1, 3, 16, '2021-07-29');
insert into traspaso (sucursal_idsucursalOrigen, sucursal_idsucursalDestino, producto_idproducto, fecha_traspaso) values (3, 4, 17, '2021-08-22');
insert into traspaso (sucursal_idsucursalOrigen, sucursal_idsucursalDestino, producto_idproducto, fecha_traspaso) values (5, 2, 18, '2021-09-22');
insert into traspaso (sucursal_idsucursalOrigen, sucursal_idsucursalDestino, producto_idproducto, fecha_traspaso) values (1, 4, 19, '2021-11-28');
insert into traspaso (sucursal_idsucursalOrigen, sucursal_idsucursalDestino, producto_idproducto, fecha_traspaso) values (3, 5, 20, '2021-11-28');
-- 4 Llene las tablas Producto/Venta y Traspaso/Producto con al menos 20 instancias cada una.
-- Llenamos tabla producto/venta
insert into productoVenta (venta_idventa, producto_idproducto, sucursal_idsucursal) values (11, 11, 1);
insert into productoVenta (venta_idventa, producto_idproducto, sucursal_idsucursal) values (12, 12, 2);
insert into productoVenta (venta_idventa, producto_idproducto, sucursal_idsucursal) values (13, 13, 3);
insert into productoVenta (venta_idventa, producto_idproducto, sucursal_idsucursal) values (14, 14, 4);
insert into productoVenta (venta_idventa, producto_idproducto, sucursal_idsucursal) values (15, 15, 5);
insert into productoVenta (venta_idventa, producto_idproducto, sucursal_idsucursal) values (16, 16, 1);
insert into productoVenta (venta_idventa, producto_idproducto, sucursal_idsucursal) values (17, 17, 3);
insert into productoVenta (venta_idventa, producto_idproducto, sucursal_idsucursal) values (18, 18, 4);
insert into productoVenta (venta_idventa, producto_idproducto, sucursal_idsucursal) values (19, 19, 5);
insert into productoVenta (venta_idventa, producto_idproducto, sucursal_idsucursal) values (20, 20, 2);
insert into productoVenta (venta_idventa, producto_idproducto, sucursal_idsucursal) values (1, 1, 2);
insert into productoVenta (venta_idventa, producto_idproducto, sucursal_idsucursal) values (2, 2, 3);
insert into productoVenta (venta_idventa, producto_idproducto, sucursal_idsucursal) values (3, 3, 4);
insert into productoVenta (venta_idventa, producto_idproducto, sucursal_idsucursal) values (4, 4, 5);
insert into productoVenta (venta_idventa, producto_idproducto, sucursal_idsucursal) values (5, 5, 2);
insert into productoVenta (venta_idventa, producto_idproducto, sucursal_idsucursal) values (6, 6, 3);
insert into productoVenta (venta_idventa, producto_idproducto, sucursal_idsucursal) values (7, 7, 4);
insert into productoVenta (venta_idventa, producto_idproducto, sucursal_idsucursal) values (8, 8, 5);
insert into productoVenta (venta_idventa, producto_idproducto, sucursal_idsucursal) values (9, 9, 2);
insert into productoVenta (venta_idventa, producto_idproducto, sucursal_idsucursal) values (10, 10, 3);

-- llenamos tabla traspaso/producto
insert into productoTraspaso (traspaso_idtraspaso, producto_idproducto, sucursal_idsucursalOrigen, sucursal_idsucursalDestino) values (1, 1, 1, 2);
insert into productoTraspaso (traspaso_idtraspaso, producto_idproducto, sucursal_idsucursalOrigen, sucursal_idsucursalDestino) values (2, 2, 2, 3);
insert into productoTraspaso (traspaso_idtraspaso, producto_idproducto, sucursal_idsucursalOrigen, sucursal_idsucursalDestino) values (3, 3, 3, 4);
insert into productoTraspaso (traspaso_idtraspaso, producto_idproducto, sucursal_idsucursalOrigen, sucursal_idsucursalDestino) values (4, 4, 4, 5);
insert into productoTraspaso (traspaso_idtraspaso, producto_idproducto, sucursal_idsucursalOrigen, sucursal_idsucursalDestino) values (11, 11, 1, 2);
insert into productoTraspaso (traspaso_idtraspaso, producto_idproducto, sucursal_idsucursalOrigen, sucursal_idsucursalDestino) values (12, 12, 2, 3);
insert into productoTraspaso (traspaso_idtraspaso, producto_idproducto, sucursal_idsucursalOrigen, sucursal_idsucursalDestino) values (13, 13, 3, 4);
insert into productoTraspaso (traspaso_idtraspaso, producto_idproducto, sucursal_idsucursalOrigen, sucursal_idsucursalDestino) values (14, 14, 4, 5);
insert into productoTraspaso (traspaso_idtraspaso, producto_idproducto, sucursal_idsucursalOrigen, sucursal_idsucursalDestino) values (15, 5, 2, 1);
insert into productoTraspaso (traspaso_idtraspaso, producto_idproducto, sucursal_idsucursalOrigen, sucursal_idsucursalDestino) values (16, 6, 5, 2);
insert into productoTraspaso (traspaso_idtraspaso, producto_idproducto, sucursal_idsucursalOrigen, sucursal_idsucursalDestino) values (17, 7, 4, 3);
insert into productoTraspaso (traspaso_idtraspaso, producto_idproducto, sucursal_idsucursalOrigen, sucursal_idsucursalDestino) values (18, 8, 5, 2);
insert into productoTraspaso (traspaso_idtraspaso, producto_idproducto, sucursal_idsucursalOrigen, sucursal_idsucursalDestino) values (19, 9, 1, 3);
insert into productoTraspaso (traspaso_idtraspaso, producto_idproducto, sucursal_idsucursalOrigen, sucursal_idsucursalDestino) values (20, 10, 3, 4);
insert into productoTraspaso (traspaso_idtraspaso, producto_idproducto, sucursal_idsucursalOrigen, sucursal_idsucursalDestino) values (5, 15, 5, 2);
insert into productoTraspaso (traspaso_idtraspaso, producto_idproducto, sucursal_idsucursalOrigen, sucursal_idsucursalDestino) values (6, 16, 1, 3);
insert into productoTraspaso (traspaso_idtraspaso, producto_idproducto, sucursal_idsucursalOrigen, sucursal_idsucursalDestino) values (7, 17, 3, 4);
insert into productoTraspaso (traspaso_idtraspaso, producto_idproducto, sucursal_idsucursalOrigen, sucursal_idsucursalDestino) values (8, 18, 5, 2);
insert into productoTraspaso (traspaso_idtraspaso, producto_idproducto, sucursal_idsucursalOrigen, sucursal_idsucursalDestino) values (9, 19, 1, 4);
insert into productoTraspaso (traspaso_idtraspaso, producto_idproducto, sucursal_idsucursalOrigen, sucursal_idsucursalDestino) values (10, 20, 3, 5);
-- extra  para tener un producto mas vendido en una sucursal
insert into venta (cliente_idcliente, sucursal_idsucursal, fecha, total) values (4, 2, '2021-08-04',18000 );
insert into productoVenta (venta_idventa, producto_idproducto, sucursal_idsucursal) values (21, 11, 2);

-- 5 Llene las tablas Devolución con 1 instancia y dev/Producto con al menos 1 instancia.
-- llenamos tabla devolucion
insert into devolucion (venta_idventa, sucursal_idsucursal, fecha, total) values (1, 1, '2021-01-20', 18000);

-- lleamos tabla devolucion/producto
insert into devolucionProducto (productoVenta_idproductoVenta, devolucion_iddevolucion) values (11, 1);

-- 6 Genere una vista de los productos más vendidos. 
-- Para ello considere mostrar producto.id_producto, producto.nombre, producto.descripcion, proveedor.nombre y tipoProducto.nombre
create view productosMasVendidos as
select p.id_producto as id_producto, p.nombre as productonombre, p.descripcion as prodcutodescripcion, pr.nombre as proveedornombre, 
tp.nombre as tipoProductonombre, count(pv.producto_idproducto) as cantidadVendida from ((producto p inner join tipoProducto tp on p.tipoProducto_idtipoProducto = tp.id_tipoProducto) 
inner join proveedor pr on tp.proveedor_idproveedor = pr.id_proveedor) inner join productoVenta pv on p.id_producto = pv.producto_idproducto 
group by producto_idproducto order by count(producto_idproducto) desc;

-- 7 Genere una función que permita obtener el tipoProducto.Nombre del producto más vendido.
delimiter //
create procedure muestraProductoMasVendido()
begin
    select tp.nombre from productoVenta pv inner join producto p on pv.producto_idproducto = p.id_producto 
    inner join tipoProducto tp on p.tipoProducto_idtipoProducto = tp.id_tipoProducto
    group by pv.producto_idproducto order by count(pv.producto_idproducto) desc limit 1;
END //
delimiter ;
call muestraProductoMasVendido();

-- 8 Genere un procedimiento que muestre todos los productos de un proveedor con base en el nombre del proveedor.
delimiter //
create procedure muestraProductosProveedor(in nombreProveedor varchar(50))
begin
    select p.id_producto, p.nombre, p.descripcion, tp.nombre, pr.nombre from producto p inner join tipoProducto tp on p.tipoProducto_idtipoProducto = tp.id_tipoProducto
    inner join proveedor pr on tp.proveedor_idproveedor = pr.id_proveedor where pr.nombre = nombreProveedor;
END //
delimiter ;
call muestraProductosProveedor('Luca Biyin Lavouer');

-- 9 Genere una tabla llamada DevRespaldo con los campos: DervrespaldoID, DevID, VentaID, SucursalID, FechaDev, TotalDev, Sucursal, Usuario.
create table DevRespaldo (
    DervrespaldoID INT AUTO_INCREMENT,
    DevID INT NOT NULL,
    VentaID INT NOT NULL,
    SucursalID INT NOT NULL,
    FechaDev DATE NOT NULL,
    TotalDev DOUBLE NOT NULL,
    usuario varchar(50) not null,
    PRIMARY KEY (DervrespaldoID)
);

-- drop table DevRespaldo;

-- truncate table devolucion;
-- truncate table devolucionProducto;

-- 10 Genere un trigger en la tabla devolucion de modo que al eliminar un registro de esta, 
-- dicho registro se guarde en la tala RespaldoDev y que al mismo tiempo elimine los registros asociados en devolucionProducto.

DELIMITER //
CREATE TRIGGER respaldo BEFORE DELETE ON devolucion 
FOR EACH ROW
	BEGIN
		insert into DevRespaldo(DevID, VentaID, SucursalID,fechaDev,TotalDev,usuario ) values (old.id_devolucion, old.venta_idventa, old.sucursal_idsucursal, old.fecha, old.total, current_user());
        delete from devolucionProducto where devolucion_iddevolucion = old.id_devolucion;
	END//
DELIMITER ;

delete from devolucion where id_devolucion = 1;

-- drop trigger if exists respaldo;

-- llenamos tabla devolucion
-- insert into devolucion (venta_idventa, sucursal_idsucursal, fecha, total) values (1, 1, '2021-01-20', 18000);

-- lleamos tabla devolucion/producto
-- insert into devolucionProducto (productoVenta_idproductoVenta, devolucion_iddevolucion) values (11, 1);

