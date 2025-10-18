CREATE TABLE [StoreProductTransfer] (
    [StoreProductTransferID] int NOT NULL,
    [EmployeeID] smallint NOT NULL,
    [StoreID] smallint NOT NULL,
    [Trans_Year] int NULL,
    [Serial] int NULL,
    [ProductTransferDate] smalldatetime NOT NULL,
    [FreeSerial] nvarchar(20) NULL,
    CONSTRAINT [PK_StoreProductTransfer] PRIMARY KEY ([StoreProductTransferID])
);
