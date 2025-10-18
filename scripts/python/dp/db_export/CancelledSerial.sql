CREATE TABLE [CancelledSerial] (
    [CancelSerialID] int NOT NULL,
    [TransactionType] int NULL,
    [Type] bit NULL,
    [ID] smallint NULL,
    [Year] smallint NULL,
    [Serial] int NULL,
    CONSTRAINT [PK_CancelledSerial] PRIMARY KEY ([CancelSerialID])
);
