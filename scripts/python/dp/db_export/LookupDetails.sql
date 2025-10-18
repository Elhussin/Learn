CREATE TABLE [LookupDetails] (
    [ID] int NOT NULL,
    [MasterType] int NULL,
    [Code] nvarchar(20) NULL,
    [Value] nvarchar(20) NULL,
    CONSTRAINT [PK_LookupDetails] PRIMARY KEY ([ID])
);
