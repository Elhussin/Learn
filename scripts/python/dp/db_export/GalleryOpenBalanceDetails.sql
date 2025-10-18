CREATE TABLE [GalleryOpenBalanceDetails] (
    [intBalanceDetailsID] int NOT NULL,
    [intBalanceID] int NOT NULL,
    [intProductID] int NOT NULL,
    [dtExpiryDate] datetime NOT NULL,
    [decOpeningBalance] decimal NULL,
    [intQuantity] decimal NULL,
    CONSTRAINT [PK_GalleryOpenBalanceDetails] PRIMARY KEY ([intBalanceDetailsID])
);
