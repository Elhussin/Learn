CREATE TABLE [CustomerRevokePayment] (
    [RevokePaymentID] int NOT NULL,
    [GalleryID] smallint NULL,
    [CustomerID] int NOT NULL,
    [Trans_Year] int NULL,
    [Serial] int NULL,
    [RevokePaymentAmount] float NOT NULL,
    [EmployeeID] smallint NOT NULL,
    [RevokePaymentDate] smalldatetime NULL,
    [Comment] varchar(250) NULL,
    [Posted] bit NULL,
    [RelatedDownPayment] int NULL,
    [FreeSerial] nvarchar(20) NULL,
    CONSTRAINT [PK_CustomerRevokePayment] PRIMARY KEY ([RevokePaymentID])
);
