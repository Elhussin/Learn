CREATE TABLE [ClientRequestDetails] (
    [ClientRequestDetailsID] int NOT NULL,
    [ClientRequestID] int NOT NULL,
    [ProductID] int NOT NULL,
    [Quantity] float NOT NULL,
    [DQuantity] float NULL,
    [Discount] float NULL,
    [NetPrice] float NULL,
    CONSTRAINT [PK_ClientRequestDetails] PRIMARY KEY ([ClientRequestDetailsID])
);
