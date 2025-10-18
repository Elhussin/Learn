CREATE TABLE [SpecialOffers] (
    [OfferID] smallint NOT NULL,
    [Description] nvarchar(100) NULL,
    [Type] bit NULL,
    [EmployeeID] smallint NULL,
    [Active] bit NULL,
    [SystemDepartmentID] tinyint NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    CONSTRAINT [PK_SpecialOffers] PRIMARY KEY ([OfferID])
);
