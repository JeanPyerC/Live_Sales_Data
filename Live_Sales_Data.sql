Select
	Coalesce(DimProduct."Status",'Clearance') as 'STATUS'
	,DimProduct.ProductKey
	,Dimproduct.ProductAlternateKey as 'PRODUCT'
	,Dimproduct.EnglishProductName as 'DESCRIPTION'
	,MAX(FactProductInventory.UnitsBalance) as 'INVENTORY'
	,DimProduct.DaysToManufacture as 'DAYS TO PRODUCE'
	,DimProduct.SafetyStockLevel as 'STOCK LEVEL'
	,DimProduct.ReorderPoint as 'REORDER LEVEL'
	--,Coalesce(SUM(FactInternetSales.OrderQuantity),'0') as 'QTY'
	--,Coalesce(MONTH(CONVERT(date,convert(varchar(10),FactInternetSales.ShipDateKey,120),101)),'') as 'SHIP MONTH'
	--,Coalesce(YEAR(CONVERT(date,convert(varchar(10),FactInternetSales.ShipDateKey,120),101)),'') as 'SHIP YEAR'
	,SUM(CASE WHEN Coalesce(MONTH(CONVERT(date,convert(varchar(10),FactInternetSales.ShipDateKey,120),101)), 0) = MONTH(DATEADD(MM, -1,GETDATE())) 
		and YEAR(CONVERT(date,convert(varchar(10),FactInternetSales.ShipDateKey,120),101)) = year(DATEADD(m, -1, GETDATE())) THEN FactInternetSales.OrderQuantity ELSE 0 END) AS 'PIROIR_MONTH'

	,SUM(CASE WHEN Coalesce(MONTH(CONVERT(date,convert(varchar(10),FactInternetSales.ShipDateKey,120),101)), 0) = MONTH(DATEADD(MM, -2,GETDATE())) 
		and YEAR(CONVERT(date,convert(varchar(10),FactInternetSales.ShipDateKey,120),101)) = year(DATEADD(m, -2, GETDATE())) THEN FactInternetSales.OrderQuantity ELSE 0 END) AS '2 MONTHS AGO'

	,SUM(CASE WHEN Coalesce(MONTH(CONVERT(date,convert(varchar(10),FactInternetSales.ShipDateKey,120),101)), 0) = MONTH(DATEADD(MM, -3,GETDATE())) 
		and YEAR(CONVERT(date,convert(varchar(10),FactInternetSales.ShipDateKey,120),101)) = year(DATEADD(m, -3, GETDATE())) THEN FactInternetSales.OrderQuantity ELSE 0 END) AS '3 MONTHS AGO'

	,SUM(CASE WHEN Coalesce(MONTH(CONVERT(date,convert(varchar(10),FactInternetSales.ShipDateKey,120),101)), 0) = MONTH(DATEADD(MM, -4,GETDATE())) 
		and YEAR(CONVERT(date,convert(varchar(10),FactInternetSales.ShipDateKey,120),101)) = year(DATEADD(m, -4, GETDATE())) THEN FactInternetSales.OrderQuantity ELSE 0 END) AS '4 MONTHS AGO'

	,SUM(CASE WHEN Coalesce(MONTH(CONVERT(date,convert(varchar(10),FactInternetSales.ShipDateKey,120),101)), 0) = MONTH(DATEADD(MM, -5,GETDATE())) 
		and YEAR(CONVERT(date,convert(varchar(10),FactInternetSales.ShipDateKey,120),101)) = year(DATEADD(m, -5, GETDATE())) THEN FactInternetSales.OrderQuantity ELSE 0 END) AS '5 MONTHS AGO'

	,SUM(CASE WHEN Coalesce(MONTH(CONVERT(date,convert(varchar(10),FactInternetSales.ShipDateKey,120),101)), 0) = MONTH(DATEADD(MM, -6,GETDATE())) 
		and YEAR(CONVERT(date,convert(varchar(10),FactInternetSales.ShipDateKey,120),101)) = year(DATEADD(m, -6, GETDATE())) THEN FactInternetSales.OrderQuantity ELSE 0 END) AS '6 MONTHS AGO'

	,SUM(CASE WHEN Coalesce(MONTH(CONVERT(date,convert(varchar(10),FactInternetSales.ShipDateKey,120),101)), 0) = MONTH(DATEADD(MM, -7,GETDATE())) 
		and YEAR(CONVERT(date,convert(varchar(10),FactInternetSales.ShipDateKey,120),101)) = year(DATEADD(m, -7, GETDATE())) THEN FactInternetSales.OrderQuantity ELSE 0 END) AS '7 MONTHS AGO'

	,SUM(CASE WHEN Coalesce(MONTH(CONVERT(date,convert(varchar(10),FactInternetSales.ShipDateKey,120),101)), 0) = MONTH(DATEADD(MM, -8,GETDATE())) 
		and YEAR(CONVERT(date,convert(varchar(10),FactInternetSales.ShipDateKey,120),101)) = year(DATEADD(m, -8, GETDATE())) THEN FactInternetSales.OrderQuantity ELSE 0 END) AS '8 MONTHS AGO'

	,SUM(CASE WHEN Coalesce(MONTH(CONVERT(date,convert(varchar(10),FactInternetSales.ShipDateKey,120),101)), 0) = MONTH(DATEADD(MM, -9,GETDATE())) 
		and YEAR(CONVERT(date,convert(varchar(10),FactInternetSales.ShipDateKey,120),101)) = year(DATEADD(m, -9, GETDATE())) THEN FactInternetSales.OrderQuantity ELSE 0 END) AS '9 MONTHS AGO'

	,SUM(CASE WHEN Coalesce(MONTH(CONVERT(date,convert(varchar(10),FactInternetSales.ShipDateKey,120),101)), 0) = MONTH(DATEADD(MM, -10,GETDATE())) 
		and YEAR(CONVERT(date,convert(varchar(10),FactInternetSales.ShipDateKey,120),101)) = year(DATEADD(m, -10, GETDATE())) THEN FactInternetSales.OrderQuantity ELSE 0 END) AS '10 MONTHS AGO'

	,SUM(CASE WHEN Coalesce(MONTH(CONVERT(date,convert(varchar(10),FactInternetSales.ShipDateKey,120),101)), 0) = MONTH(DATEADD(MM, -11,GETDATE())) 
		and YEAR(CONVERT(date,convert(varchar(10),FactInternetSales.ShipDateKey,120),101)) = year(DATEADD(m, -11, GETDATE())) THEN FactInternetSales.OrderQuantity ELSE 0 END) AS '11 MONTHS AGO'
	
	,SUM(CASE WHEN Coalesce(MONTH(CONVERT(date,convert(varchar(10),FactInternetSales.ShipDateKey,120),101)), 0) = MONTH(DATEADD(MM, -12,GETDATE())) 
		and YEAR(CONVERT(date,convert(varchar(10),FactInternetSales.ShipDateKey,120),101)) = year(DATEADD(m, -12, GETDATE())) THEN FactInternetSales.OrderQuantity ELSE 0 END) AS '12 MONTHS AGO'

FROM AdventureWorksDW2019.dbo.DimProduct
LEFT JOIN AdventureWorksDW2019.dbo.FactInternetSales on AdventureWorksDW2019.dbo.FactInternetSales.ProductKey = AdventureWorksDW2019.dbo.DimProduct.ProductKey
LEFT JOIN AdventureWorksDW2019.dbo.FactProductInventory on AdventureWorksDW2019.dbo.FactProductInventory.ProductKey = AdventureWorksDW2019.dbo.DimProduct.ProductKey

WHERE FactProductInventory.DateKey = ( select MAX(FactProductInventory.DateKey) from AdventureWorksDW2019.dbo.FactProductInventory)

GROUP BY
	 DimProduct."Status"
	 ,DimProduct.ProductKey
	,Dimproduct.ProductAlternateKey
	,Dimproduct.EnglishProductName
	,DimProduct.DaysToManufacture
	,DimProduct.SafetyStockLevel
	,DimProduct.ReorderPoint
	,FactInternetSales.OrderQuantity
	,FactProductInventory.UnitsBalance
	--,MONTH(CONVERT(date,convert(varchar(10),FactInternetSales.ShipDateKey,120),101))
	--,YEAR(CONVERT(date,convert(varchar(10),FactInternetSales.ShipDateKey,120),101)) 
      --,'Prior_Month'
