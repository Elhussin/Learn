CREATE TABLE [TransactionTypes] (
    [TransactionTypeID] smallint NOT NULL,
    [TransactionType] varchar(30) NOT NULL,
    [TransactionName] varchar(30) NOT NULL,
    [TransactionPage] varchar(50) NULL,
    CONSTRAINT [PK_TransactionTypes] PRIMARY KEY ([TransactionTypeID])
);
