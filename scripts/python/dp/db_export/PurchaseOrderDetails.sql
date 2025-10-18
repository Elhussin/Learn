CREATE TABLE [PurchaseOrderDetails] (
    [PurchaseOrderDetailsID] int NOT NULL,
    [PurchaseOrderID] int NOT NULL,
    [ProductID] int NULL,
    [Quantity] decimal NOT NULL,
    [DeliveredQuantity] smallint NULL,
    [Description] nvarchar(50) NULL,
    [Status] smallint NULL,
    [Finished] int NULL,
    CONSTRAINT [PK_PurchaseOrderDetails] PRIMARY KEY ([PurchaseOrderDetailsID])
);
