CREATE TABLE [CodeSettingMaster] (
    [TemplateID] int NOT NULL,
    [TemplateName] nvarchar(50) NULL,
    [SegmentCount] smallint NULL,
    [FreeCodeName] nvarchar(50) NULL,
    CONSTRAINT [PK_CodeSettingMaster] PRIMARY KEY ([TemplateID])
);
