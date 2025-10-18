CREATE TABLE [ExchangedProducts] (
    [TransactionID] int NOT NULL,
    [OrderID] int NULL,
    [OrderType] bit NULL,
    [DeptID] int NULL,
    [EmployeeID] int NULL,
    [ExchangeDate] datetime NULL,
    [Trans_Year] int NULL,
    [Serial] int NULL,
    [Canceled] bit NULL,
    [Posted] int NULL,
    [FreeSerial] nvarchar(20) NULL,
    CONSTRAINT [PK_ExchangedProducts] PRIMARY KEY ([TransactionID])
);
