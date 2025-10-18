CREATE TABLE [newtable] (
    [intPaymentID] int NOT NULL,
    [intTrans_Year] int NULL,
    [intSerial] int NULL,
    [intCustomerID] int NULL,
    [intEmployeeID] int NULL,
    [sinPaymentType] smallint NULL,
    [sinCreditCardID] smallint NULL,
    [vchCardNumber] varchar(50) NULL,
    [vchBatchNumber] varchar(50) NULL,
    [decPaymentAmount] decimal NULL,
    [sdtPaymentDate] smalldatetime NULL,
    [intCustomerOrderID] int NULL,
    [vchComment] nvarchar(200) NULL,
    [GalleryID] smallint NULL,
    [FreeSerial] nvarchar(20) NULL,
    [posted] int NULL
);
