CREATE TABLE [StoreProductTransferDetails] (
    [StoreProductTransferDetailsID] int NOT NULL,
    [StoreProductTransferID] int NOT NULL,
    [FromProductID] int NOT NULL,
    [FromExpiryDate] datetime NULL,
    [ToProductID] int NULL,
    [ToExpiryDate] datetime NULL,
    [Quantity] float NOT NULL,
    CONSTRAINT [PK_StoreProductTransferDetails] PRIMARY KEY ([StoreProductTransferDetailsID])
);
