CREATE TABLE [LookupMaster] (
    [ID] int NOT NULL,
    [Description] nvarchar(50) NULL,
    [Width] smallint NULL,
    [Type] bit NULL,
    CONSTRAINT [PK_LookupMaster] PRIMARY KEY ([ID])
);
