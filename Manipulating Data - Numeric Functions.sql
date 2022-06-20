-- basic query as part of SQL Fundamentals course, including a FLOOR and ROUND Formula

select TOP(10) percent
SalesOrderNumber as [InvoiceNumber],
OrderDate,
SUM(SalesAmount) as [InvoiceSubTotal],
ROUND(SUM(SalesAmount),1) as [InvoiceSubTotalRounded],
SUM(TaxAmt) as [TaxAmount],
FLOOR(SUM(TaxAmt)) as [TaxAmountFloor],
SUM(OrderQuantity) as [TotalQuantity],
SUM(SalesAmount) + SUM(TaxAmt) as InvoiceTotal

from factinternetsales
where SalesTerritoryKey = 6

Group by SalesOrderNumber, OrderDate
having SUM(SalesAmount) > 1000

order by InvoiceSubTotal desc