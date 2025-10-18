CREATE TABLE [ClientProductMove] (
    [ClientProductMoveID] int NOT NULL,
    [MoveDate] smalldatetime NOT NULL,
    [ClientID] smallint NOT NULL,
    [ProductID] int NOT NULL,
    [ExpiryDate] datetime NULL,
    [TransactionTypeID] smallint NULL,
    [TransactionID] int NULL,
    [Quantity] float NOT NULL,
    [Move] varchar(5) NOT NULL,
    [Stock] float NOT NULL,
    [Freeze] float NOT NULL,
    [Pending] float NOT NULL,
    CONSTRAINT [PK_ClientProductMove] PRIMARY KEY ([ClientProductMoveID])
);
