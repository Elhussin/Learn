CREATE TABLE [GalleryEmployee] (
    [EmployeeID] smallint NOT NULL,
    [GalleryID] smallint NOT NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    CONSTRAINT [PK_GalleryEmployee] PRIMARY KEY ([EmployeeID], [GalleryID])
);
