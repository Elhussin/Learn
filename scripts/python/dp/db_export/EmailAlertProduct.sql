CREATE TABLE [EmailAlertProduct] (
    [EmailAlertID] int NOT NULL,
    [ProductID] int NOT NULL,
    [ExpiryDate] datetime NOT NULL,
    CONSTRAINT [PK_EmailAlertProduct] PRIMARY KEY ([EmailAlertID], [ExpiryDate], [ProductID])
);
