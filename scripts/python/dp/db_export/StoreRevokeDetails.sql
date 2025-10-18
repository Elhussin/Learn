CREATE TABLE [StoreRevokeDetails] (
    [StoreRevokeDetailsID] int NOT NULL,
    [StoreRevokeID] int NOT NULL,
    [ProductID] int NOT NULL,
    [ExpiryDate] datetime NULL,
    [Quantity] decimal NOT NULL,
    [DQuantity] decimal NULL,
    CONSTRAINT [PK_StoreRevokeDetails] PRIMARY KEY ([StoreRevokeDetailsID])
);
