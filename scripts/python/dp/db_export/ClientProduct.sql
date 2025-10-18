CREATE TABLE [ClientProduct] (
    [ClientID] smallint NOT NULL,
    [ProductID] int NOT NULL,
    [ExpiryDate] datetime NOT NULL,
    [Quantity] float NOT NULL,
    [Freeze] float NOT NULL,
    [Pending] float NOT NULL,
    CONSTRAINT [PK_ClientProduct] PRIMARY KEY ([ClientID], [ExpiryDate], [ProductID])
);
