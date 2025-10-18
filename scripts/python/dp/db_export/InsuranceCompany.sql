CREATE TABLE [InsuranceCompany] (
    [InsuranceCompanyID] smallint NOT NULL,
    [InsuranceCompanyCode] nvarchar(50) NULL,
    [Name] nvarchar(50) NULL,
    [address] nvarchar(50) NULL,
    [DiscountPercentage] decimal NULL,
    [Phone] nvarchar(50) NULL,
    [Fax] nvarchar(50) NULL,
    [ResponsiblePerson] nvarchar(50) NULL,
    [Active] tinyint NULL,
    [Deductible] tinyint NULL,
    [CanEdit] tinyint NULL,
    [DiscountForInsurance] int NULL,
    [DeductibleCal] tinyint NULL,
    CONSTRAINT [PK_InsuranceCompany] PRIMARY KEY ([InsuranceCompanyID])
);
