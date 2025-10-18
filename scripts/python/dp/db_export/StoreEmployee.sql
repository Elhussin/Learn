CREATE TABLE [StoreEmployee] (
    [StoreID] smallint NOT NULL,
    [EmployeeID] smallint NOT NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    CONSTRAINT [PK_StoreEmployee] PRIMARY KEY ([EmployeeID], [StoreID])
);
