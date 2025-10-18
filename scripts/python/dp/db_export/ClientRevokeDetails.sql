CREATE TABLE [ClientRevokeDetails] (
    [ClientRevokeDetailsID] int NOT NULL,
    [ClientRevokeID] int NOT NULL,
    [ClientOrderDetailsID] int NULL,
    [ProductID] int NOT NULL,
    [ExpiryDate] datetime NULL,
    [Quantity] float NOT NULL,
    [NetPrice] float NULL,
    CONSTRAINT [PK_ClientRevokeDetails] PRIMARY KEY ([ClientRevokeDetailsID])
);
