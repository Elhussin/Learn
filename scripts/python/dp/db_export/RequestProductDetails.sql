CREATE TABLE [RequestProductDetails] (
    [RequestProductDetailsID] int NOT NULL,
    [RequestProductID] int NULL,
    [ProductID] int NULL,
    [ExpiryDate] datetime NULL,
    [Quantity] int NULL,
    CONSTRAINT [PK_RequestProductDetails] PRIMARY KEY ([RequestProductDetailsID])
);
