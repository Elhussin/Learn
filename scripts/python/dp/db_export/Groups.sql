CREATE TABLE [Groups] (
    [GroupID] int NOT NULL,
    [GroupName] nvarchar(50) NULL,
    [DepartmentID] tinyint NULL,
    CONSTRAINT [PK_Groups] PRIMARY KEY ([GroupID])
);
