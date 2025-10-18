CREATE TABLE [AllStoreTransactionsMaster2] (
    [TransactionMasterID] int NOT NULL,
    [DepID] smallint NULL,
    [TransactionTypeID] smallint NULL,
    [TransactionID] int NULL,
    [SerialNo] nvarchar(20) NULL,
    [OrderDate] datetime NULL,
    [FinishDate] datetime NULL,
    [FromToPlaceID] smallint NULL,
    [FromToPlaceType] smallint NULL,
    [OrderToID] int NULL,
    [Move] varchar(5) NULL,
    [SendReceipt] smallint NULL,
    [ReceiveReceipt] smallint NULL,
    [TotalIncoming] decimal NULL,
    [TotalOutgoing] decimal NULL,
    [Status] smallint NULL
);
