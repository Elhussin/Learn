CREATE TABLE [GalleryAdjustment] (
    [GalleryAdjustmentID] int NOT NULL,
    [Trans_year] int NULL,
    [Serial] int NULL,
    [AdjustmentDate] smalldatetime NOT NULL,
    [EmployeeID] smallint NOT NULL,
    [GalleryID] smallint NOT NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    [Posted] bit NULL,
    [dtPostDate] datetime NULL,
    [sinPostUserID] smallint NULL,
    [Canceled] bit NULL,
    CONSTRAINT [PK_GalleryAdjustment] PRIMARY KEY ([GalleryAdjustmentID])
);
