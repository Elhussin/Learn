CREATE TABLE [CustomerMovement] (
    [GalleryID] int NOT NULL,
    [CustomerID] int NOT NULL,
    [Type] smallint NOT NULL,
    [LocalSerial] varchar(12) NOT NULL,
    [MoveDate] smalldatetime NULL,
    [Amount] float NULL,
    [Balance] float NULL,
    [TransactionID] int NULL,
    [Debit] decimal NULL,
    [Credit] decimal NULL,
    [Comment] varchar(2000) NULL,
    CONSTRAINT [PK_CustomerMovement] PRIMARY KEY ([CustomerID], [GalleryID], [LocalSerial], [Type])
);
