CREATE TABLE [CLientDiscount] (
    [MainGroupID] int NOT NULL,
    [ClientID] smallint NOT NULL,
    [Discount] decimal NULL,
    CONSTRAINT [PK_CLientDiscount] PRIMARY KEY ([ClientID], [MainGroupID])
);
