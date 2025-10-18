CREATE TABLE [StoreOpenBalanceDetails] (
    [intBalanceDetailsID] int NOT NULL,
    [intBalanceID] int NULL,
    [intProductID] int NOT NULL,
    [dtExpiryDate] datetime NOT NULL,
    [decOpeningBalance] decimal NULL,
    [intQuantity] decimal NULL,
    CONSTRAINT [PK_StoreOpenBalanceDetails] PRIMARY KEY ([intBalanceDetailsID])
);
