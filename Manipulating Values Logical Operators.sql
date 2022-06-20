SELECT 

EnglishProductName,
EnglishDescription,
Color,
[Status],
Class

FROM DimProduct

WHERE (Class <> 'H' OR CLass IS NULL) AND [Status] IS NOT NULL