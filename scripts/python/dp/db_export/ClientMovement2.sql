CREATE TABLE [ClientMovement2] (
    [StoreID] int NOT NULL,
    [ClientID] int NOT NULL,
    [Type] smallint NOT NULL,
    [LocalSerial] varchar(100) NOT NULL,
    [MoveDate] smalldatetime NULL,
    [Amount] decimal NULL,
    [Balance] decimal NULL,
    [debit] decimal NULL,
    [credit] decimal NULL,
    [TransactionID] int NULL,
    [Comment] nvarchar(2000) NULL
);
