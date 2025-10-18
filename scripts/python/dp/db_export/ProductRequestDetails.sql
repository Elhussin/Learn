CREATE TABLE [ProductRequestDetails] (
    [ProductRequestDetailsID] int NOT NULL,
    [ProductRequestID] int NULL,
    [ProductID] int NULL,
    [ExpiryDate] datetime NULL,
    [Quantity] int NULL,
    CONSTRAINT [PK_ProductRequestDetails] PRIMARY KEY ([ProductRequestDetailsID])
);
