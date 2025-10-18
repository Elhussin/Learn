CREATE TABLE [CodeSettingDetail] (
    [ID] int NOT NULL,
    [CodeSettingMasterID] int NOT NULL,
    [SegmentType] smallint NULL,
    [FreeCodeType] smallint NULL,
    [FreeCodeLength] smallint NULL,
    [LookupID] int NULL,
    [FreeCodeName] varchar(50) NULL,
    CONSTRAINT [PK_CodeSettingDetail] PRIMARY KEY ([ID])
);
