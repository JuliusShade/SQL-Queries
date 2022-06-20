-- basic query as part of SQL Fundamentals course, including a OFFSET FETCH Filter.

select
SalesOrderNumber as [InvoiceNumber],
OrderDate,
SUM(SalesAmount) as [InvoiceSubTotal],
SUM(TaxAmt) as [TaxAmount],
SUM(OrderQuantity) as [TotalQuantity],
SUM(SalesAmount) + SUM(TaxAmt) as InvoiceTotal

from factinternetsales
where SalesTerritoryKey = 6

Group by SalesOrderNumber, OrderDate
having SUM(SalesAmount) > 1000

order by InvoiceSubTotal desc

OFFSET 2 ROWS FETCH NEXT 10 ROWS ONLY