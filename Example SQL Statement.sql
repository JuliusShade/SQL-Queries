SELECT customerkey as customerid, SUM(SalesAmount) as Salesamount
From FactInternetSales
WHERE year(orderdate) > 2010
Group BY customerkey
Having SUM(SalesAmount) > 10000
Order by SalesAmount DESC