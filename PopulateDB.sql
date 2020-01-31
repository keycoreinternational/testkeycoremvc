USE TestKeyCore
GO

DECLARE 
	@i			INT		=  1,
	@iMax		INT		= 3000

INSERT INTO dbo.Productos( Tx_Descripcion, Nu_Precio ) VALUES(   N'NIKE', N'300' )
INSERT INTO dbo.Productos ( Tx_Descripcion, Nu_Precio ) VALUES(   N'ADIDAS', N'500' )
INSERT INTO dbo.Productos ( Tx_Descripcion, Nu_Precio ) VALUES(   N'TIMBERLAKE', N'240' )
INSERT INTO dbo.Productos ( Tx_Descripcion, Nu_Precio ) VALUES(   N'CONVERSE', N'180' )
INSERT INTO dbo.Productos ( Tx_Descripcion, Nu_Precio ) VALUES(   N'PUMA', N'190' )
INSERT INTO dbo.Productos ( Tx_Descripcion, Nu_Precio ) VALUES(   N'FLY', N'100' )
INSERT INTO dbo.Productos ( Tx_Descripcion, Nu_Precio ) VALUES(   N'REEBOK', N'150' )
INSERT INTO dbo.Productos ( Tx_Descripcion, Nu_Precio ) VALUES(   N'UNDER ARMOUR', N'220' )
INSERT INTO dbo.Productos ( Tx_Descripcion, Nu_Precio ) VALUES(   N'FILA', N'230' )
INSERT INTO dbo.Productos ( Tx_Descripcion, Nu_Precio ) VALUES(   N'NEW BALANCE', N'260' )

INSERT INTO dbo.Vendedores ( Tx_Nombre ) VALUES (N'PEDRO')
INSERT INTO dbo.Vendedores ( Tx_Nombre ) VALUES (N'FRANCISCO')
INSERT INTO dbo.Vendedores ( Tx_Nombre ) VALUES (N'MARIA')
INSERT INTO dbo.Vendedores ( Tx_Nombre ) VALUES (N'ROSA')
INSERT INTO dbo.Vendedores ( Tx_Nombre ) VALUES (N'DAVID')

WHILE @i < @iMax
	BEGIN
		
		INSERT INTO dbo.Ventas (
			ProductosIdProducto, 
			VendedoresIdVendedor, 
			Nu_Cantidad, 
			Dt_FechaVenta
		) VALUES (
			ROUND(((10 - 1 -1) * RAND() + 1),0),
			ROUND(((5 - 1 -1) * RAND() + 1),0),
			ROUND(((100 - 1 -1) * RAND() + 1),0),
			DATEADD(dd, ROUND(((1000 - 1 -1) * RAND() + 1), 0) * -1, GETDATE())
		)

		SET @i = @i + 1;
	END