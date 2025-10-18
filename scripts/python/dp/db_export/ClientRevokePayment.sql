CREATE TABLE [ClientRevokePayment] (
    [ClientRevokePaymentID] int NOT NULL,
    [ClientID] smallint NOT NULL,
    [StoreID] smallint NOT NULL,
    [SalesPersonID] smallint NULL,
    [Trans_Year] int NOT NULL,
    [Serial] int NOT NULL,
    [CurrencyID] int NOT NULL,
    [Rate] float NOT NULL,
    [Amount] float NOT NULL,
    [RevokePaymentDate] smalldatetime NOT NULL,
    [RevokePaymentType] tinyint NOT NULL,
    [Comment] nvarchar(200) NULL,
    CONSTRAINT [PK_ClientRevokePayment] PRIMARY KEY ([ClientRevokePaymentID])
);
