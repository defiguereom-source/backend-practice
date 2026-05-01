create database Tienda;
use Tienda;

/*-------------------------------------------------------------
	Tablas
-------------------------------------------------------------*/
 create table clientes(
 id_clientes int identity(1,1),
 nombre varchar(50),
 apellido varchar(50),
 edad int,
 correo varchar(50),
 cedula varchar(20)
 );

 create table empleados(
 id_empleados int identity(1,1),
 nombre varchar(50),
 apellido varchar(50),
 edad int,
 correo varchar(50),
 telefono varchar(20),
 cedula varchar(20)
 );

 create table productos(
 id_productos int identity(1,1),
 nombre varchar(50),
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
  );

  /*-------------------------------------
	 Primary Keys
  ---------------------------------------*/
  alter table clientes add constraint pk_clientes primary key (id_clientes);
  alter table empleados add constraint pk_empleados primary key (id_empleados);
  alter table productos add constraint pk_productos primary key (id_productos);
  alter table ventas add constraint pk_ventas primary key (id_ventas);

  /*-------------------------------------
	Foreign Keys
  ---------------------------------------*/

  alter table ventas add constraint fk_clientes foreign key (id_clientes) 
  references clientes(id_clientes);
  
  alter table ventas add constraint fk_empleados foreign key (id_empleados) 
  references empleados(id_empleados);

  alter table ventas add constraint fk_productos foreign key (id_productos) 
  references productos(id_productos);

  /*--------------------------------------
	 Restricciones
  ----------------------------------------*/
  
  /*---Clientes---*/

  alter table clientes add constraint chk_nombre_apellido_clientes 
  check(nombre != null and apellido != null);
  
  alter table clientes add constraint chk_edad_clientes 
  check (edad >= 18);

  alter table clientes add constraint uni_correo_clientes 
  unique(correo);

  alter table clientes add constraint uni_cedula_clientes 
  unique(cedula);

  
  /*---Empleados---*/

  alter table empleados add constraint chk_nombre_apellido_empleados 
  check(nombre != null and apellido != null);

  alter table empleados add constraint chk_edad_empleados 
  check(edad >= 18);

  alter table empleados add constraint uni_correo_empleados 
  unique (correo);
  
  alter table empleados add constraint def_telefono_empleados
  default 'No especificado' for telefono;

  alter table empleados add constraint uni_telefono_empleados 
  unique(telefono);

  alter table empleados add constraint uni_cedula_empleados 
  unique(cedula);


  /*---Productos----*/
 
  alter table productos add constraint chk_nombre_productos 
  check(nombre != null);

  alter table productos add constraint def_descripcion_productos
  default 'Sin descripción' for descripcion;

  alter table productos add constraint chk_precio_productos
  check(precio >= 0);

  alter table productos add constraint chk_stock_productos
  check(stock >= 0);


  /*---Ventas---*/
  alter table ventas add constraint chk_cantidad_ventas
  check(cantidad > 0);

  alter table ventas add constraint def_fecha_ventas
  default getdate() for fecha;

  alter table ventas add constraint chk_fecha_ventas
  check(fecha <= getdate());

  /*--------------------------------------
	Procedimientos almacenados
  ----------------------------------------*/
  	/*Consultar*/

	create procedure consultar_clientes
	as
	begin
	select * from clientes
	end;

	create procedure consultar_empleados
	as
	begin
	select * from empleados
	end;

	create procedure consultar_productos
	as
	begin
	select * from productos
	end;

	create procedure consultar_ventas
	as
	begin	
	select * from ventas
	end;

  /*Agregar*/

create procedure agregar_cliente
	@nombre VARCHAR(50),
	@apellido VARCHAR(50),
	@edad INT,
	@correo VARCHAR(50),
	@cedula VARCHAR(20)
	AS
	BEGIN
	insert into clientes (nombre, apellido, edad, correo, cedula)
	values (@nombre, @apellido, @edad, @correo, @cedula)
	END;

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
	values (@nombre, @apellido, @edad, @correo, @telefono, @cedula)
	end;

	create procedure agregar_producto
	@nombre varchar(50),
	@descripcion varchar(255),
	@precio decimal(10,2),
	@stock int
	as
	begin
	insert into productos (nombre, descripcion, precio, stock)
	values (@nombre, @descripcion, @precio, @stock)
	end;

	create procedure agregar_venta
	@id_clientes int,
	@id_empleados int,
	@id_productos int,
	@cantidad int
	as
	begin
	insert into ventas (id_clientes, id_empleados, id_productos, cantidad)
	values (@id_clientes, @id_empleados, @id_productos, @cantidad)
	end;

	/*Modificar*/

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
	where id_clientes = @id_clientes
	end;

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
	where id_empleados = @id_empleados
	end;

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
	where id_productos = @id_productos
	end;

	create procedure modificar_venta
	@id_ventas int,
	@id_clientes int,
	@id_empleados int,
	@id_productos int,
	@cantidad int
	as
	begin
	update ventas
	set id_clientes = @id_clientes,
	id_empleados = @id_empleados,
	id_productos = @id_productos,
	cantidad = @cantidad
	where id_ventas = @id_ventas
	end;

	/*Eliminar*/
	create procedure eliminar_cliente
	@id_clientes int
	as
	begin
	delete from clientes where id_clientes = @id_clientes
	end;

	create procedure eliminar_empleado
	@id_empleados int
	as
	begin
	delete from empleados where id_empleados = @id_empleados
	end;

	create procedure eliminar_producto
	@id_productos int
	as
	begin
	delete from productos where id_productos = @id_productos
	end;

	/*-----------------------------------------
		Triggers
	------------------------------------------*/

