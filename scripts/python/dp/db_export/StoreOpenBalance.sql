CREATE TABLE [StoreOpenBalance] (
    [intBalanceID] int NOT NULL,
    [intSerial] int NULL,
    [intTransYear] int NULL,
    [intStoreID] int NULL,
    [intEmployeeID] int NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    [Posted] bit NULL,
    [dtPostDate] datetime NULL,
    [sinPostUserID] smallint NULL,
    [Canceled] bit NULL,
    CONSTRAINT [PK_StoreOpenBalance] PRIMARY KEY ([intBalanceID])
);
