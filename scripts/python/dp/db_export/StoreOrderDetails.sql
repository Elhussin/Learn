CREATE TABLE [StoreOrderDetails] (
    [StoreOrderDetailsID] int NOT NULL,
    [StoreOrderID] int NOT NULL,
    [ProductID] int NOT NULL,
    [ExpiryDate] datetime NULL,
    [Quantity] smallint NOT NULL,
    [PurchasePrice] float NULL,
    [PurchaseOrderID] int NULL,
    CONSTRAINT [PK_StoreOrderDetails] PRIMARY KEY ([StoreOrderDetailsID])
);
