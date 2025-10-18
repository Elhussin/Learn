CREATE TABLE [Employee] (
    [EmployeeID] smallint NOT NULL,
    [Name] nvarchar(50) NOT NULL,
    [UserName] nvarchar(50) NOT NULL,
    [Password] nvarchar(50) NOT NULL,
    [DepartmentID] tinyint NOT NULL,
    [GroupID] int NULL,
    [Email] varchar(50) NULL,
    [Status] tinyint NOT NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    [SystemDepartmentID] tinyint NULL,
    CONSTRAINT [PK_Employee] PRIMARY KEY ([EmployeeID])
);
