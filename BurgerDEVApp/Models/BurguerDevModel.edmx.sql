
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/26/2017 19:24:28
-- Generated from EDMX file: D:\VIsual Studio Repository\BurgerDEVApp\BurgerDEVApp\Models\BurguerDevModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [BurgerDevDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_PedidoCliente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Pedido] DROP CONSTRAINT [FK_PedidoCliente];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductoPedido_Producto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductoPedido] DROP CONSTRAINT [FK_ProductoPedido_Producto];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductoPedido_Pedido]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductoPedido] DROP CONSTRAINT [FK_ProductoPedido_Pedido];
GO
IF OBJECT_ID(N'[dbo].[FK_SucursalPedido]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Pedido] DROP CONSTRAINT [FK_SucursalPedido];
GO
IF OBJECT_ID(N'[dbo].[FK_PedidoZona]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Pedido] DROP CONSTRAINT [FK_PedidoZona];
GO
IF OBJECT_ID(N'[dbo].[FK_ZonaSucursal]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Sucursal] DROP CONSTRAINT [FK_ZonaSucursal];
GO
IF OBJECT_ID(N'[dbo].[FK_PedidoCola]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Cola] DROP CONSTRAINT [FK_PedidoCola];
GO
IF OBJECT_ID(N'[dbo].[FK_PedidoEmpleado]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Pedido] DROP CONSTRAINT [FK_PedidoEmpleado];
GO
IF OBJECT_ID(N'[dbo].[FK_EmpleadoRol]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Empleado] DROP CONSTRAINT [FK_EmpleadoRol];
GO
IF OBJECT_ID(N'[dbo].[FK_CoordenadaZona]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Coordenada] DROP CONSTRAINT [FK_CoordenadaZona];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Pedido]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Pedido];
GO
IF OBJECT_ID(N'[dbo].[Cliente]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cliente];
GO
IF OBJECT_ID(N'[dbo].[Producto]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Producto];
GO
IF OBJECT_ID(N'[dbo].[Sucursal]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Sucursal];
GO
IF OBJECT_ID(N'[dbo].[Zona]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Zona];
GO
IF OBJECT_ID(N'[dbo].[Coordenada]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Coordenada];
GO
IF OBJECT_ID(N'[dbo].[Cola]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cola];
GO
IF OBJECT_ID(N'[dbo].[Empleado]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Empleado];
GO
IF OBJECT_ID(N'[dbo].[Rol]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Rol];
GO
IF OBJECT_ID(N'[dbo].[ProductoPedido]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductoPedido];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Pedido'
CREATE TABLE [dbo].[Pedido] (
    [iPedidoId] int IDENTITY(1,1) NOT NULL,
    [dtPedido] datetime  NOT NULL,
    [sDescripcion] nvarchar(max)  NOT NULL,
    [sTiempoEntrega] nvarchar(max)  NOT NULL,
    [sDireccionEntrega] nvarchar(max)  NOT NULL,
    [sZona] nvarchar(max)  NOT NULL,
    [sCoordenadasX] nvarchar(max)  NOT NULL,
    [sCoordenadasY] nvarchar(max)  NOT NULL,
    [dPrecioTotal] decimal(18,0)  NOT NULL,
    [dDescuento] decimal(18,0)  NOT NULL,
    [dRecargos] decimal(18,0)  NOT NULL,
    [dPrecioNeto] decimal(18,0)  NOT NULL,
    [iClienteId] int  NOT NULL,
    [iSucursald] int  NOT NULL,
    [iZonaId] int  NOT NULL,
    [iEmpleadoId] int  NOT NULL
);
GO

-- Creating table 'Cliente'
CREATE TABLE [dbo].[Cliente] (
    [iClienteId] int IDENTITY(1,1) NOT NULL,
    [sNombre] nvarchar(max)  NOT NULL,
    [sApellido] nvarchar(max)  NOT NULL,
    [sDireccion] nvarchar(max)  NOT NULL,
    [sEmail] nvarchar(max)  NOT NULL,
    [sTelefono] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Producto'
CREATE TABLE [dbo].[Producto] (
    [iProductoId] int IDENTITY(1,1) NOT NULL,
    [sNombreProducto] nvarchar(max)  NOT NULL,
    [sDescripccion] nvarchar(max)  NOT NULL,
    [dPrecio] datetime  NOT NULL,
    [sTipo] nvarchar(max)  NOT NULL,
    [sUnidad] nvarchar(max)  NOT NULL,
    [sTiempoPreparacion] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Sucursal'
CREATE TABLE [dbo].[Sucursal] (
    [iSucursald] int IDENTITY(1,1) NOT NULL,
    [sNombre] nvarchar(max)  NOT NULL,
    [sDireccion] nvarchar(max)  NOT NULL,
    [sTelefono] nvarchar(max)  NOT NULL,
    [iZonaId] int  NOT NULL
);
GO

-- Creating table 'Zona'
CREATE TABLE [dbo].[Zona] (
    [iZonaId] int IDENTITY(1,1) NOT NULL,
    [sNombreZona] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Coordenada'
CREATE TABLE [dbo].[Coordenada] (
    [iCoordenadaId] int IDENTITY(1,1) NOT NULL,
    [sCoordenada_num] nvarchar(max)  NOT NULL,
    [iZonaId] int  NOT NULL
);
GO

-- Creating table 'Cola'
CREATE TABLE [dbo].[Cola] (
    [iColaId] int IDENTITY(1,1) NOT NULL,
    [sEstado] nvarchar(max)  NOT NULL,
    [sNumCola] nvarchar(max)  NOT NULL,
    [dtHoraSalida] datetime  NOT NULL,
    [dtHoraLlegada] datetime  NOT NULL,
    [sEstadoPagado] nvarchar(max)  NOT NULL,
    [iPedidoId] int  NOT NULL
);
GO

-- Creating table 'Empleado'
CREATE TABLE [dbo].[Empleado] (
    [iEmpleadoId] int IDENTITY(1,1) NOT NULL,
    [sNombre] nvarchar(max)  NOT NULL,
    [sApellido] nvarchar(max)  NOT NULL,
    [sTelefono] nvarchar(max)  NOT NULL,
    [sEmail] nvarchar(max)  NOT NULL,
    [iRolId] int  NOT NULL,
    [iUsuarioId] int  NOT NULL
);
GO

-- Creating table 'Rol'
CREATE TABLE [dbo].[Rol] (
    [iRolId] int IDENTITY(1,1) NOT NULL,
    [sNombreRol] nvarchar(max)  NOT NULL,
    [sTurno] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Usuario'
CREATE TABLE [dbo].[Usuario] (
    [iUsuarioId] int IDENTITY(1,1) NOT NULL,
    [sLogin] nvarchar(max)  NOT NULL,
    [sPassword] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ProductoPedido'
CREATE TABLE [dbo].[ProductoPedido] (
    [Producto_iProductoId] int  NOT NULL,
    [ProductoPedido_Producto_iPedidoId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [iPedidoId] in table 'Pedido'
ALTER TABLE [dbo].[Pedido]
ADD CONSTRAINT [PK_Pedido]
    PRIMARY KEY CLUSTERED ([iPedidoId] ASC);
GO

-- Creating primary key on [iClienteId] in table 'Cliente'
ALTER TABLE [dbo].[Cliente]
ADD CONSTRAINT [PK_Cliente]
    PRIMARY KEY CLUSTERED ([iClienteId] ASC);
GO

-- Creating primary key on [iProductoId] in table 'Producto'
ALTER TABLE [dbo].[Producto]
ADD CONSTRAINT [PK_Producto]
    PRIMARY KEY CLUSTERED ([iProductoId] ASC);
GO

-- Creating primary key on [iSucursald] in table 'Sucursal'
ALTER TABLE [dbo].[Sucursal]
ADD CONSTRAINT [PK_Sucursal]
    PRIMARY KEY CLUSTERED ([iSucursald] ASC);
GO

-- Creating primary key on [iZonaId] in table 'Zona'
ALTER TABLE [dbo].[Zona]
ADD CONSTRAINT [PK_Zona]
    PRIMARY KEY CLUSTERED ([iZonaId] ASC);
GO

-- Creating primary key on [iCoordenadaId] in table 'Coordenada'
ALTER TABLE [dbo].[Coordenada]
ADD CONSTRAINT [PK_Coordenada]
    PRIMARY KEY CLUSTERED ([iCoordenadaId] ASC);
GO

-- Creating primary key on [iColaId] in table 'Cola'
ALTER TABLE [dbo].[Cola]
ADD CONSTRAINT [PK_Cola]
    PRIMARY KEY CLUSTERED ([iColaId] ASC);
GO

-- Creating primary key on [iEmpleadoId] in table 'Empleado'
ALTER TABLE [dbo].[Empleado]
ADD CONSTRAINT [PK_Empleado]
    PRIMARY KEY CLUSTERED ([iEmpleadoId] ASC);
GO

-- Creating primary key on [iRolId] in table 'Rol'
ALTER TABLE [dbo].[Rol]
ADD CONSTRAINT [PK_Rol]
    PRIMARY KEY CLUSTERED ([iRolId] ASC);
GO

-- Creating primary key on [iUsuarioId] in table 'Usuario'
ALTER TABLE [dbo].[Usuario]
ADD CONSTRAINT [PK_Usuario]
    PRIMARY KEY CLUSTERED ([iUsuarioId] ASC);
GO

-- Creating primary key on [Producto_iProductoId], [ProductoPedido_Producto_iPedidoId] in table 'ProductoPedido'
ALTER TABLE [dbo].[ProductoPedido]
ADD CONSTRAINT [PK_ProductoPedido]
    PRIMARY KEY CLUSTERED ([Producto_iProductoId], [ProductoPedido_Producto_iPedidoId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [iClienteId] in table 'Pedido'
ALTER TABLE [dbo].[Pedido]
ADD CONSTRAINT [FK_PedidoCliente]
    FOREIGN KEY ([iClienteId])
    REFERENCES [dbo].[Cliente]
        ([iClienteId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PedidoCliente'
CREATE INDEX [IX_FK_PedidoCliente]
ON [dbo].[Pedido]
    ([iClienteId]);
GO

-- Creating foreign key on [Producto_iProductoId] in table 'ProductoPedido'
ALTER TABLE [dbo].[ProductoPedido]
ADD CONSTRAINT [FK_ProductoPedido_Producto]
    FOREIGN KEY ([Producto_iProductoId])
    REFERENCES [dbo].[Producto]
        ([iProductoId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ProductoPedido_Producto_iPedidoId] in table 'ProductoPedido'
ALTER TABLE [dbo].[ProductoPedido]
ADD CONSTRAINT [FK_ProductoPedido_Pedido]
    FOREIGN KEY ([ProductoPedido_Producto_iPedidoId])
    REFERENCES [dbo].[Pedido]
        ([iPedidoId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoPedido_Pedido'
CREATE INDEX [IX_FK_ProductoPedido_Pedido]
ON [dbo].[ProductoPedido]
    ([ProductoPedido_Producto_iPedidoId]);
GO

-- Creating foreign key on [iSucursald] in table 'Pedido'
ALTER TABLE [dbo].[Pedido]
ADD CONSTRAINT [FK_SucursalPedido]
    FOREIGN KEY ([iSucursald])
    REFERENCES [dbo].[Sucursal]
        ([iSucursald])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SucursalPedido'
CREATE INDEX [IX_FK_SucursalPedido]
ON [dbo].[Pedido]
    ([iSucursald]);
GO

-- Creating foreign key on [iZonaId] in table 'Pedido'
ALTER TABLE [dbo].[Pedido]
ADD CONSTRAINT [FK_PedidoZona]
    FOREIGN KEY ([iZonaId])
    REFERENCES [dbo].[Zona]
        ([iZonaId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PedidoZona'
CREATE INDEX [IX_FK_PedidoZona]
ON [dbo].[Pedido]
    ([iZonaId]);
GO

-- Creating foreign key on [iZonaId] in table 'Sucursal'
ALTER TABLE [dbo].[Sucursal]
ADD CONSTRAINT [FK_ZonaSucursal]
    FOREIGN KEY ([iZonaId])
    REFERENCES [dbo].[Zona]
        ([iZonaId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ZonaSucursal'
CREATE INDEX [IX_FK_ZonaSucursal]
ON [dbo].[Sucursal]
    ([iZonaId]);
GO

-- Creating foreign key on [iPedidoId] in table 'Cola'
ALTER TABLE [dbo].[Cola]
ADD CONSTRAINT [FK_PedidoCola]
    FOREIGN KEY ([iPedidoId])
    REFERENCES [dbo].[Pedido]
        ([iPedidoId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PedidoCola'
CREATE INDEX [IX_FK_PedidoCola]
ON [dbo].[Cola]
    ([iPedidoId]);
GO

-- Creating foreign key on [iEmpleadoId] in table 'Pedido'
ALTER TABLE [dbo].[Pedido]
ADD CONSTRAINT [FK_PedidoEmpleado]
    FOREIGN KEY ([iEmpleadoId])
    REFERENCES [dbo].[Empleado]
        ([iEmpleadoId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PedidoEmpleado'
CREATE INDEX [IX_FK_PedidoEmpleado]
ON [dbo].[Pedido]
    ([iEmpleadoId]);
GO

-- Creating foreign key on [iRolId] in table 'Empleado'
ALTER TABLE [dbo].[Empleado]
ADD CONSTRAINT [FK_EmpleadoRol]
    FOREIGN KEY ([iRolId])
    REFERENCES [dbo].[Rol]
        ([iRolId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmpleadoRol'
CREATE INDEX [IX_FK_EmpleadoRol]
ON [dbo].[Empleado]
    ([iRolId]);
GO

-- Creating foreign key on [iZonaId] in table 'Coordenada'
ALTER TABLE [dbo].[Coordenada]
ADD CONSTRAINT [FK_CoordenadaZona]
    FOREIGN KEY ([iZonaId])
    REFERENCES [dbo].[Zona]
        ([iZonaId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CoordenadaZona'
CREATE INDEX [IX_FK_CoordenadaZona]
ON [dbo].[Coordenada]
    ([iZonaId]);
GO

-- Creating foreign key on [iUsuarioId] in table 'Empleado'
ALTER TABLE [dbo].[Empleado]
ADD CONSTRAINT [FK_EmpleadoUsuario]
    FOREIGN KEY ([iUsuarioId])
    REFERENCES [dbo].[Usuario]
        ([iUsuarioId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmpleadoUsuario'
CREATE INDEX [IX_FK_EmpleadoUsuario]
ON [dbo].[Empleado]
    ([iUsuarioId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------