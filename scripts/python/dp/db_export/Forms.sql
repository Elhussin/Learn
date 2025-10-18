CREATE TABLE [Forms] (
    [DepartmentID] tinyint NOT NULL,
    [FormCode] nvarchar(50) NOT NULL,
    [Link] nvarchar(500) NULL,
    [FormName_E] nvarchar(200) NULL,
    [FormName_A] nvarchar(50) NULL,
    [Parent] nvarchar(50) NULL,
    [Node_No] int NULL,
    [Node_Leaf] bit NULL,
    [Included] bit NULL,
    [ASPPageName] nvarchar(200) NULL,
    [IsSideLink] smallint NULL,
    CONSTRAINT [PK_Forms] PRIMARY KEY ([FormCode])
);
