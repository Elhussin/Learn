CREATE TABLE [TransferDetails] (
    [TransferDetailsID] int NOT NULL,
    [TransferID] int NOT NULL,
    [ProductID] int NOT NULL,
    [ExpiryDate] datetime NULL,
    [Quantity] decimal NOT NULL,
    [DeliveredQuantity] decimal NOT NULL,
    [UnitPrice] decimal NULL,
    [RetailPrice] decimal NULL,
    [WhalePrice] decimal NULL,
    [bolDeleted] bit NULL,
    CONSTRAINT [PK_TransferDetails] PRIMARY KEY ([TransferDetailsID])
);
