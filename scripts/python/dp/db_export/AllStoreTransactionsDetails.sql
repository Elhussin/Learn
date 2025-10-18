CREATE TABLE [AllStoreTransactionsDetails] (
    [TransactionDetailsID] int NOT NULL,
    [TransactionMasterID] int NULL,
    [ProductID] int NULL,
    [ExpiryDate] datetime NULL,
    [Incoming] decimal NULL,
    [Outgoing] decimal NULL,
    [Stock] decimal NULL,
    CONSTRAINT [PK_AllStoreTransactionsDetails] PRIMARY KEY ([TransactionDetailsID])
);
