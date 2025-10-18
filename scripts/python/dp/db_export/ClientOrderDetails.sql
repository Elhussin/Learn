CREATE TABLE [ClientOrderDetails] (
    [ClientOrderDetailsID] int NOT NULL,
    [ClientOrderID] int NOT NULL,
    [ProductID] int NOT NULL,
    [ExpiryDate] datetime NULL,
    [Quantity] decimal NULL,
    [TotalRevokes] decimal NULL,
    [TotalExchange] decimal NULL,
    [Discount] decimal NULL,
    [NetPrice] decimal NULL,
    [UnitPrice] decimal NULL,
    [SPH] varchar(10) NULL,
    [CYL] varchar(10) NULL,
    [AXS] varchar(10) NULL,
    [ADD] varchar(10) NULL,
    [clientdiscount] decimal NULL,
    CONSTRAINT [PK_ClientOrderDetails] PRIMARY KEY ([ClientOrderDetailsID])
);
