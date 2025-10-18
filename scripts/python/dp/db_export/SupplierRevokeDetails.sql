CREATE TABLE [SupplierRevokeDetails] (
    [SupplierRevokeDetailsID] int NOT NULL,
    [SupplierRevokeID] int NOT NULL,
    [SupplierInvoiceDetailsID] int NULL,
    [ProductID] int NOT NULL,
    [ExpiryDate] datetime NOT NULL,
    [Quantity] decimal NOT NULL,
    [RevokeBaseAmount] decimal NULL,
    [RevokeAmount] decimal NULL,
    [UnitRevokeBasePrice] decimal NULL,
    [UnitPrice] decimal NULL,
    [QuantityDelivered] int NULL,
    CONSTRAINT [PK_SupplierRevokeDetails] PRIMARY KEY ([SupplierRevokeDetailsID])
);
