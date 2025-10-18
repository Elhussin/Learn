CREATE TABLE [InsurranceOrderDetails1] (
    [InsurranceOrderDetailsID] int NOT NULL,
    [CustomerOrderID] int NULL,
    [ItemID] int NULL,
    [Quantity] float NULL,
    [UnitPrice] float NULL,
    [Approvedprice] float NULL,
    [DiscountINS] float NULL,
    [Ded] float NULL,
    CONSTRAINT [PK_InsurranceOrderDetails1] PRIMARY KEY ([InsurranceOrderDetailsID])
);
