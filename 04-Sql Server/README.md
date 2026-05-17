# 04 - SQL Server (Tienda)

<p align="center">
  Carpeta dedicada al diseño y desarrollo de una base de datos completa para una tienda, incluyendo tablas, relaciones, restricciones, procedimientos almacenados y triggers.
</p>

---

## Proyecto: Base de datos Tienda

Este proyecto representa una base de datos relacional funcional para la gestión de una tienda, incluyendo clientes, empleados, productos, ventas e historial de ventas.

---

## Estructura de la base de datos

### Tablas principales

| Tabla | Descripción |
|---|---|
| `clientes` | Información de los clientes |
| `empleados` | Información de los empleados |
| `productos` | Catálogo de productos |
| `ventas` | Registro de ventas realizadas |
| `historial_ventas` | Registro histórico de ventas detallado |

---

## Relaciones (Foreign Keys)

- `ventas.id_clientes → clientes.id_clientes`
- `ventas.id_empleados → empleados.id_empleados`
- `ventas.id_productos → productos.id_productos`
- `historial_ventas.id_venta → ventas.id_ventas`
- `historial_ventas.id_producto → productos.id_productos`

---

## Restricciones aplicadas

### Clientes
- Edad mínima: 18 años  
- Correo único  
- Cédula única  

### Empleados
- Edad mínima: 18 años  
- Correo único  
- Teléfono único  
- Cédula única  
- Valor por defecto en teléfono  

### Productos
- Precio ≥ 0  
- Stock ≥ 0  
- Descripción por defecto si no se especifica  

### Ventas
- Cantidad > 0  
- Fecha automática con `GETDATE()`  
- Validación de fecha no futura  

---

## Procedimientos almacenados

### Consultas
- `consultar_clientes`
- `consultar_empleados`
- `consultar_productos`
- `consultar_ventas`

---

### Inserción de datos
- `agregar_cliente`
- `agregar_empleado`
- `agregar_producto`
- `agregar_venta`

---

### Modificación de datos
- `modificar_cliente`
- `modificar_empleado`
- `modificar_producto`
- `modificar_venta`

---

### Eliminación de datos
- `eliminar_cliente`
- `eliminar_empleado`
- `eliminar_producto`

---

## Trigger

### `trg_historial_ventas`

Se utiliza para registrar automáticamente cada venta en la tabla `historial_ventas` después de una inserción en `ventas`.

 Automatiza el historial  
 Mantiene trazabilidad de ventas  
 Permite auditoría de datos  

---

## Conceptos aplicados

### SQL Server

- Diseño de bases de datos relacionales  
- Integridad referencial (PK y FK)  
- Restricciones (CHECK, UNIQUE, DEFAULT)  
- Automatización con triggers  
- Lógica con procedimientos almacenados  

---

## Objetivos del proyecto

- Diseñar una base de datos completa desde cero  
- Aplicar reglas de negocio reales  
- Implementar relaciones entre entidades  
- Automatizar procesos con triggers  
- Practicar SQL Server a nivel intermedio  

---

## Herramientas utilizadas

- SQL Server  
- SQL Server Management Studio (SSMS)  
- Visual Studio Code  
- Git & GitHub  

---

## Progreso

 Creación de tablas  
 Relaciones entre entidades  
 Restricciones (PK, FK, UNIQUE, CHECK)  
 Procedimientos almacenados CRUD  
 Trigger de historial de ventas  

---

<p align="center">
  Base de datos completa para práctica de backend con SQL Server
</p>