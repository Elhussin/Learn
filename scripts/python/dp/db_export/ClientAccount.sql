CREATE TABLE [ClientAccount] (
    [ClientID] int NOT NULL,
    [StoreID] int NOT NULL,
    [AccountNo] nvarchar(50) NULL,
    CONSTRAINT [PK_ClientAccount] PRIMARY KEY ([ClientID], [StoreID])
);
