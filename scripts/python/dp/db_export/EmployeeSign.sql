CREATE TABLE [EmployeeSign] (
    [IDserial] int NOT NULL,
    [EmployeeID] int NULL,
    [SignIN] datetime NULL,
    [SignOut] datetime NULL,
    [IPADDRESS] nvarchar(50) NULL,
    CONSTRAINT [PK_EmployeeSign] PRIMARY KEY ([IDserial])
);
