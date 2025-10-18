CREATE TABLE [Region] (
    [RegionID] int NOT NULL,
    [RegionName] nvarchar(50) NULL,
    [ResponsibleName] nvarchar(50) NULL,
    [ResponsibleAddress] nvarchar(50) NULL,
    [ResponsibleMobile] nvarchar(50) NULL,
    [ResponsiblePhone] nvarchar(50) NULL,
    [ResponsibleEmail] nvarchar(50) NULL,
    CONSTRAINT [PK_Region] PRIMARY KEY ([RegionID])
);
