CREATE TABLE [MainGroups] (
    [MainGroupsID] int NOT NULL,
    [Name] nvarchar(100) NULL,
    [Value] nvarchar(5) NULL,
    [TemplateID] int NULL,
    [Type] smallint NULL,
    [MainValue] nvarchar(200) NULL,
    CONSTRAINT [PK_MainGroups] PRIMARY KEY ([MainGroupsID])
);
