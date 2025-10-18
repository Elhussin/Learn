CREATE TABLE [GalleryOpenBalance] (
    [intBalanceID] int NOT NULL,
    [intTransYear] int NULL,
    [intSerial] int NULL,
    [intGalleryID] int NULL,
    [intEmployeeID] int NULL,
    [dtCreateDate] datetime NULL,
    CONSTRAINT [PK_GalleryOpenBalance] PRIMARY KEY ([intBalanceID])
);
