CREATE TABLE [AgeGroup] (
    [AgeGroupID] smallint NOT NULL,
    [Name] nvarchar(50) NOT NULL,
    [Value] nvarchar(10) NOT NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    CONSTRAINT [PK_AgeGroup] PRIMARY KEY ([AgeGroupID])
);
