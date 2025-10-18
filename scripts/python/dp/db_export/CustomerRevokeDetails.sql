CREATE TABLE [CustomerRevokeDetails] (
    [CustomerRevokeDetailsID] int NOT NULL,
    [CustomerRevokeID] int NOT NULL,
    [CustomerOrderDetailsID] int NOT NULL,
    [ProductID] int NULL,
    [ExpiryDate] datetime NULL,
    [Quantity] decimal NOT NULL,
    [NetPrice] decimal NULL,
    CONSTRAINT [PK_CustomerRevokeDetails] PRIMARY KEY ([CustomerRevokeDetailsID])
);
