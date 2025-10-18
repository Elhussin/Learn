CREATE TABLE [InsuranceDiscount] (
    [MainGroupID] int NOT NULL,
    [InsuranceID] smallint NOT NULL,
    [Discount] decimal NULL,
    CONSTRAINT [PK_InsuranceDiscount] PRIMARY KEY ([InsuranceID], [MainGroupID])
);
