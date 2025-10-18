CREATE TABLE [StoreAdjustment] (
    [StoreAdjustmentID] int NOT NULL,
    [EmployeeID] smallint NOT NULL,
    [StoreID] smallint NOT NULL,
    [Trans_Year] int NULL,
    [Serial] int NULL,
    [AdjustmentDate] smalldatetime NOT NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    [Posted] bit NULL,
    [dtPostDate] datetime NULL,
    [sinPostUserID] smallint NULL,
    [Canceled] bit NULL,
    CONSTRAINT [PK_StoreAdjustment] PRIMARY KEY ([StoreAdjustmentID])
);
