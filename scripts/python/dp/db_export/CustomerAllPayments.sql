CREATE TABLE [CustomerAllPayments] (
    [GalleryID] smallint NOT NULL,
    [CustomerID] smallint NOT NULL,
    [Type] char(10) NOT NULL,
    [PaymentID] int NOT NULL,
    [LocalSerial] varchar(50) NULL,
    [Debit] decimal NULL,
    [Credit] decimal NULL,
    [DownPayment] decimal NULL,
    [Payment] decimal NULL,
    [RevokePayment] decimal NULL,
    [PayDate] smalldatetime NULL,
    [Comment] varchar(2000) NULL,
    CONSTRAINT [PK_CustomerAllPayments] PRIMARY KEY ([CustomerID], [GalleryID], [PaymentID], [Type])
);
