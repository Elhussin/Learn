CREATE TABLE [InsuranceItemCodes] (
    [ItemID] int NOT NULL,
    [ItemCode] nvarchar(20) NULL,
    [ItemDescription] nvarchar(100) NULL,
    [ItemPrice] float NULL,
    [InsuranceCompanyId] smallint NULL,
    [MainGroupsID] int NULL,
    CONSTRAINT [PK_InsuranceItemCodes] PRIMARY KEY ([ItemID])
);
