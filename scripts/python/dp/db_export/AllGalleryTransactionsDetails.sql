CREATE TABLE [AllGalleryTransactionsDetails] (
    [TransactionDetailsID] int NOT NULL,
    [TransactionMasterID] int NULL,
    [ProductID] int NULL,
    [ExpiryDate] datetime NULL,
    [Incoming] decimal NULL,
    [Outgoing] decimal NULL,
    CONSTRAINT [PK_AllGalleryTransactionsDetails] PRIMARY KEY ([TransactionDetailsID])
);
