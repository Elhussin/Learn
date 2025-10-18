CREATE TABLE [Store] (
    [StoreID] smallint NOT NULL,
    [Name] varchar(50) NOT NULL,
    [StoreMasterID] smallint NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUSerID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    [SystemDepartmentID] tinyint NULL,
    [StoreType] bit NULL,
    [Address] nvarchar(100) NULL,
    [Phone] nvarchar(20) NULL,
    [CashAccountNo] nvarchar(50) NULL,
    [SalesAccountNo] nvarchar(50) NULL,
    [SalesReturnsNo] nvarchar(50) NULL,
    CONSTRAINT [PK_Store] PRIMARY KEY ([StoreID])
);
