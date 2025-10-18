CREATE TABLE [Category] (
    [CategoryID] smallint NOT NULL,
    [MaingroupID] int NULL,
    [Name] varchar(50) NOT NULL,
    [Value] varchar(50) NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    [AccountNo] nvarchar(50) NULL,
    CONSTRAINT [PK_Category] PRIMARY KEY ([CategoryID])
);
