SELECT        SUM(dbo.v_ItemCardtaha.Incoming - dbo.v_ItemCardtaha.Outgoing) AS Expr1, dbo.v_ItemCardtaha.Description, dbo.v_ItemCardtaha.Code, dbo.Product.RetailPrice, dbo.Product.CostPrice
FROM            dbo.v_ItemCardtaha INNER JOIN
                         dbo.Product ON dbo.v_ItemCardtaha.Code = dbo.Product.Code
WHERE        (dbo.v_ItemCardtaha.DepName = N'Jeddah Store') AND (dbo.v_ItemCardtaha.MainGroupID = 38 OR
                         dbo.v_ItemCardtaha.MainGroupID = 58)
GROUP BY dbo.v_ItemCardtaha.Description, dbo.v_ItemCardtaha.Code, dbo.Product.RetailPrice, dbo.Product.CostPrice
HAVING        (SUM(dbo.v_ItemCardtaha.Incoming - dbo.v_ItemCardtaha.Outgoing) <> 0)