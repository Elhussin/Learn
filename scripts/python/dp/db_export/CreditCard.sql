CREATE TABLE [CreditCard] (
    [CreditCardID] smallint NOT NULL,
    [Name] nvarchar(50) NOT NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    [Commissionrate] float NULL,
    CONSTRAINT [PK_CreditCard] PRIMARY KEY ([CreditCardID])
);
