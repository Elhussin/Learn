CREATE TABLE [CategoryAccount] (
    [CategoryID] int NOT NULL,
    [StoreID] int NOT NULL,
    [PurchaseAccountNo] nvarchar(50) NULL,
    [PurchaseReturnsNo] nvarchar(50) NULL,
    [salesAccountNo] nvarchar(50) NULL,
    [salesReturnsNo] nvarchar(50) NULL,
    CONSTRAINT [PK_CategoryAccount] PRIMARY KEY ([CategoryID], [StoreID])
);
