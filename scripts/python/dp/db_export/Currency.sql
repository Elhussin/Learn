CREATE TABLE [Currency] (
    [CURRENCY_CODE] smallint NOT NULL,
    [NAME] varchar(50) NULL,
    [SYMBOL] varchar(4) NULL,
    [RATE] float NULL,
    [IsBaseCurrency] bit NOT NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUSerID] int NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] int NULL,
    CONSTRAINT [PK_Currency] PRIMARY KEY ([CURRENCY_CODE])
);
