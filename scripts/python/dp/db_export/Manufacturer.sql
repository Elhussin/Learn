CREATE TABLE [Manufacturer] (
    [ManufacturerID] smallint NOT NULL,
    [Name] varchar(50) NOT NULL,
    [Value] varchar(50) NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    CONSTRAINT [PK_Manufacturer] PRIMARY KEY ([ManufacturerID])
);
