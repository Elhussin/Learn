CREATE TABLE [SpoiledProductsDetails] (
    [TransactionMasterID] int NULL,
    [DetailsID] int NOT NULL,
    [ProductID] int NULL,
    [Quantity] decimal NULL,
    [WhalePrice] decimal NULL,
    [ExpiryDate] datetime NULL,
    CONSTRAINT [PK_SpoiledProductsDetails] PRIMARY KEY ([DetailsID])
);
