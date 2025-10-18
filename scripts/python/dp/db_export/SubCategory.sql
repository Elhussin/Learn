CREATE TABLE [SubCategory] (
    [SubCategoryID] smallint NOT NULL,
    [Name] varchar(150) NOT NULL,
    [Value] varchar(50) NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    [CategoryID] smallint NULL,
    CONSTRAINT [PK_SubCategory] PRIMARY KEY ([SubCategoryID])
);
