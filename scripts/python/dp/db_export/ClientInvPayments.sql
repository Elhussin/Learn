CREATE TABLE [ClientInvPayments] (
    [StoreID] smallint NOT NULL,
    [ClientID] smallint NOT NULL,
    [PaymentID] int NOT NULL,
    [OrderID] int NOT NULL,
    [Amount] decimal NULL,
    [LinkDate] smalldatetime NULL,
    CONSTRAINT [PK_ClientInvPayments] PRIMARY KEY ([ClientID], [OrderID], [PaymentID], [StoreID])
);
