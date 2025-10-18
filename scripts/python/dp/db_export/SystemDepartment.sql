CREATE TABLE [SystemDepartment] (
    [SystemDepartmentID] tinyint NOT NULL,
    [Name] nvarchar(50) NOT NULL,
    [Admin] bit NULL,
    CONSTRAINT [PK_SystemDepartment] PRIMARY KEY ([SystemDepartmentID])
);
