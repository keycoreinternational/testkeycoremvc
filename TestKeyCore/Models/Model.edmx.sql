
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 07/06/2018 04:18:21
-- Generated from EDMX file: C:\Users\jperez\source\repos\TestKeyCore\TestKeyCore\Models\Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [TestKeyCore];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Vendedores'
CREATE TABLE [dbo].[Vendedores] (
    [IdVendedor] int IDENTITY(1,1) NOT NULL,
    [Tx_Nombre] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Productos'
CREATE TABLE [dbo].[Productos] (
    [IdProducto] int IDENTITY(1,1) NOT NULL,
    [Tx_Descripcion] nvarchar(max)  NOT NULL,
    [Nu_Precio] decimal(20,2)  NOT NULL
);
GO

-- Creating table 'Ventas'
CREATE TABLE [dbo].[Ventas] (
    [IdVenta] int IDENTITY(1,1) NOT NULL,
    [VendedoresIdVendedor] int  NOT NULL,
    [ProductosIdProducto] int  NOT NULL,
    [Dt_FechaVenta] datetime  NOT NULL,
    [Nu_Cantidad] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [IdVendedor] in table 'Vendedores'
ALTER TABLE [dbo].[Vendedores]
ADD CONSTRAINT [PK_Vendedores]
    PRIMARY KEY CLUSTERED ([IdVendedor] ASC);
GO

-- Creating primary key on [IdProducto] in table 'Productos'
ALTER TABLE [dbo].[Productos]
ADD CONSTRAINT [PK_Productos]
    PRIMARY KEY CLUSTERED ([IdProducto] ASC);
GO

-- Creating primary key on [IdVenta] in table 'Ventas'
ALTER TABLE [dbo].[Ventas]
ADD CONSTRAINT [PK_Ventas]
    PRIMARY KEY CLUSTERED ([IdVenta] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [VendedoresIdVendedor] in table 'Ventas'
ALTER TABLE [dbo].[Ventas]
ADD CONSTRAINT [FK_VendedoresVentas]
    FOREIGN KEY ([VendedoresIdVendedor])
    REFERENCES [dbo].[Vendedores]
        ([IdVendedor])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_VendedoresVentas'
CREATE INDEX [IX_FK_VendedoresVentas]
ON [dbo].[Ventas]
    ([VendedoresIdVendedor]);
GO

-- Creating foreign key on [ProductosIdProducto] in table 'Ventas'
ALTER TABLE [dbo].[Ventas]
ADD CONSTRAINT [FK_ProductosVentas]
    FOREIGN KEY ([ProductosIdProducto])
    REFERENCES [dbo].[Productos]
        ([IdProducto])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductosVentas'
CREATE INDEX [IX_FK_ProductosVentas]
ON [dbo].[Ventas]
    ([ProductosIdProducto]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------