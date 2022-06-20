SELECT
    --Sales and promo summary from Internet Sales
    fs.SalesOrderNumber AS InvoiceNumber,
    fs.SalesOrderLineNumber AS InvoiceLineNumber,
    fs.OrderDate AS OrderDate,
    fs.SalesAmount AS SalesAmount,
    fs.TaxAmt AS TaxAmount,
    fs.Freight AS FreightAmount,
    fs.OrderQuantity AS Quantity,

    dp.EnglishProductName AS ProductName,
    
    dpsc.EnglishProductSubcategoryName AS ProductSubCategory,

    dpc.EnglishProductCategoryName AS ProductCategory,

    dst.SalesTerritoryCountry AS Country,
    dst.SalesTerritoryRegion AS REgion,

    dpr.EnglishPromotionName AS PromotionName,
    dpr.EnglishPromotionType AS PromotionType,
    dpr.EnglishPromotionCategory AS PromotionCategory,

    dcy.Currencyname AS Currency,

    'Web' AS Source

FROM FactInternetSales AS fs
    INNER JOIN DimProduct AS dp 
    ON fs.ProductKey=dp.ProductKey
    INNER JOIN DimProductSubcategory AS dpsc 
    ON dp.ProductSubcategoryKey=dpsc.ProductSubcategoryKey
    INNER JOIN DimProductCategory AS dpc 
    ON dpsc.ProductCategoryKey=dpc.ProductCategoryKey
    INNER JOIN DimSalesTerritory AS dst 
    ON fs.SalesTerritoryKey=dst.SalesTerritoryKey
    INNER JOIN DimPromotion AS dpr 
    ON fs.PromotionKey=dpr.PromotionKey
    INNER JOIN DimCurrency AS dcy 
    ON fs.CurrencyKey=dcy.CurrencyKey

WHERE Year(OrderDate) IN (2021,2013)



UNION


SELECT
    --Sales and promo summary from Reseller sales
    fs.SalesOrderNumber AS InvoiceNumber,
    fs.SalesOrderLineNumber AS InvoiceLineNumber,
    fs.OrderDate AS OrderDate,
    fs.SalesAmount AS SalesAmount,
    fs.TaxAmt AS TaxAmount,
    fs.Freight AS FreightAmount,
    fs.OrderQuantity AS Quantity,

    dp.EnglishProductName AS ProductName,
    
    dpsc.EnglishProductSubcategoryName AS ProductSubCategory,

    dpc.EnglishProductCategoryName AS ProductCategory,

    dst.SalesTerritoryCountry AS Country,
    dst.SalesTerritoryRegion AS REgion,

    dpr.EnglishPromotionName AS PromotionName,
    dpr.EnglishPromotionType AS PromotionType,
    dpr.EnglishPromotionCategory AS PromotionCategory,

    dcy.Currencyname AS Currency,

    'Web' AS Source

FROM FactResellerSales AS fs
    INNER JOIN DimProduct AS dp 
    ON fs.ProductKey=dp.ProductKey
    INNER JOIN DimProductSubcategory AS dpsc 
    ON dp.ProductSubcategoryKey=dpsc.ProductSubcategoryKey
    INNER JOIN DimProductCategory AS dpc 
    ON dpsc.ProductCategoryKey=dpc.ProductCategoryKey
    INNER JOIN DimSalesTerritory AS dst 
    ON fs.SalesTerritoryKey=dst.SalesTerritoryKey
    INNER JOIN DimPromotion AS dpr 
    ON fs.PromotionKey=dpr.PromotionKey
    INNER JOIN DimCurrency AS dcy 
    ON fs.CurrencyKey=dcy.CurrencyKey
    INNER JOIN DimReseller AS dr 
    ON fs.ResellerKey = dr.ResellerKey

WHERE Year(OrderDate) IN (2021,2013)


ORDER BY OrderDate DESC