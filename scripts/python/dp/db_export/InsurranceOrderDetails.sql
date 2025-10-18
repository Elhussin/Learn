CREATE TABLE [InsurranceOrderDetails] (
    [InsurranceOrderDetailsID] int NOT NULL,
    [CustomerOrderID] int NULL,
    [ItemID] int NULL,
    [Quantity] float NULL,
    [UnitPrice] float NULL,
    [Approvedprice] float NULL,
    [DiscountINS] float NULL,
    CONSTRAINT [PK_InsurranceOrderDetails] PRIMARY KEY ([InsurranceOrderDetailsID])
);
