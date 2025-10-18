CREATE TABLE [ClientPayment] (
    [ClientPaymentID] int NOT NULL,
    [ClientID] smallint NOT NULL,
    [StoreID] smallint NOT NULL,
    [SalesPersonID] smallint NULL,
    [Trans_Year] int NOT NULL,
    [Serial] int NOT NULL,
    [CurrencyID] int NOT NULL,
    [Rate] decimal NOT NULL,
    [Amount] decimal NOT NULL,
    [TakenAmount] decimal NULL,
    [PaymentDate] smalldatetime NOT NULL,
    [PaymentType] tinyint NOT NULL,
    [Comment] nvarchar(200) NULL,
    [Finished] tinyint NULL,
    [Posted] bit NULL,
    CONSTRAINT [PK_ClientPayment] PRIMARY KEY ([ClientPaymentID])
);
