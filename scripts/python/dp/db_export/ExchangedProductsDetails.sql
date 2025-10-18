CREATE TABLE [ExchangedProductsDetails] (
    [DetailsID] int NOT NULL,
    [ExchangedProductsID] int NULL,
    [ProductID] int NULL,
    [Quantity] decimal NULL,
    [ExpiryDate] datetime NULL,
    [UnitPrice] decimal NULL,
    [TotalPrice] decimal NULL,
    CONSTRAINT [PK_ExchangedProductsDetails] PRIMARY KEY ([DetailsID])
);
