CREATE TABLE [SupplierAccount] (
    [SupplierID] int NOT NULL,
    [StoreID] int NOT NULL,
    [AccountNo] nvarchar(50) NULL,
    CONSTRAINT [PK_SupplierAccount] PRIMARY KEY ([StoreID], [SupplierID])
);
