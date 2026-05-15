create database tienda;
use tienda;

/*-------------------------------------------------------------
	tablas
-------------------------------------------------------------*/

create table clientes(
    id_clientes int identity(1,1),
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    edad int,
    correo varchar(50),
    cedula varchar(20)
);

create table empleados(
    id_empleados int identity(1,1),
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    edad int,
    correo varchar(50),
    telefono varchar(20),
    cedula varchar(20)
);

create table productos(
    id_productos int identity(1,1),
    nombre varchar(50) not null,
    descripcion varchar(255),
    precio decimal(10,2),
    stock int
);

create table ventas(
    id_ventas int identity(1,1),
    id_clientes int,
    id_empleados int,
    id_productos int,
    cantidad int,
    fecha datetime,
    total decimal(10,2)
);

create table historial_ventas (
    id_historial int identity(1,1) not null,
    id_venta int,
    id_producto int,
    cantidad int,
    precio decimal(10,2),
    total decimal(10,2),
    fecha_venta datetime,
    fecha_registro datetime default getdate()
);

/*-------------------------------------
	primary keys
---------------------------------------*/

alter table clientes add constraint pk_clientes primary key (id_clientes);
alter table empleados add constraint pk_empleados primary key (id_empleados);
alter table productos add constraint pk_productos primary key (id_productos);
alter table ventas add constraint pk_ventas primary key (id_ventas);
alter table historial_ventas add constraint pk_historial primary key (id_historial);

/*-------------------------------------
	foreign keys
---------------------------------------*/

alter table ventas add constraint fk_clientes foreign key (id_clientes) 
    references clientes(id_clientes);

alter table ventas add constraint fk_empleados foreign key (id_empleados) 
    references empleados(id_empleados);

alter table ventas add constraint fk_productos foreign key (id_productos) 
    references productos(id_productos);

alter table historial_ventas add constraint fk_venta foreign key(id_venta) 
    references ventas(id_ventas);

alter table historial_ventas add constraint fk_producto foreign key(id_producto)
    references productos(id_productos);

/*--------------------------------------
	restricciones
----------------------------------------*/

/*---clientes---*/
alter table clientes add constraint chk_edad_clientes 
    check (edad >= 18);

alter table clientes add constraint uni_correo_clientes 
    unique(correo);

alter table clientes add constraint uni_cedula_clientes 
    unique(cedula);

/*---empleados---*/
alter table empleados add constraint chk_edad_empleados 
    check(edad >= 18);

alter table empleados add constraint uni_correo_empleados 
    unique (correo);

alter table empleados add constraint def_telefono_empleados
    default 'No especificado' for telefono;

alter table empleados add constraint uni_cedula_empleados 
    unique(cedula);

/*---productos----*/
alter table productos add constraint def_descripcion_productos
    default 'Sin descripción' for descripcion;

alter table productos add constraint chk_precio_productos
    check(precio >= 0);

alter table productos add constraint chk_stock_productos
    check(stock >= 0);

/*---ventas---*/
alter table ventas add constraint chk_cantidad_ventas
    check(cantidad > 0);

alter table ventas add constraint def_fecha_ventas
    default getdate() for fecha;

alter table ventas add constraint chk_fecha_ventas
    check(fecha <= getdate());

/*--------------------------------------
	procedimientos almacenados - consultar
----------------------------------------*/

create procedure consultar_clientes
as
begin
    select * from clientes;
end;
go

create procedure consultar_empleados
as
begin
    select * from empleados;
end;
go

create procedure consultar_productos
as
begin
    select * from productos;
end;
go

create procedure consultar_ventas
as
begin	
    select 
        v.id_ventas,
        v.id_clientes,
        c.nombre + ' ' + c.apellido as cliente,
        v.id_empleados,
        e.nombre + ' ' + e.apellido as empleado,
        v.id_productos,
        p.nombre as producto,
        v.cantidad,
        p.precio as precio_unitario,
        v.total,
        v.fecha
    from ventas v
    inner join clientes c on v.id_clientes = c.id_clientes
    inner join empleados e on v.id_empleados = e.id_empleados
    inner join productos p on v.id_productos = p.id_productos;
end;
go

create procedure consultar_historial_ventas
as
begin
    select 
        h.id_historial,
        h.id_venta,
        h.id_producto,
        p.nombre as producto,
        h.cantidad,
        h.precio,
        h.total,
        h.fecha_venta,
        h.fecha_registro
    from historial_ventas h
    inner join productos p on h.id_producto = p.id_productos
    order by h.fecha_venta desc;
end;
go

/*--------------------------------------
	procedimientos almacenados - agregar
----------------------------------------*/

create procedure agregar_cliente
    @nombre varchar(50),
    @apellido varchar(50),
    @edad int,
    @correo varchar(50),
    @cedula varchar(20)
as
begin
    insert into clientes (nombre, apellido, edad, correo, cedula)
    values (@nombre, @apellido, @edad, @correo, @cedula);
end;
go

create procedure agregar_empleado
    @nombre varchar(50),
    @apellido varchar(50),
    @edad int,
    @correo varchar(50),
    @telefono varchar(20),
    @cedula varchar(20)
as
begin
    insert into empleados (nombre, apellido, edad, correo, telefono, cedula)
    values (@nombre, @apellido, @edad, @correo, @telefono, @cedula);
end;
go

create procedure agregar_producto
    @nombre varchar(50),
    @descripcion varchar(255),
    @precio decimal(10,2),
    @stock int
as
begin
    insert into productos (nombre, descripcion, precio, stock)
    values (@nombre, @descripcion, @precio, @stock);
end;
go

create procedure agregar_venta
    @id_clientes int,
    @id_empleados int,
    @id_productos int,
    @cantidad int
as
begin
    set nocount on;
    
    declare @stock_actual int;
    declare @precio_unitario decimal(10,2);
    declare @total_venta decimal(10,2);
    
    -- verificar que el producto existe
    if not exists (select 1 from productos where id_productos = @id_productos)
    begin
        raiserror('El producto no existe', 16, 1);
        return;
    end
    
    -- obtener stock y precio del producto
    select @stock_actual = stock, @precio_unitario = precio
    from productos
    where id_productos = @id_productos;
    
    -- verificar que hay suficiente stock
    if @stock_actual < @cantidad
    begin
        raiserror('Stock insuficiente. Stock disponible: %d', 16, 1, @stock_actual);
        return;
    end
    
    -- calcular el total
    set @total_venta = @precio_unitario * @cantidad;
    
    -- iniciar transacción
    begin transaction;
    
    begin try
        -- insertar la venta
        insert into ventas (id_clientes, id_empleados, id_productos, cantidad, total)
        values (@id_clientes, @id_empleados, @id_productos, @cantidad, @total_venta);
        
        -- actualizar el stock
        update productos
        set stock = stock - @cantidad
        where id_productos = @id_productos;
        
        commit transaction;
        
        print 'Venta registrada exitosamente';
        print 'Total: $' + cast(@total_venta as varchar(20));
        print 'Stock restante: ' + cast(@stock_actual - @cantidad as varchar(10));
    end try
    begin catch
        rollback transaction;
        throw;
    end catch
end;
go

/*--------------------------------------
	procedimientos almacenados - modificar
----------------------------------------*/

create procedure modificar_cliente
    @id_clientes int,
    @nombre varchar(50),
    @apellido varchar(50),
    @edad int,
    @correo varchar(50),
    @cedula varchar(20)
as
begin
    update clientes
    set nombre = @nombre,
        apellido = @apellido,
        edad = @edad,
        correo = @correo,
        cedula = @cedula
    where id_clientes = @id_clientes;
end;
go

create procedure modificar_empleado
    @id_empleados int,
    @nombre varchar(50),
    @apellido varchar(50),
    @edad int,
    @correo varchar(50),
    @telefono varchar(20),
    @cedula varchar(20)
as
begin
    update empleados
    set nombre = @nombre,
        apellido = @apellido,
        edad = @edad,
        correo = @correo,
        telefono = @telefono,
        cedula = @cedula
    where id_empleados = @id_empleados;
end;
go

create procedure modificar_producto
    @id_productos int,
    @nombre varchar(50),
    @descripcion varchar(255),
    @precio decimal(10,2),
    @stock int
as
begin
    update productos
    set nombre = @nombre,
        descripcion = @descripcion,
        precio = @precio,
        stock = @stock
    where id_productos = @id_productos;
end;
go

/*--------------------------------------
	procedimientos almacenados - eliminar
----------------------------------------*/

create procedure eliminar_cliente
    @id_clientes int
as
begin
    delete from clientes where id_clientes = @id_clientes;
end;
go

create procedure eliminar_empleado
    @id_empleados int
as
begin
    delete from empleados where id_empleados = @id_empleados;
end;
go

create procedure eliminar_producto
    @id_productos int
as
begin
    delete from productos where id_productos = @id_productos;
end;
go

/*--------------------------------------
	triggers
----------------------------------------*/

-- trigger para registrar en historial_ventas
create trigger trg_historial_ventas
on ventas
after insert
as
begin
    set nocount on;
    
    insert into historial_ventas (
        id_venta,
        id_producto,
        cantidad,
        precio,
        total,
        fecha_venta
    )
    select 
        i.id_ventas,
        i.id_productos,
        i.cantidad,
        p.precio,
        i.total,
        i.fecha
    from inserted i
    inner join productos p on i.id_productos = p.id_productos;
end;
go

/*--------------------------------------
	vistas adicionales 
----------------------------------------*/

-- vista de productos con bajo stock
create view vw_productos_bajo_stock
as
select 
    id_productos,
    nombre,
    descripcion,
    precio,
    stock
from productos
where stock <= 10;
go

-- vista de resumen de ventas por producto
create view vw_resumen_ventas_producto
as
select 
    p.id_productos,
    p.nombre as producto,
    count(v.id_ventas) as total_ventas,
    sum(v.cantidad) as unidades_vendidas,
    sum(v.total) as ingreso_total
from productos p
left join ventas v on p.id_productos = v.id_productos
group by p.id_productos, p.nombre;
go

-- vista de ventas por cliente
create view vw_ventas_por_cliente
as
select 
    c.id_clientes,
    c.nombre + ' ' + c.apellido as cliente,
    count(v.id_ventas) as total_compras,
    sum(v.total) as total_gastado
from clientes c
left join ventas v on c.id_clientes = v.id_clientes
group by c.id_clientes, c.nombre, c.apellido;
go

/*--------------------------------------
	pruebas
----------------------------------------*/
