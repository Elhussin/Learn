CREATE TABLE [StoreAdjustmentDetails] (
    [StoreAdjustmentDetailsID] int NOT NULL,
    [StoreAdjustmentID] int NOT NULL,
    [ProductID] int NOT NULL,
    [ExpiryDate] datetime NULL,
    [Quantity] decimal NULL,
    [AdjustmentType] varchar(50) NULL,
    CONSTRAINT [PK_StoreAdjustmentDetails] PRIMARY KEY ([StoreAdjustmentDetailsID])
);
