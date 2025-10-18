CREATE TABLE [CustomerInvPayments] (
    [intCustomerID] int NOT NULL,
    [intPaymentID] int NOT NULL,
    [intInvoiceID] int NOT NULL,
    [intType] smallint NOT NULL,
    [decAmount] decimal NULL,
    [sdtPayDate] smalldatetime NULL,
    [tinFinished] tinyint NULL,
    CONSTRAINT [PK_CustomerInvPayments] PRIMARY KEY ([intCustomerID], [intInvoiceID], [intPaymentID], [intType])
);
