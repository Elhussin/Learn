CREATE TABLE [SupplierInvoiceDetails] (
    [SupplierInvoiceDetailsID] int NOT NULL,
    [SupplierInvoiceID] int NOT NULL,
    [ProductID] int NOT NULL,
    [ExpiryDate] datetime NULL,
    [PurchaseOrderID] int NULL,
    [Quantity] decimal NOT NULL,
    [QuantitySold] smallint NULL,
    [PurchaseBasePrice] float NULL,
    [PurchasePrice] float NULL,
    [UnitBasePrice] float NULL,
    [UnitPrice] float NULL,
    [DiscountPercentage] int NULL,
    [NetBasePrice] float NULL,
    [NetPrice] float NULL,
    CONSTRAINT [PK_SupplierInvoiceDetails] PRIMARY KEY ([SupplierInvoiceDetailsID])
);
