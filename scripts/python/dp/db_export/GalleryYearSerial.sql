CREATE TABLE [GalleryYearSerial] (
    [GalleryID] int NOT NULL,
    [Year] int NOT NULL,
    [CustomerOrderSerial] int NULL,
    [CustomerRevokeSerial] int NULL,
    [ExchangeProductsSerial] int NULL,
    [DownPaymentSerial] int NULL,
    [RevokePaymentSerial] int NULL,
    [TransferSerial] int NULL,
    [RequestProductSerial] int NULL,
    [OpeningBalanceSerial] int NULL,
    [PaymentSerial] int NULL,
    [AdjustmentSerial] int NULL,
    CONSTRAINT [PK_GalleryYearSerial] PRIMARY KEY ([GalleryID], [Year])
);
