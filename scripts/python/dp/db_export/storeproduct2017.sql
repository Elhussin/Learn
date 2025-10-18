CREATE TABLE [storeproduct2017] (
    [StoreID] smallint NOT NULL,
    [ProductID] int NOT NULL,
    [ExpiryDate] datetime NOT NULL,
    [Quantity] decimal NOT NULL,
    [Freeze] decimal NOT NULL,
    [Pending] decimal NOT NULL,
    [StoreSaleDateFrom] smalldatetime NULL,
    [StoreSaleDateTo] smalldatetime NULL,
    [StoreDiscount] decimal NULL,
    [StoreSaleDiscount] decimal NULL,
    [RetailPrice] decimal NULL,
    [WhalePrice] decimal NULL,
    [CostPrice] decimal NULL,
    [EvaluationPrice] decimal NULL
);
