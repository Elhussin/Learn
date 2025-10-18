-- ============================================
-- سكربت توليد قاعدة البيانات بالكامل (جداول + مفاتيح + علاقات)
-- ============================================

-- إنشاء الجداول والمفاتيح الأساسية
-- --------------------------------------------

CREATE TABLE [ClientOrder] (
    [ClientOrderID] int NOT NULL,
    [RequestNo] varchar(12) NULL,
    [ClientID] smallint NOT NULL,
    [StoreID] smallint NOT NULL,
    [SalesPersonID] smallint NULL,
    [Trans_Year] int NULL,
    [Serial] int NULL,
    [NoteSerial] nvarchar(20) NULL,
    [CurrencyID] int NULL,
    [Rate] decimal NULL,
    [TotalPrice] decimal NULL,
    [DiscountAmount] decimal NULL,
    [TotalDiscount] decimal NULL,
    [TaxPercentage] decimal NULL,
    [TaxAmount] decimal NULL,
    [NetPrice] decimal NULL,
    [PayedAmount] decimal NULL,
    [OrderDate] smalldatetime NOT NULL,
    [DeliveryDate] smalldatetime NULL,
    [FinishDate] smalldatetime NOT NULL,
    [Paid] tinyint NULL,
    [Status] tinyint NOT NULL,
    [HasInvoice] smallint NULL,
    [Comment] nvarchar(200) NULL,
    [SpecialOffers] bit NULL,
    [SpecialOfferID] int NULL,
    [SpecialOfferNo] int NULL,
    [PaymentType] int NULL,
    [Posted] bit NULL,
    [Canceled] bit NULL,
    [TotalSaleDiscount] decimal NULL,
    [EmployeeID] smallint NULL,
    CONSTRAINT [PK_ClientOrder] PRIMARY KEY ([ClientOrderID])
);

CREATE TABLE [ClientMovement2] (
    [StoreID] int NOT NULL,
    [ClientID] int NOT NULL,
    [Type] smallint NOT NULL,
    [LocalSerial] varchar(100) NOT NULL,
    [MoveDate] smalldatetime NULL,
    [Amount] decimal NULL,
    [Balance] decimal NULL,
    [debit] decimal NULL,
    [credit] decimal NULL,
    [TransactionID] int NULL,
    [Comment] nvarchar(2000) NULL
);

CREATE TABLE [ClientOrderDetails] (
    [ClientOrderDetailsID] int NOT NULL,
    [ClientOrderID] int NOT NULL,
    [ProductID] int NOT NULL,
    [ExpiryDate] datetime NULL,
    [Quantity] decimal NULL,
    [TotalRevokes] decimal NULL,
    [TotalExchange] decimal NULL,
    [Discount] decimal NULL,
    [NetPrice] decimal NULL,
    [UnitPrice] decimal NULL,
    [SPH] varchar(10) NULL,
    [CYL] varchar(10) NULL,
    [AXS] varchar(10) NULL,
    [ADD] varchar(10) NULL,
    [clientdiscount] decimal NULL,
    CONSTRAINT [PK_ClientOrderDetails] PRIMARY KEY ([ClientOrderDetailsID])
);

CREATE TABLE [ClientPayment] (
    [ClientPaymentID] int NOT NULL,
    [ClientID] smallint NOT NULL,
    [StoreID] smallint NOT NULL,
    [SalesPersonID] smallint NULL,
    [Trans_Year] int NOT NULL,
    [Serial] int NOT NULL,
    [CurrencyID] int NOT NULL,
    [Rate] decimal NOT NULL,
    [Amount] decimal NOT NULL,
    [TakenAmount] decimal NULL,
    [PaymentDate] smalldatetime NOT NULL,
    [PaymentType] tinyint NOT NULL,
    [Comment] nvarchar(200) NULL,
    [Finished] tinyint NULL,
    [Posted] bit NULL,
    CONSTRAINT [PK_ClientPayment] PRIMARY KEY ([ClientPaymentID])
);

CREATE TABLE [ClientMovement] (
    [StoreID] int NOT NULL,
    [ClientID] int NOT NULL,
    [Type] smallint NOT NULL,
    [LocalSerial] varchar(100) NOT NULL,
    [MoveDate] smalldatetime NULL,
    [Amount] decimal NULL,
    [Balance] decimal NULL,
    [debit] decimal NULL,
    [credit] decimal NULL,
    [TransactionID] int NULL,
    [Comment] nvarchar(2000) NULL,
    [Trans_Year] int NOT NULL,
    CONSTRAINT [PK_ClientMovement] PRIMARY KEY ([ClientID], [LocalSerial], [StoreID], [Trans_Year], [Type])
);

CREATE TABLE [ClientProduct] (
    [ClientID] smallint NOT NULL,
    [ProductID] int NOT NULL,
    [ExpiryDate] datetime NOT NULL,
    [Quantity] float NOT NULL,
    [Freeze] float NOT NULL,
    [Pending] float NOT NULL,
    CONSTRAINT [PK_ClientProduct] PRIMARY KEY ([ClientID], [ExpiryDate], [ProductID])
);

CREATE TABLE [ClientProductMove] (
    [ClientProductMoveID] int NOT NULL,
    [MoveDate] smalldatetime NOT NULL,
    [ClientID] smallint NOT NULL,
    [ProductID] int NOT NULL,
    [ExpiryDate] datetime NULL,
    [TransactionTypeID] smallint NULL,
    [TransactionID] int NULL,
    [Quantity] float NOT NULL,
    [Move] varchar(5) NOT NULL,
    [Stock] float NOT NULL,
    [Freeze] float NOT NULL,
    [Pending] float NOT NULL,
    CONSTRAINT [PK_ClientProductMove] PRIMARY KEY ([ClientProductMoveID])
);

CREATE TABLE [ClientRequest] (
    [ClientRequestID] int NOT NULL,
    [ClientID] smallint NOT NULL,
    [StoreID] smallint NOT NULL,
    [SalesPersonID] smallint NULL,
    [Trans_Year] int NULL,
    [Serial] int NULL,
    [CurrencyID] int NULL,
    [Rate] float NULL,
    [TotalPrice] float NULL,
    [DiscountAmount] float NULL,
    [TotalDiscount] float NULL,
    [TaxPercentage] float NULL,
    [TaxAmount] float NULL,
    [NetPrice] float NULL,
    [OrderDate] smalldatetime NOT NULL,
    [DeliveryDate] smalldatetime NULL,
    [FinishDate] smalldatetime NOT NULL,
    [Status] tinyint NOT NULL,
    [Comment] varchar(200) NULL,
    CONSTRAINT [PK_ClientRequest] PRIMARY KEY ([ClientRequestID])
);

CREATE TABLE [product_copy] (
    [ProductID] int NOT NULL,
    [Code] nvarchar(50) NOT NULL,
    [MainGroupID] smallint NULL,
    [CategoryID] smallint NULL,
    [SubCategoryID] smallint NULL,
    [Description] nvarchar(200) NULL,
    [FreeCode] nvarchar(20) NULL,
    [Lookup1Value] smallint NULL,
    [Lookup2Value] smallint NULL,
    [Lookup3Value] smallint NULL,
    [Lookup4Value] smallint NULL,
    [Lookup5Value] smallint NULL,
    [Lookup6Value] smallint NULL,
    [Status] tinyint NOT NULL,
    [GenderID] smallint NULL,
    [SeasonID] smallint NULL,
    [ManufacturerID] smallint NULL,
    [NewCode] varchar(50) NOT NULL,
    [OriginalCode] varchar(50) NULL,
    [MaestroCode] nvarchar(50) NULL,
    [ShipmentNo] int NULL,
    [Field1] nvarchar(100) NULL,
    [Field2] nvarchar(100) NULL,
    [Field3] nvarchar(100) NULL,
    [Field4] nvarchar(100) NULL,
    [Image] varchar(50) NULL,
    [HasExpiryDate] bit NULL,
    [StoreLimit] smallint NULL,
    [GalleryLimit] smallint NULL,
    [RetailPrice] decimal NULL,
    [GallerySaleDateFrom] smalldatetime NULL,
    [GallerySaleDateTo] smalldatetime NULL,
    [GalleryDiscount] decimal NULL,
    [GallerySaleDiscount] decimal NULL,
    [WhalePrice] decimal NULL,
    [StoreSaleDateFrom] smalldatetime NULL,
    [StoreSaleDateTo] smalldatetime NULL,
    [StoreDiscount] decimal NULL,
    [StoreSaleDiscount] decimal NULL,
    [TotalCost] decimal NULL,
    [TotalQuantity] decimal NULL,
    [CostPrice] decimal NULL,
    [EvaluationPrice] decimal NULL,
    [StoreLowerLimit] int NULL,
    [GalleryLowerLimit] int NULL,
    [StoreUpperLimit] int NULL,
    [GalleryUpperLimit] int NULL,
    [ReOrderLimit] int NULL,
    [RecessLimit] int NULL,
    [IsPresent] bit NULL,
    [CreationDate] smalldatetime NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL
);

CREATE TABLE [StoreProduct2015] (
    [StoreID] smallint NOT NULL,
    [ProductID] int NOT NULL,
    [ExpiryDate] datetime NOT NULL,
    [Quantity] decimal NOT NULL,
    [Freeze] decimal NOT NULL,
    [Pending] decimal NOT NULL,
    [StoreSaleDateFrom] smalldatetime NULL,
    [StoreSaleDateTo] smalldatetime NULL,
    [StoreDiscount] decimal NULL,
    [StoreSaleDiscount] decimal NULL,
    [RetailPrice] decimal NULL,
    [WhalePrice] decimal NULL,
    [CostPrice] decimal NULL,
    [EvaluationPrice] decimal NULL
);

CREATE TABLE [ClientRequestDetails] (
    [ClientRequestDetailsID] int NOT NULL,
    [ClientRequestID] int NOT NULL,
    [ProductID] int NOT NULL,
    [Quantity] float NOT NULL,
    [DQuantity] float NULL,
    [Discount] float NULL,
    [NetPrice] float NULL,
    CONSTRAINT [PK_ClientRequestDetails] PRIMARY KEY ([ClientRequestDetailsID])
);

CREATE TABLE [ClientRevoke] (
    [ClientRevokeID] int NOT NULL,
    [ClientOrderID] int NULL,
    [RevokePaymentID] int NULL,
    [ClientID] smallint NOT NULL,
    [StoreID] smallint NOT NULL,
    [RevokeAmount] decimal NULL,
    [RevokeAmountBeforeDiscount] decimal NULL,
    [Discount] decimal NULL,
    [Trans_Year] int NULL,
    [Serial] int NULL,
    [RevokeDate] smalldatetime NOT NULL,
    [DeliveryDate] smalldatetime NULL,
    [EmployeeID] smallint NULL,
    [Status] tinyint NOT NULL,
    [Comment] nvarchar(200) NULL,
    [Canceled] bit NULL,
    [Posted] bit NULL,
    [FreeSerial] nvarchar(20) NULL,
    CONSTRAINT [PK_ClientRevoke] PRIMARY KEY ([ClientRevokeID])
);

CREATE TABLE [TahaIP] (
    [branch_id] int NULL,
    [branch_name] nvarchar(50) NULL,
    [branch_type] nvarchar(50) NULL,
    [premotime_id] int NULL,
    [CustomerIP] nvarchar(50) NULL
);

CREATE TABLE [B2] (
    [ID] float NULL,
    [systemcode] nvarchar(255) NULL,
    [systemname] nvarchar(255) NULL,
    [price] float NULL,
    [BupaCode] nvarchar(255) NULL,
    [BupaName] nvarchar(255) NULL,
    [Left] nvarchar(255) NULL,
    [Right] nvarchar(255) NULL
);

CREATE TABLE [ClientRevokeDetails] (
    [ClientRevokeDetailsID] int NOT NULL,
    [ClientRevokeID] int NOT NULL,
    [ClientOrderDetailsID] int NULL,
    [ProductID] int NOT NULL,
    [ExpiryDate] datetime NULL,
    [Quantity] float NOT NULL,
    [NetPrice] float NULL,
    CONSTRAINT [PK_ClientRevokeDetails] PRIMARY KEY ([ClientRevokeDetailsID])
);

CREATE TABLE [CustomerOrder] (
    [CustomerOrderID] int NOT NULL,
    [Trans_Year] int NULL,
    [Serial] int NULL,
    [GalleryID] smallint NULL,
    [EmployeeID] smallint NOT NULL,
    [PaymentType] nvarchar(12) NULL,
    [CreditCardID] smallint NULL,
    [NoteSerial] nvarchar(20) NULL,
    [ReceiptNo] int NOT NULL,
    [Paid] smallint NOT NULL,
    [Printed] tinyint NULL,
    [OrderDate] smalldatetime NOT NULL,
    [TotalPriceBeforeDiscount] decimal NULL,
    [TotalPrice] decimal NOT NULL,
    [CashAmount] decimal NOT NULL,
    [CouponAMount] decimal NULL,
    [CreditAmount] decimal NOT NULL,
    [DiscountAmount] decimal NOT NULL,
    [RevokeAmount] decimal NOT NULL,
    [TotalDiscount] decimal NOT NULL,
    [CardNumber] varchar(20) NULL,
    [PatchNumber] varchar(50) NULL,
    [Excluded] char(1) NULL,
    [CustomerID] int NULL,
    [InsuranceCompanyId] smallint NULL,
    [CreatedBy] smallint NULL,
    [CustomerOrderMasterID] varchar(25) NULL,
    [DownPaymentID] int NULL,
    [SpecialOffers] bit NULL,
    [SpecialOfferID] int NULL,
    [NoOfSpecialOffers] int NULL,
    [dtFinishDate] datetime NULL,
    [Comment] nvarchar(4000) NULL,
    [Posted] bit NULL,
    [Canceled] bit NULL,
    [InsuredNo] nvarchar(20) NULL,
    [InsuranceDiscount] decimal NULL,
    [Deductible] decimal NULL,
    [approveamount] decimal NULL,
    [TransNo] nvarchar(20) NULL,
    [insurranceCustomerName] nvarchar(200) NULL,
    [InsurranceCustomerMobile] nvarchar(50) NULL,
    [PolicyNo] nvarchar(50) NULL,
    [ApprovedNO] nvarchar(50) NULL,
    [ClaimDate] smalldatetime NULL,
    [OpTransfer] smallint NULL,
    [PolicyHolder] nvarchar(250) NULL,
    [subHolder] nvarchar(50) NULL,
    [IDeqama] nvarchar(50) NULL,
    CONSTRAINT [PK_CustomerOrder] PRIMARY KEY ([CustomerOrderID])
);

CREATE TABLE [ClientRevokePayment] (
    [ClientRevokePaymentID] int NOT NULL,
    [ClientID] smallint NOT NULL,
    [StoreID] smallint NOT NULL,
    [SalesPersonID] smallint NULL,
    [Trans_Year] int NOT NULL,
    [Serial] int NOT NULL,
    [CurrencyID] int NOT NULL,
    [Rate] float NOT NULL,
    [Amount] float NOT NULL,
    [RevokePaymentDate] smalldatetime NOT NULL,
    [RevokePaymentType] tinyint NOT NULL,
    [Comment] nvarchar(200) NULL,
    CONSTRAINT [PK_ClientRevokePayment] PRIMARY KEY ([ClientRevokePaymentID])
);

CREATE TABLE [tt] (
    [productid] int NOT NULL,
    [cost] decimal NULL
);

CREATE TABLE [Client] (
    [ClientID] smallint NOT NULL,
    [SystemDepartmentID] smallint NULL,
    [RegionID] smallint NULL,
    [ClientCode] nvarchar(10) NULL,
    [Name] nvarchar(50) NOT NULL,
    [Address] nvarchar(200) NULL,
    [FirstPhone] nvarchar(13) NULL,
    [SecondPhone] nvarchar(20) NULL,
    [Mobile] nvarchar(13) NULL,
    [Fax] nvarchar(13) NULL,
    [SalesPersonID] smallint NULL,
    [Email] nvarchar(50) NULL,
    [Country] nvarchar(20) NULL,
    [ClientLimit] float NULL,
    [Begining Balance] decimal NULL,
    [ClientBalance] float NULL,
    [Discount] float NULL,
    [CurrencyID] smallint NULL,
    [ContactPerson] nvarchar(200) NULL,
    [AccountNo] nvarchar(50) NULL,
    [Active] tinyint NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    CONSTRAINT [PK_Client] PRIMARY KEY ([ClientID])
);

CREATE TABLE [CustomerAllPayments] (
    [GalleryID] smallint NOT NULL,
    [CustomerID] smallint NOT NULL,
    [Type] char(10) NOT NULL,
    [PaymentID] int NOT NULL,
    [LocalSerial] varchar(50) NULL,
    [Debit] decimal NULL,
    [Credit] decimal NULL,
    [DownPayment] decimal NULL,
    [Payment] decimal NULL,
    [RevokePayment] decimal NULL,
    [PayDate] smalldatetime NULL,
    [Comment] varchar(2000) NULL,
    CONSTRAINT [PK_CustomerAllPayments] PRIMARY KEY ([CustomerID], [GalleryID], [PaymentID], [Type])
);

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

CREATE TABLE [CustomerMovement] (
    [GalleryID] int NOT NULL,
    [CustomerID] int NOT NULL,
    [Type] smallint NOT NULL,
    [LocalSerial] varchar(12) NOT NULL,
    [MoveDate] smalldatetime NULL,
    [Amount] float NULL,
    [Balance] float NULL,
    [TransactionID] int NULL,
    [Debit] decimal NULL,
    [Credit] decimal NULL,
    [Comment] varchar(2000) NULL,
    CONSTRAINT [PK_CustomerMovement] PRIMARY KEY ([CustomerID], [GalleryID], [LocalSerial], [Type])
);

CREATE TABLE [CorrectOrder] (
    [TransID] int NULL,
    [OrderID] int NULL
);

CREATE TABLE [CustomerOrderDetails] (
    [CustomerOrderDetailsID] int NOT NULL,
    [CustomerOrderID] int NOT NULL,
    [ProductID] int NOT NULL,
    [ExpiryDate] datetime NULL,
    [Quantity] decimal NULL,
    [TotalRevokes] decimal NULL,
    [TotalExchange] decimal NULL,
    [Discount] decimal NOT NULL,
    [UnitPrice] decimal NULL,
    [NetPrice] decimal NOT NULL,
    [SupplierInvoiceDetailsID] int NULL,
    [SPH] varchar(10) NULL,
    [CYL] varchar(10) NULL,
    [AXS] varchar(10) NULL,
    [ADD] varchar(10) NULL,
    [InsuranceDiscount] decimal NULL,
    [ApprovePrice] decimal NULL,
    [CustomerDe] decimal NULL,
    [TypeID] int NULL,
    CONSTRAINT [PK_CustomerOrderDetails] PRIMARY KEY ([CustomerOrderDetailsID])
);

CREATE TABLE [SalesPersons] (
    [SalesPersonID] smallint NOT NULL,
    [SalesPersonName] nvarchar(50) NOT NULL,
    [SystemDepartmentID] smallint NULL,
    [TargetLimit] decimal NOT NULL,
    [DiscountLimit] decimal NOT NULL,
    [Address] nvarchar(50) NULL,
    [Phones] varchar(13) NULL,
    [Country] nvarchar(25) NULL,
    [Mobile] varchar(13) NULL,
    [Balance] decimal NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    [Balance1] decimal NULL,
    [SalesPersonCode] nvarchar(10) NULL,
    [BeginningBalance] decimal NULL,
    CONSTRAINT [PK_SalesPersons] PRIMARY KEY ([SalesPersonID])
);

CREATE TABLE [AgeGroup] (
    [AgeGroupID] smallint NOT NULL,
    [Name] nvarchar(50) NOT NULL,
    [Value] nvarchar(10) NOT NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    CONSTRAINT [PK_AgeGroup] PRIMARY KEY ([AgeGroupID])
);

CREATE TABLE [CustomerPayment] (
    [intPaymentID] int NOT NULL,
    [intTrans_Year] int NULL,
    [intSerial] int NULL,
    [intCustomerID] int NULL,
    [intEmployeeID] int NULL,
    [sinPaymentType] smallint NULL,
    [sinCreditCardID] smallint NULL,
    [vchCardNumber] varchar(50) NULL,
    [vchBatchNumber] varchar(50) NULL,
    [decPaymentAmount] decimal NULL,
    [sdtPaymentDate] smalldatetime NULL,
    [intCustomerOrderID] int NULL,
    [vchComment] nvarchar(200) NULL,
    [GalleryID] smallint NULL,
    [FreeSerial] nvarchar(20) NULL,
    [posted] int NULL,
    CONSTRAINT [PK_CustomerPayment] PRIMARY KEY ([intPaymentID])
);

CREATE TABLE [CustomerRevoke] (
    [CustomerRevokeID] int NOT NULL,
    [CustomerOrderID] int NOT NULL,
    [Trans_Year] int NULL,
    [Serial] int NULL,
    [EmployeeID] smallint NOT NULL,
    [RevokeDate] smalldatetime NOT NULL,
    [RevokeAmount] decimal NOT NULL,
    [RevokeAmountBeforeDiscount] decimal NULL,
    [Discount] decimal NULL,
    [ReceiptNo] int NOT NULL,
    [GalleryID] smallint NULL,
    [CustomerRevokeMasterID] varchar(25) NULL,
    [RevokePaymentID] int NULL,
    [Comments] nvarchar(2000) NULL,
    [Status] bit NULL,
    [Canceled] bit NULL,
    [Posted] bit NULL,
    [FreeSerial] nvarchar(20) NULL,
    CONSTRAINT [PK_CustomerRevoke] PRIMARY KEY ([CustomerRevokeID])
);

CREATE TABLE [product2017] (
    [ProductID] int NOT NULL,
    [Code] nvarchar(50) NOT NULL,
    [MainGroupID] smallint NULL,
    [CategoryID] smallint NULL,
    [SubCategoryID] smallint NULL,
    [Description] nvarchar(200) NULL,
    [FreeCode] nvarchar(20) NULL,
    [Lookup1Value] smallint NULL,
    [Lookup2Value] smallint NULL,
    [Lookup3Value] smallint NULL,
    [Lookup4Value] smallint NULL,
    [Lookup5Value] smallint NULL,
    [Lookup6Value] smallint NULL,
    [Status] tinyint NOT NULL,
    [GenderID] smallint NULL,
    [SeasonID] smallint NULL,
    [ManufacturerID] smallint NULL,
    [NewCode] varchar(50) NOT NULL,
    [OriginalCode] varchar(50) NULL,
    [MaestroCode] nvarchar(50) NULL,
    [ShipmentNo] int NULL,
    [Field1] nvarchar(100) NULL,
    [Field2] nvarchar(100) NULL,
    [Field3] nvarchar(100) NULL,
    [Field4] nvarchar(100) NULL,
    [Image] varchar(50) NULL,
    [HasExpiryDate] bit NULL,
    [StoreLimit] smallint NULL,
    [GalleryLimit] smallint NULL,
    [RetailPrice] decimal NULL,
    [GallerySaleDateFrom] smalldatetime NULL,
    [GallerySaleDateTo] smalldatetime NULL,
    [GalleryDiscount] decimal NULL,
    [GallerySaleDiscount] decimal NULL,
    [WhalePrice] decimal NULL,
    [StoreSaleDateFrom] smalldatetime NULL,
    [StoreSaleDateTo] smalldatetime NULL,
    [StoreDiscount] decimal NULL,
    [StoreSaleDiscount] decimal NULL,
    [TotalCost] decimal NULL,
    [TotalQuantity] decimal NULL,
    [CostPrice] decimal NULL,
    [EvaluationPrice] decimal NULL,
    [StoreLowerLimit] int NULL,
    [GalleryLowerLimit] int NULL,
    [StoreUpperLimit] int NULL,
    [GalleryUpperLimit] int NULL,
    [ReOrderLimit] int NULL,
    [RecessLimit] int NULL,
    [IsPresent] bit NULL,
    [CreationDate] smalldatetime NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL
);

CREATE TABLE [CustomerRevokeDetails] (
    [CustomerRevokeDetailsID] int NOT NULL,
    [CustomerRevokeID] int NOT NULL,
    [CustomerOrderDetailsID] int NOT NULL,
    [ProductID] int NULL,
    [ExpiryDate] datetime NULL,
    [Quantity] decimal NOT NULL,
    [NetPrice] decimal NULL,
    CONSTRAINT [PK_CustomerRevokeDetails] PRIMARY KEY ([CustomerRevokeDetailsID])
);

CREATE TABLE [GalleryProduct2017] (
    [ProductID] int NOT NULL,
    [GalleryID] smallint NOT NULL,
    [ExpiryDate] datetime NOT NULL,
    [Quantity] decimal NOT NULL,
    [Freeze] decimal NOT NULL,
    [Pending] decimal NOT NULL,
    [GallerySaleDateFrom] smalldatetime NULL,
    [GallerySaleDateTo] smalldatetime NULL,
    [GalleryDiscount] decimal NULL,
    [GallerySaleDiscount] decimal NULL,
    [RetailPrice] decimal NULL,
    [WhalePrice] decimal NULL,
    [CostPrice] decimal NULL,
    [EvaluationPrice] decimal NULL
);

CREATE TABLE [CustomerRevokePayment] (
    [RevokePaymentID] int NOT NULL,
    [GalleryID] smallint NULL,
    [CustomerID] int NOT NULL,
    [Trans_Year] int NULL,
    [Serial] int NULL,
    [RevokePaymentAmount] float NOT NULL,
    [EmployeeID] smallint NOT NULL,
    [RevokePaymentDate] smalldatetime NULL,
    [Comment] varchar(250) NULL,
    [Posted] bit NULL,
    [RelatedDownPayment] int NULL,
    [FreeSerial] nvarchar(20) NULL,
    CONSTRAINT [PK_CustomerRevokePayment] PRIMARY KEY ([RevokePaymentID])
);

CREATE TABLE [Class] (
    [ClassID] smallint NOT NULL,
    [Name] nvarchar(50) NOT NULL,
    [Value] nvarchar(10) NOT NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    CONSTRAINT [PK_Class] PRIMARY KEY ([ClassID])
);

CREATE TABLE [DownPayment] (
    [DownPaymentID] int NOT NULL,
    [GalleryID] smallint NOT NULL,
    [CustomerID] int NOT NULL,
    [EmployeeID] smallint NOT NULL,
    [Trans_Year] int NOT NULL,
    [Serial] int NOT NULL,
    [PaymentType] smallint NULL,
    [CreditCardID] smallint NULL,
    [CardNumber] varchar(30) NULL,
    [PatchNumber] varchar(20) NULL,
    [PaymentAmount] float NOT NULL,
    [PaidAmount] float NOT NULL,
    [TakenAmount] float NOT NULL,
    [PaymentDate] smalldatetime NOT NULL,
    [RevokeID] int NULL,
    [Status] tinyint NOT NULL,
    [Comment] nvarchar(200) NULL,
    [Posted] bit NULL,
    [FreeSerial] bigint NULL,
    CONSTRAINT [PK_DownPayment] PRIMARY KEY ([DownPaymentID])
);

CREATE TABLE [Customer] (
    [CustomerID] int NOT NULL,
    [CustomerType] tinyint NULL,
    [Active] smallint NULL,
    [CustomerName] nvarchar(100) NOT NULL,
    [Phones] nvarchar(100) NULL,
    [Phone2] nvarchar(100) NULL,
    [Address] nvarchar(100) NULL,
    [Email] varchar(100) NULL,
    [Mobile] nvarchar(20) NULL,
    [Fax] nvarchar(50) NULL,
    [ContactPerson] nvarchar(100) NULL,
    [BeginingBalance] decimal NULL,
    [Balance] decimal NOT NULL,
    [GenderID] smallint NULL,
    [AgeGroupID] smallint NULL,
    [CountryID] smallint NULL,
    [ClassID] smallint NULL,
    [DiscountCardNumber] nvarchar(200) NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    [CreateGalleryID] smallint NULL,
    [CustomerCode] nvarchar(10) NULL,
    [PD] nvarchar(10) NULL,
    [R.Sph.Dist.] nvarchar(10) NULL,
    [R.Sph.Read] nvarchar(10) NULL,
    [R.Sph.CLens] nvarchar(10) NULL,
    [R.Cyl.Dist.] nvarchar(10) NULL,
    [R.Cyl.Read] nvarchar(10) NULL,
    [R.Cyl.CLens] nvarchar(10) NULL,
    [R.Ax.Dist.] nvarchar(10) NULL,
    [R.Ax.Read] nvarchar(10) NULL,
    [R.Ax.CLens] nvarchar(10) NULL,
    [L.Sph.Dist.] nvarchar(10) NULL,
    [L.Sph.Read] nvarchar(10) NULL,
    [L.Sph.CLens] nvarchar(10) NULL,
    [L.Cyl.Dist.] nvarchar(10) NULL,
    [L.Cyl.Read] nvarchar(10) NULL,
    [L.Cyl.CLens] nvarchar(10) NULL,
    [L.Ax.Dist.] nvarchar(10) NULL,
    [L.Ax.Read] nvarchar(10) NULL,
    [L.Ax.CLens] nvarchar(10) NULL,
    [CheckDate] datetime NULL,
    CONSTRAINT [PK_Customer] PRIMARY KEY ([CustomerID])
);

CREATE TABLE [trans] (
    [transferid] int NOT NULL,
    CONSTRAINT [PK_trans] PRIMARY KEY ([transferid])
);

CREATE TABLE [ExchangedProducts] (
    [TransactionID] int NOT NULL,
    [OrderID] int NULL,
    [OrderType] bit NULL,
    [DeptID] int NULL,
    [EmployeeID] int NULL,
    [ExchangeDate] datetime NULL,
    [Trans_Year] int NULL,
    [Serial] int NULL,
    [Canceled] bit NULL,
    [Posted] int NULL,
    [FreeSerial] nvarchar(20) NULL,
    CONSTRAINT [PK_ExchangedProducts] PRIMARY KEY ([TransactionID])
);

CREATE TABLE [ExchangedProductsDetails] (
    [DetailsID] int NOT NULL,
    [ExchangedProductsID] int NULL,
    [ProductID] int NULL,
    [Quantity] decimal NULL,
    [ExpiryDate] datetime NULL,
    [UnitPrice] decimal NULL,
    [TotalPrice] decimal NULL,
    CONSTRAINT [PK_ExchangedProductsDetails] PRIMARY KEY ([DetailsID])
);

CREATE TABLE [storeproduct2014] (
    [StoreID] smallint NOT NULL,
    [ProductID] int NOT NULL,
    [ExpiryDate] datetime NOT NULL,
    [Quantity] decimal NOT NULL,
    [Freeze] decimal NOT NULL,
    [Pending] decimal NOT NULL,
    [StoreSaleDateFrom] smalldatetime NULL,
    [StoreSaleDateTo] smalldatetime NULL,
    [StoreDiscount] decimal NULL,
    [StoreSaleDiscount] decimal NULL,
    [RetailPrice] decimal NULL,
    [WhalePrice] decimal NULL,
    [CostPrice] decimal NULL,
    [EvaluationPrice] decimal NULL
);

CREATE TABLE [GalleryAdjustment] (
    [GalleryAdjustmentID] int NOT NULL,
    [Trans_year] int NULL,
    [Serial] int NULL,
    [AdjustmentDate] smalldatetime NOT NULL,
    [EmployeeID] smallint NOT NULL,
    [GalleryID] smallint NOT NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    [Posted] bit NULL,
    [dtPostDate] datetime NULL,
    [sinPostUserID] smallint NULL,
    [Canceled] bit NULL,
    CONSTRAINT [PK_GalleryAdjustment] PRIMARY KEY ([GalleryAdjustmentID])
);

CREATE TABLE [GalleryAdjustmentDetails] (
    [GalleryAdjustmentDetailsID] int NOT NULL,
    [GalleryAdjustmentID] int NOT NULL,
    [ProductID] int NOT NULL,
    [ExpiryDate] datetime NULL,
    [Quantity] decimal NULL,
    [AdjustmentType] varchar(50) NULL,
    CONSTRAINT [PK_GalleryAdjustmentDetails] PRIMARY KEY ([GalleryAdjustmentDetailsID])
);

CREATE TABLE [GalleryOpenBalance] (
    [intBalanceID] int NOT NULL,
    [intTransYear] int NULL,
    [intSerial] int NULL,
    [intGalleryID] int NULL,
    [intEmployeeID] int NULL,
    [dtCreateDate] datetime NULL,
    CONSTRAINT [PK_GalleryOpenBalance] PRIMARY KEY ([intBalanceID])
);

CREATE TABLE [transstore] (
    [transactionid] int NULL
);

CREATE TABLE [ProductOrder] (
    [id_num] int NOT NULL,
    [ProductID] int NULL,
    [ProductCode] nvarchar(50) NULL,
    [Quantity] decimal NULL
);

CREATE TABLE [ProductRequestDetails] (
    [ProductRequestDetailsID] int NOT NULL,
    [ProductRequestID] int NULL,
    [ProductID] int NULL,
    [ExpiryDate] datetime NULL,
    [Quantity] int NULL,
    CONSTRAINT [PK_ProductRequestDetails] PRIMARY KEY ([ProductRequestDetailsID])
);

CREATE TABLE [Country] (
    [CountryID] smallint NOT NULL,
    [Name] nvarchar(50) NOT NULL,
    [Value] nvarchar(10) NOT NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    CONSTRAINT [PK_Country] PRIMARY KEY ([CountryID])
);

CREATE TABLE [PurchaseOrder] (
    [PurchaseOrderID] int NOT NULL,
    [OrderDate] smalldatetime NOT NULL,
    [EmployeeID] smallint NOT NULL,
    [SupplierID] smallint NOT NULL,
    [StoreID] int NULL,
    [DeliveryDate] smalldatetime NULL,
    [ExpectedDeliveryDate] smalldatetime NULL,
    [Trans_Year] int NULL,
    [Serial] int NULL,
    [Status] smallint NULL,
    [sinCreateUserId] smallint NULL,
    [dtCreateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [Posted] bit NULL,
    [dtPostDate] datetime NULL,
    [sinPostUserID] datetime NULL,
    [Canceled] bit NULL,
    [FreeSerial] nvarchar(20) NULL,
    CONSTRAINT [PK_PurchaseOrder] PRIMARY KEY ([PurchaseOrderID])
);

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

CREATE TABLE [PurchaseOrderDetails] (
    [PurchaseOrderDetailsID] int NOT NULL,
    [PurchaseOrderID] int NOT NULL,
    [ProductID] int NULL,
    [Quantity] decimal NOT NULL,
    [DeliveredQuantity] smallint NULL,
    [Description] nvarchar(50) NULL,
    [Status] smallint NULL,
    [Finished] int NULL,
    CONSTRAINT [PK_PurchaseOrderDetails] PRIMARY KEY ([PurchaseOrderDetailsID])
);

CREATE TABLE [RequestProduct] (
    [RequestID] int NOT NULL,
    [Trans_Year] int NULL,
    [Serial] int NULL,
    [DeptIDFrom] int NULL,
    [DeptTypeFrom] smallint NULL,
    [DeptIDTo] int NULL,
    [DeptTypeTo] tinyint NULL,
    [RequestDate] datetime NULL,
    [Status] tinyint NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [Posted] bit NULL,
    [dtPostDate] datetime NULL,
    [sinPostUserID] smallint NULL,
    [PostReferenceID] smallint NULL,
    [Canceled] bit NULL,
    [Comments] nvarchar(4000) NULL,
    [FreeSerial] nvarchar(20) NULL,
    CONSTRAINT [PK_RequestProduct] PRIMARY KEY ([RequestID])
);

CREATE TABLE [RequestProductDetails] (
    [RequestProductDetailsID] int NOT NULL,
    [RequestProductID] int NULL,
    [ProductID] int NULL,
    [ExpiryDate] datetime NULL,
    [Quantity] int NULL,
    CONSTRAINT [PK_RequestProductDetails] PRIMARY KEY ([RequestProductDetailsID])
);

CREATE TABLE [StoreOpenBalanceDetails] (
    [intBalanceDetailsID] int NOT NULL,
    [intBalanceID] int NULL,
    [intProductID] int NOT NULL,
    [dtExpiryDate] datetime NOT NULL,
    [decOpeningBalance] decimal NULL,
    [intQuantity] decimal NULL,
    CONSTRAINT [PK_StoreOpenBalanceDetails] PRIMARY KEY ([intBalanceDetailsID])
);

CREATE TABLE [SpecialOfferProducts] (
    [SpecialOfferDetailsID] int NULL,
    [ProductID] int NULL,
    [dtCreateDate] datetime NULL
);

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

CREATE TABLE [newtable] (
    [intPaymentID] int NOT NULL,
    [intTrans_Year] int NULL,
    [intSerial] int NULL,
    [intCustomerID] int NULL,
    [intEmployeeID] int NULL,
    [sinPaymentType] smallint NULL,
    [sinCreditCardID] smallint NULL,
    [vchCardNumber] varchar(50) NULL,
    [vchBatchNumber] varchar(50) NULL,
    [decPaymentAmount] decimal NULL,
    [sdtPaymentDate] smalldatetime NULL,
    [intCustomerOrderID] int NULL,
    [vchComment] nvarchar(200) NULL,
    [GalleryID] smallint NULL,
    [FreeSerial] nvarchar(20) NULL,
    [posted] int NULL
);

CREATE TABLE [SpoiledProducts] (
    [TransactionID] int NOT NULL,
    [StoreID] int NULL,
    [DeptID] smallint NULL,
    [DeptType] smallint NULL,
    [EmployeeID] smallint NULL,
    [Date] datetime NULL,
    [CreatorEmployeeID] int NULL,
    [Trans_Year] int NULL,
    [Serial] int NULL,
    [RelatedTransfer] nvarchar(50) NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    [Posted] bit NULL,
    [dtPostDate] datetime NULL,
    [sinPostUserID] smallint NULL,
    [PostRefrenceID] smallint NULL,
    [Canceled] bit NULL,
    [FreeSerial] nvarchar(20) NULL,
    CONSTRAINT [PK_SpoiledProducts] PRIMARY KEY ([TransactionID])
);

CREATE TABLE [GalleryOpenBalanceDetails] (
    [intBalanceDetailsID] int NOT NULL,
    [intBalanceID] int NOT NULL,
    [intProductID] int NOT NULL,
    [dtExpiryDate] datetime NOT NULL,
    [decOpeningBalance] decimal NULL,
    [intQuantity] decimal NULL,
    CONSTRAINT [PK_GalleryOpenBalanceDetails] PRIMARY KEY ([intBalanceDetailsID])
);

CREATE TABLE [SpoiledProductsDetails] (
    [TransactionMasterID] int NULL,
    [DetailsID] int NOT NULL,
    [ProductID] int NULL,
    [Quantity] decimal NULL,
    [WhalePrice] decimal NULL,
    [ExpiryDate] datetime NULL,
    CONSTRAINT [PK_SpoiledProductsDetails] PRIMARY KEY ([DetailsID])
);

CREATE TABLE [Department] (
    [DepartmentID] tinyint NOT NULL,
    [Name] varchar(50) NOT NULL,
    [Order] smallint NULL,
    CONSTRAINT [PK_Department] PRIMARY KEY ([DepartmentID])
);

CREATE TABLE [StoreAdjustment] (
    [StoreAdjustmentID] int NOT NULL,
    [EmployeeID] smallint NOT NULL,
    [StoreID] smallint NOT NULL,
    [Trans_Year] int NULL,
    [Serial] int NULL,
    [AdjustmentDate] smalldatetime NOT NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    [Posted] bit NULL,
    [dtPostDate] datetime NULL,
    [sinPostUserID] smallint NULL,
    [Canceled] bit NULL,
    CONSTRAINT [PK_StoreAdjustment] PRIMARY KEY ([StoreAdjustmentID])
);

CREATE TABLE [StoreAdjustmentDetails] (
    [StoreAdjustmentDetailsID] int NOT NULL,
    [StoreAdjustmentID] int NOT NULL,
    [ProductID] int NOT NULL,
    [ExpiryDate] datetime NULL,
    [Quantity] decimal NULL,
    [AdjustmentType] varchar(50) NULL,
    CONSTRAINT [PK_StoreAdjustmentDetails] PRIMARY KEY ([StoreAdjustmentDetailsID])
);

CREATE TABLE [Groups] (
    [GroupID] int NOT NULL,
    [GroupName] nvarchar(50) NULL,
    [DepartmentID] tinyint NULL,
    CONSTRAINT [PK_Groups] PRIMARY KEY ([GroupID])
);

CREATE TABLE [StoreOpenBalance] (
    [intBalanceID] int NOT NULL,
    [intSerial] int NULL,
    [intTransYear] int NULL,
    [intStoreID] int NULL,
    [intEmployeeID] int NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    [Posted] bit NULL,
    [dtPostDate] datetime NULL,
    [sinPostUserID] smallint NULL,
    [Canceled] bit NULL,
    CONSTRAINT [PK_StoreOpenBalance] PRIMARY KEY ([intBalanceID])
);

CREATE TABLE [Alert] (
    [AlertID] smallint NOT NULL,
    [AlertName] nvarchar(50) NOT NULL,
    [AlertType] varchar(50) NOT NULL,
    [AlertBody] nvarchar(400) NOT NULL,
    CONSTRAINT [PK_Alert] PRIMARY KEY ([AlertID])
);

CREATE TABLE [PaymentType] (
    [PaymentTypeID] smallint NOT NULL,
    [PaymentTypeName] nvarchar(50) NULL,
    CONSTRAINT [PK_PaymentType] PRIMARY KEY ([PaymentTypeID])
);

CREATE TABLE [AlertEmployee] (
    [AlertID] smallint NOT NULL,
    [EmployeeID] smallint NOT NULL,
    CONSTRAINT [PK_AlertEmployee] PRIMARY KEY ([AlertID], [EmployeeID])
);

CREATE TABLE [CustomerPaymenttest] (
    [intPaymentID] int NOT NULL,
    [intTrans_Year] int NULL,
    [intSerial] int NULL,
    [intCustomerID] int NULL,
    [intEmployeeID] int NULL,
    [sinPaymentType] smallint NULL,
    [sinCreditCardID] smallint NULL,
    [vchCardNumber] varchar(50) NULL,
    [vchBatchNumber] varchar(50) NULL,
    [decPaymentAmount] decimal NULL,
    [sdtPaymentDate] smalldatetime NULL,
    [intCustomerOrderID] int NULL,
    [vchComment] nvarchar(200) NULL,
    [GalleryID] smallint NULL,
    [FreeSerial] nvarchar(20) NULL,
    [posted] int NULL
);

CREATE TABLE [StoreOrder] (
    [StoreOrderID] int NOT NULL,
    [StoreID] smallint NOT NULL,
    [Trans_Year] int NULL,
    [Serial] int NULL,
    [EmployeeID] smallint NOT NULL,
    [OrderDate] smalldatetime NOT NULL,
    [DeliveryDate] smalldatetime NULL,
    [ReceiveReceipt] int NULL,
    [Status] tinyint NOT NULL,
    [StoreOrderMasterID] varchar(25) NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] datetime NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    [Posted] bit NULL,
    [dtPostDate] datetime NULL,
    [sinPostUserID] smallint NULL,
    [Canceled] bit NULL,
    CONSTRAINT [PK_StoreOrder] PRIMARY KEY ([StoreOrderID])
);

CREATE TABLE [ClientBeginingBalance] (
    [ClientStoreBalanceID] int NOT NULL,
    [ClientID] int NULL,
    [StoreID] int NULL,
    [Amount] float NULL
);

CREATE TABLE [StoreOrderDetails] (
    [StoreOrderDetailsID] int NOT NULL,
    [StoreOrderID] int NOT NULL,
    [ProductID] int NOT NULL,
    [ExpiryDate] datetime NULL,
    [Quantity] smallint NOT NULL,
    [PurchasePrice] float NULL,
    [PurchaseOrderID] int NULL,
    CONSTRAINT [PK_StoreOrderDetails] PRIMARY KEY ([StoreOrderDetailsID])
);

CREATE TABLE [StoreProductTransfer] (
    [StoreProductTransferID] int NOT NULL,
    [EmployeeID] smallint NOT NULL,
    [StoreID] smallint NOT NULL,
    [Trans_Year] int NULL,
    [Serial] int NULL,
    [ProductTransferDate] smalldatetime NOT NULL,
    [FreeSerial] nvarchar(20) NULL,
    CONSTRAINT [PK_StoreProductTransfer] PRIMARY KEY ([StoreProductTransferID])
);

CREATE TABLE [StoreProductTransferDetails] (
    [StoreProductTransferDetailsID] int NOT NULL,
    [StoreProductTransferID] int NOT NULL,
    [FromProductID] int NOT NULL,
    [FromExpiryDate] datetime NULL,
    [ToProductID] int NULL,
    [ToExpiryDate] datetime NULL,
    [Quantity] float NOT NULL,
    CONSTRAINT [PK_StoreProductTransferDetails] PRIMARY KEY ([StoreProductTransferDetailsID])
);

CREATE TABLE [CLientDiscount] (
    [MainGroupID] int NOT NULL,
    [ClientID] smallint NOT NULL,
    [Discount] decimal NULL,
    CONSTRAINT [PK_CLientDiscount] PRIMARY KEY ([ClientID], [MainGroupID])
);

CREATE TABLE [StoreRevoke] (
    [StoreRevokeID] int NOT NULL,
    [RevokeDate] smalldatetime NOT NULL,
    [EmployeeID] smallint NOT NULL,
    [StoreID] smallint NOT NULL,
    [Trans_Year] int NULL,
    [Serial] int NULL,
    [Status] tinyint NOT NULL,
    [SendReceipt] int NULL,
    [DeliveryDate] smalldatetime NULL,
    [StoreAdditionOrderID] int NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    [Posted] bit NULL,
    [dtPostDate] datetime NULL,
    [sinPostUserID] smallint NULL,
    [Canceled] bit NULL,
    CONSTRAINT [PK_StoreRevoke] PRIMARY KEY ([StoreRevokeID])
);

CREATE TABLE [StoreRevokeDetails] (
    [StoreRevokeDetailsID] int NOT NULL,
    [StoreRevokeID] int NOT NULL,
    [ProductID] int NOT NULL,
    [ExpiryDate] datetime NULL,
    [Quantity] decimal NOT NULL,
    [DQuantity] decimal NULL,
    CONSTRAINT [PK_StoreRevokeDetails] PRIMARY KEY ([StoreRevokeDetailsID])
);

CREATE TABLE [Category] (
    [CategoryID] smallint NOT NULL,
    [MaingroupID] int NULL,
    [Name] varchar(50) NOT NULL,
    [Value] varchar(50) NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    [AccountNo] nvarchar(50) NULL,
    CONSTRAINT [PK_Category] PRIMARY KEY ([CategoryID])
);

CREATE TABLE [CategoryAccount] (
    [CategoryID] int NOT NULL,
    [StoreID] int NOT NULL,
    [PurchaseAccountNo] nvarchar(50) NULL,
    [PurchaseReturnsNo] nvarchar(50) NULL,
    [salesAccountNo] nvarchar(50) NULL,
    [salesReturnsNo] nvarchar(50) NULL,
    CONSTRAINT [PK_CategoryAccount] PRIMARY KEY ([CategoryID], [StoreID])
);

CREATE TABLE [ClientAccount] (
    [ClientID] int NOT NULL,
    [StoreID] int NOT NULL,
    [AccountNo] nvarchar(50) NULL,
    CONSTRAINT [PK_ClientAccount] PRIMARY KEY ([ClientID], [StoreID])
);

CREATE TABLE [SupplierRevoke] (
    [SupplierRevokeID] int NOT NULL,
    [StoreID] smallint NULL,
    [SupplierID] smallint NULL,
    [bitHasInvoice] bit NULL,
    [SupplierInvoiceID] int NULL,
    [Trans_Year] int NULL,
    [Serial] int NULL,
    [RevokeDate] datetime NULL,
    [Status] tinyint NULL,
    [SendReceipt] int NULL,
    [CurrencyRate] decimal NULL,
    [CurrencyID] decimal NULL,
    [TotalRevokeAmount] decimal NULL,
    [TotalRevokeBaseAmount] decimal NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    [Posted] bit NULL,
    [dtPostDate] datetime NULL,
    [sinPostUserID] smallint NULL,
    [Canceled] bit NULL,
    [FreeSerial] bigint NULL,
    CONSTRAINT [PK_SupplierRevoke] PRIMARY KEY ([SupplierRevokeID])
);

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

CREATE TABLE [Transfer] (
    [TransferID] int NOT NULL,
    [EmployeeID] smallint NOT NULL,
    [Trans_Year] int NULL,
    [Serial] int NULL,
    [FreeSerial] bigint NULL,
    [TransferFrom] smallint NOT NULL,
    [TransferTypeFrom] smallint NULL,
    [TransferTo] smallint NOT NULL,
    [TransferTypeTo] smallint NULL,
    [TransferDate] smalldatetime NOT NULL,
    [DeliveryDate] smalldatetime NULL,
    [SendReceipt] int NULL,
    [ReceiveReceipt] int NULL,
    [Status] tinyint NOT NULL,
    [TotalQuantity] decimal NULL,
    [TotalValue] decimal NULL,
    [RequestProductID] int NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    [Posted] bit NULL,
    [dtPostDate] datetime NULL,
    [sinPostUserID] smallint NULL,
    [PostRefrenceID] smallint NULL,
    [Canceled] bit NULL,
    [bolDeleted] bit NULL,
    [Comment] nvarchar(2000) NULL,
    CONSTRAINT [PK_Transfer] PRIMARY KEY ([TransferID])
);

CREATE TABLE [Gender] (
    [GenderID] smallint NOT NULL,
    [Name] varchar(50) NOT NULL,
    [Value] varchar(50) NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    CONSTRAINT [PK_Gender] PRIMARY KEY ([GenderID])
);

CREATE TABLE [Product] (
    [ProductID] int NOT NULL,
    [Code] nvarchar(50) NOT NULL,
    [MainGroupID] smallint NULL,
    [CategoryID] smallint NULL,
    [SubCategoryID] smallint NULL,
    [Description] nvarchar(2000) NULL,
    [FreeCode] nvarchar(20) NULL,
    [Lookup1Value] smallint NULL,
    [Lookup2Value] smallint NULL,
    [Lookup3Value] smallint NULL,
    [Lookup4Value] smallint NULL,
    [Lookup5Value] smallint NULL,
    [Lookup6Value] smallint NULL,
    [Status] tinyint NOT NULL,
    [GenderID] smallint NULL,
    [SeasonID] smallint NULL,
    [ManufacturerID] smallint NULL,
    [NewCode] varchar(50) NOT NULL,
    [OriginalCode] varchar(50) NULL,
    [MaestroCode] nvarchar(50) NULL,
    [ShipmentNo] int NULL,
    [Field1] nvarchar(100) NULL,
    [Field2] nvarchar(100) NULL,
    [Field3] nvarchar(100) NULL,
    [Field4] nvarchar(100) NULL,
    [Image] varchar(50) NULL,
    [HasExpiryDate] bit NULL,
    [StoreLimit] smallint NULL,
    [GalleryLimit] smallint NULL,
    [RetailPrice] decimal NULL,
    [GallerySaleDateFrom] smalldatetime NULL,
    [GallerySaleDateTo] smalldatetime NULL,
    [GalleryDiscount] decimal NULL,
    [GallerySaleDiscount] decimal NULL,
    [WhalePrice] decimal NULL,
    [StoreSaleDateFrom] smalldatetime NULL,
    [StoreSaleDateTo] smalldatetime NULL,
    [StoreDiscount] decimal NULL,
    [StoreSaleDiscount] decimal NULL,
    [TotalCost] decimal NULL,
    [TotalQuantity] decimal NULL,
    [CostPrice] decimal NULL,
    [EvaluationPrice] decimal NULL,
    [StoreLowerLimit] int NULL,
    [GalleryLowerLimit] int NULL,
    [StoreUpperLimit] int NULL,
    [GalleryUpperLimit] int NULL,
    [ReOrderLimit] int NULL,
    [RecessLimit] int NULL,
    [IsPresent] bit NULL,
    [CreationDate] smalldatetime NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    CONSTRAINT [PK_Product] PRIMARY KEY ([ProductID])
);

CREATE TABLE [InsuranceItemCodes- OLD] (
    [ItemID] int NOT NULL,
    [ItemCode] nvarchar(20) NULL,
    [ItemDescription] nvarchar(100) NULL,
    [ItemPrice] float NULL,
    [InsuranceCompanyId] smallint NULL,
    [MainGroupsID] int NULL,
    CONSTRAINT [PK_InsuranceItemCodes- OLD] PRIMARY KEY ([ItemID])
);

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

CREATE TABLE [Season] (
    [SeasonID] smallint NOT NULL,
    [Name] varchar(50) NOT NULL,
    [Value] varchar(50) NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    CONSTRAINT [PK_Season] PRIMARY KEY ([SeasonID])
);

CREATE TABLE [Settings] (
    [SettingsID] int NOT NULL,
    [Name] varchar(50) NOT NULL,
    [Value] varchar(50) NOT NULL,
    CONSTRAINT [PK_Settings] PRIMARY KEY ([SettingsID])
);

CREATE TABLE [CustomerAllPaymentsnew] (
    [GalleryID] smallint NOT NULL,
    [CustomerID] smallint NOT NULL,
    [Type] char(10) NOT NULL,
    [PaymentID] int NOT NULL,
    [LocalSerial] varchar(50) NULL,
    [Debit] decimal NULL,
    [Credit] decimal NULL,
    [DownPayment] decimal NULL,
    [Payment] decimal NULL,
    [RevokePayment] decimal NULL,
    [PayDate] smalldatetime NULL,
    [Comment] varchar(2000) NULL
);

CREATE TABLE [CodeSettingDetail] (
    [ID] int NOT NULL,
    [CodeSettingMasterID] int NOT NULL,
    [SegmentType] smallint NULL,
    [FreeCodeType] smallint NULL,
    [FreeCodeLength] smallint NULL,
    [LookupID] int NULL,
    [FreeCodeName] varchar(50) NULL,
    CONSTRAINT [PK_CodeSettingDetail] PRIMARY KEY ([ID])
);

CREATE TABLE [CodeSettingMaster] (
    [TemplateID] int NOT NULL,
    [TemplateName] nvarchar(50) NULL,
    [SegmentCount] smallint NULL,
    [FreeCodeName] nvarchar(50) NULL,
    CONSTRAINT [PK_CodeSettingMaster] PRIMARY KEY ([TemplateID])
);

CREATE TABLE [catacc] (
    [CategoryID] int NOT NULL,
    [StoreID] int NOT NULL,
    [PurchaseAccountNo] nvarchar(50) NULL,
    [PurchaseReturnsNo] nvarchar(50) NULL,
    [salesAccountNo] nvarchar(50) NULL,
    [salesReturnsNo] nvarchar(50) NULL
);

CREATE TABLE [Privileges] (
    [GroupId] int NOT NULL,
    [FormCode] nvarchar(50) NOT NULL,
    [Show] bit NULL,
    [Save] bit NULL,
    [Process] bit NULL,
    [Delete] bit NULL,
    [EditAfterProcess] bit NULL,
    [DeleteAfterProcess] bit NULL,
    CONSTRAINT [PK_Privileges] PRIMARY KEY ([FormCode], [GroupId])
);

CREATE TABLE [CreditCard] (
    [CreditCardID] smallint NOT NULL,
    [Name] nvarchar(50) NOT NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    [Commissionrate] float NULL,
    CONSTRAINT [PK_CreditCard] PRIMARY KEY ([CreditCardID])
);

CREATE TABLE [dtproperties] (
    [id] int NOT NULL,
    [objectid] int NULL,
    [property] varchar(64) NOT NULL,
    [value] varchar(255) NULL,
    [uvalue] nvarchar(255) NULL,
    [lvalue] image NULL,
    [version] int NOT NULL,
    CONSTRAINT [PK_dtproperties] PRIMARY KEY ([id], [property])
);

CREATE TABLE [Gallery] (
    [GalleryID] smallint NOT NULL,
    [Name] nvarchar(50) NOT NULL,
    [Address] nvarchar(50) NULL,
    [Phones] nvarchar(50) NULL,
    [GalleryMasterID] smallint NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    [CurrencyID] int NULL,
    [DiscountPercentage] decimal NULL,
    [RegionID] int NULL,
    [SystemDepartmentID] tinyint NULL,
    [Extension] varchar(10) NULL,
    [Responsible] nvarchar(50) NULL,
    [CashAccountNo] nvarchar(50) NULL,
    [CreditAccountNo] nvarchar(50) NULL,
    [RemainsAccountNo] nvarchar(50) NULL,
    [SalesAccountNo] nvarchar(50) NULL,
    [DownPaymentAccountNo] nvarchar(50) NULL,
    [BeginningBalance] decimal NULL,
    [Bankcommissions] nvarchar(50) NULL,
    [GalleryCode] nvarchar(50) NULL,
    CONSTRAINT [PK_Gallery] PRIMARY KEY ([GalleryID])
);

CREATE TABLE [EmailAlert] (
    [EmailAlertID] int NOT NULL,
    [EmailDate] smalldatetime NOT NULL,
    [AlertID] smallint NOT NULL,
    [GalleryID] smallint NULL,
    [TransactionTypeID] smallint NULL,
    [TransactionID] int NULL,
    CONSTRAINT [PK_EmailAlert] PRIMARY KEY ([EmailAlertID])
);

CREATE TABLE [EmailAlertProduct] (
    [EmailAlertID] int NOT NULL,
    [ProductID] int NOT NULL,
    [ExpiryDate] datetime NOT NULL,
    CONSTRAINT [PK_EmailAlertProduct] PRIMARY KEY ([EmailAlertID], [ExpiryDate], [ProductID])
);

CREATE TABLE [SubCategory] (
    [SubCategoryID] smallint NOT NULL,
    [Name] varchar(150) NOT NULL,
    [Value] varchar(50) NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    [CategoryID] smallint NULL,
    CONSTRAINT [PK_SubCategory] PRIMARY KEY ([SubCategoryID])
);

CREATE TABLE [GalleryEmployee] (
    [EmployeeID] smallint NOT NULL,
    [GalleryID] smallint NOT NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    CONSTRAINT [PK_GalleryEmployee] PRIMARY KEY ([EmployeeID], [GalleryID])
);

CREATE TABLE [Currency] (
    [CURRENCY_CODE] smallint NOT NULL,
    [NAME] varchar(50) NULL,
    [SYMBOL] varchar(4) NULL,
    [RATE] float NULL,
    [IsBaseCurrency] bit NOT NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUSerID] int NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] int NULL,
    CONSTRAINT [PK_Currency] PRIMARY KEY ([CURRENCY_CODE])
);

CREATE TABLE [AllStoreTransactionsDetails] (
    [TransactionDetailsID] int NOT NULL,
    [TransactionMasterID] int NULL,
    [ProductID] int NULL,
    [ExpiryDate] datetime NULL,
    [Incoming] decimal NULL,
    [Outgoing] decimal NULL,
    [Stock] decimal NULL,
    CONSTRAINT [PK_AllStoreTransactionsDetails] PRIMARY KEY ([TransactionDetailsID])
);

CREATE TABLE [InsuranceItemCodes] (
    [ItemID] int NOT NULL,
    [ItemCode] nvarchar(20) NULL,
    [ItemDescription] nvarchar(100) NULL,
    [ItemPrice] float NULL,
    [InsuranceCompanyId] smallint NULL,
    [MainGroupsID] int NULL,
    CONSTRAINT [PK_InsuranceItemCodes] PRIMARY KEY ([ItemID])
);

CREATE TABLE [GalleryYearSerial] (
    [GalleryID] int NOT NULL,
    [Year] int NOT NULL,
    [CustomerOrderSerial] int NULL,
    [CustomerRevokeSerial] int NULL,
    [ExchangeProductsSerial] int NULL,
    [DownPaymentSerial] int NULL,
    [RevokePaymentSerial] int NULL,
    [TransferSerial] int NULL,
    [RequestProductSerial] int NULL,
    [OpeningBalanceSerial] int NULL,
    [PaymentSerial] int NULL,
    [AdjustmentSerial] int NULL,
    CONSTRAINT [PK_GalleryYearSerial] PRIMARY KEY ([GalleryID], [Year])
);

CREATE TABLE [AllStoreTransactionsMaster] (
    [TransactionMasterID] int NOT NULL,
    [DepID] smallint NULL,
    [TransactionTypeID] smallint NULL,
    [TransactionID] int NULL,
    [SerialNo] nvarchar(20) NULL,
    [OrderDate] datetime NULL,
    [FinishDate] datetime NULL,
    [FromToPlaceID] smallint NULL,
    [FromToPlaceType] smallint NULL,
    [OrderToID] int NULL,
    [Move] varchar(5) NULL,
    [SendReceipt] smallint NULL,
    [ReceiveReceipt] smallint NULL,
    [TotalIncoming] decimal NULL,
    [TotalOutgoing] decimal NULL,
    [Status] smallint NULL,
    CONSTRAINT [PK_AllStoreTransactionsMaster] PRIMARY KEY ([TransactionMasterID])
);

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

CREATE TABLE [InsuranceDiscount] (
    [MainGroupID] int NOT NULL,
    [InsuranceID] smallint NOT NULL,
    [Discount] decimal NULL,
    CONSTRAINT [PK_InsuranceDiscount] PRIMARY KEY ([InsuranceID], [MainGroupID])
);

CREATE TABLE [LookupDetails] (
    [ID] int NOT NULL,
    [MasterType] int NULL,
    [Code] nvarchar(20) NULL,
    [Value] nvarchar(20) NULL,
    CONSTRAINT [PK_LookupDetails] PRIMARY KEY ([ID])
);

CREATE TABLE [StoreProduct] (
    [StoreID] smallint NOT NULL,
    [ProductID] int NOT NULL,
    [ExpiryDate] datetime NOT NULL,
    [Quantity] decimal NOT NULL,
    [Freeze] decimal NOT NULL,
    [Pending] decimal NOT NULL,
    [StoreSaleDateFrom] smalldatetime NULL,
    [StoreSaleDateTo] smalldatetime NULL,
    [StoreDiscount] decimal NULL,
    [StoreSaleDiscount] decimal NULL,
    [RetailPrice] decimal NULL,
    [WhalePrice] decimal NULL,
    [CostPrice] decimal NULL,
    [EvaluationPrice] decimal NULL,
    CONSTRAINT [PK_StoreProduct] PRIMARY KEY ([ExpiryDate], [ProductID], [StoreID])
);

CREATE TABLE [LookupMaster] (
    [ID] int NOT NULL,
    [Description] nvarchar(50) NULL,
    [Width] smallint NULL,
    [Type] bit NULL,
    CONSTRAINT [PK_LookupMaster] PRIMARY KEY ([ID])
);

CREATE TABLE [MainGroups] (
    [MainGroupsID] int NOT NULL,
    [Name] nvarchar(100) NULL,
    [Value] nvarchar(5) NULL,
    [TemplateID] int NULL,
    [Type] smallint NULL,
    [MainValue] nvarchar(200) NULL,
    CONSTRAINT [PK_MainGroups] PRIMARY KEY ([MainGroupsID])
);

CREATE TABLE [Manufacturer] (
    [ManufacturerID] smallint NOT NULL,
    [Name] varchar(50) NOT NULL,
    [Value] varchar(50) NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    CONSTRAINT [PK_Manufacturer] PRIMARY KEY ([ManufacturerID])
);

CREATE TABLE [storeproduct2017] (
    [StoreID] smallint NOT NULL,
    [ProductID] int NOT NULL,
    [ExpiryDate] datetime NOT NULL,
    [Quantity] decimal NOT NULL,
    [Freeze] decimal NOT NULL,
    [Pending] decimal NOT NULL,
    [StoreSaleDateFrom] smalldatetime NULL,
    [StoreSaleDateTo] smalldatetime NULL,
    [StoreDiscount] decimal NULL,
    [StoreSaleDiscount] decimal NULL,
    [RetailPrice] decimal NULL,
    [WhalePrice] decimal NULL,
    [CostPrice] decimal NULL,
    [EvaluationPrice] decimal NULL
);

CREATE TABLE [SpecialOffersDetail] (
    [OfferDetailID] int NOT NULL,
    [OfferID] smallint NULL,
    [CategoryID] smallint NULL,
    [NoOfItems] decimal NULL,
    [Price] decimal NULL,
    CONSTRAINT [PK_SpecialOffersDetail] PRIMARY KEY ([OfferDetailID])
);

CREATE TABLE [TransferDetails] (
    [TransferDetailsID] int NOT NULL,
    [TransferID] int NOT NULL,
    [ProductID] int NOT NULL,
    [ExpiryDate] datetime NULL,
    [Quantity] decimal NOT NULL,
    [DeliveredQuantity] decimal NOT NULL,
    [UnitPrice] decimal NULL,
    [RetailPrice] decimal NULL,
    [WhalePrice] decimal NULL,
    [bolDeleted] bit NULL,
    CONSTRAINT [PK_TransferDetails] PRIMARY KEY ([TransferDetailsID])
);

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

CREATE TABLE [Region] (
    [RegionID] int NOT NULL,
    [RegionName] nvarchar(50) NULL,
    [ResponsibleName] nvarchar(50) NULL,
    [ResponsibleAddress] nvarchar(50) NULL,
    [ResponsibleMobile] nvarchar(50) NULL,
    [ResponsiblePhone] nvarchar(50) NULL,
    [ResponsibleEmail] nvarchar(50) NULL,
    CONSTRAINT [PK_Region] PRIMARY KEY ([RegionID])
);

CREATE TABLE [InsurranceOrderDetails] (
    [InsurranceOrderDetailsID] int NOT NULL,
    [CustomerOrderID] int NULL,
    [ItemID] int NULL,
    [Quantity] float NULL,
    [UnitPrice] float NULL,
    [Approvedprice] float NULL,
    [DiscountINS] float NULL,
    CONSTRAINT [PK_InsurranceOrderDetails] PRIMARY KEY ([InsurranceOrderDetailsID])
);

CREATE TABLE [Product2_copy] (
    [ProductID] int NOT NULL,
    [Code] nvarchar(50) NOT NULL,
    [MainGroupID] smallint NULL,
    [CategoryID] smallint NULL,
    [SubCategoryID] smallint NULL,
    [Description] nvarchar(200) NULL,
    [FreeCode] nvarchar(20) NULL,
    [Lookup1Value] smallint NULL,
    [Lookup2Value] smallint NULL,
    [Lookup3Value] smallint NULL,
    [Lookup4Value] smallint NULL,
    [Lookup5Value] smallint NULL,
    [Lookup6Value] smallint NULL,
    [Status] tinyint NOT NULL,
    [GenderID] smallint NULL,
    [SeasonID] smallint NULL,
    [ManufacturerID] smallint NULL,
    [NewCode] varchar(50) NOT NULL,
    [OriginalCode] varchar(50) NULL,
    [MaestroCode] nvarchar(50) NULL,
    [ShipmentNo] int NULL,
    [Field1] nvarchar(100) NULL,
    [Field2] nvarchar(100) NULL,
    [Field3] nvarchar(100) NULL,
    [Field4] nvarchar(100) NULL,
    [Image] varchar(50) NULL,
    [HasExpiryDate] bit NULL,
    [StoreLimit] smallint NULL,
    [GalleryLimit] smallint NULL,
    [RetailPrice] decimal NULL,
    [GallerySaleDateFrom] smalldatetime NULL,
    [GallerySaleDateTo] smalldatetime NULL,
    [GalleryDiscount] decimal NULL,
    [GallerySaleDiscount] decimal NULL,
    [WhalePrice] decimal NULL,
    [StoreSaleDateFrom] smalldatetime NULL,
    [StoreSaleDateTo] smalldatetime NULL,
    [StoreDiscount] decimal NULL,
    [StoreSaleDiscount] decimal NULL,
    [TotalCost] decimal NULL,
    [TotalQuantity] decimal NULL,
    [CostPrice] decimal NULL,
    [EvaluationPrice] decimal NULL,
    [StoreLowerLimit] int NULL,
    [GalleryLowerLimit] int NULL,
    [StoreUpperLimit] int NULL,
    [GalleryUpperLimit] int NULL,
    [ReOrderLimit] int NULL,
    [RecessLimit] int NULL,
    [IsPresent] bit NULL,
    [CreationDate] smalldatetime NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL
);

CREATE TABLE [SystemSettings] (
    [inID] int NOT NULL,
    [bolStoreOption] bit NULL,
    [bolAllowMinus] bit NULL,
    [bolEditPendingTransaction] bit NULL,
    [bolPhysicalDeleteTransaction] bit NULL,
    [bolPrintedSerial] bit NULL,
    [bolExcludeInvoices] bit NULL,
    [nExcludePeriod] int NULL,
    [bolLogin] bit NULL,
    [nLoginStart] int NULL,
    [nLoginEnd] int NULL,
    [nLoginStart_Shift2] int NULL,
    [nLoginEnd_Shift2] int NULL,
    [bolDeleteProcessedTransaction] bit NULL,
    [bolPrintPendingTransaction] bit NULL,
    [bolAllowBuiltInOppositeTransaction] bit NULL,
    [bolEditPrice] bit NULL,
    [bolEditSalesPerson] bit NULL,
    [bolIncludeTax] bit NULL,
    [bolpageSize] bit NULL,
    [nPageSize] int NULL,
    CONSTRAINT [PK_SystemSettings] PRIMARY KEY ([inID])
);

CREATE TABLE [TransactionTypes] (
    [TransactionTypeID] smallint NOT NULL,
    [TransactionType] varchar(30) NOT NULL,
    [TransactionName] varchar(30) NOT NULL,
    [TransactionPage] varchar(50) NULL,
    CONSTRAINT [PK_TransactionTypes] PRIMARY KEY ([TransactionTypeID])
);

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

CREATE TABLE [InsurranceOrderDetails1] (
    [InsurranceOrderDetailsID] int NOT NULL,
    [CustomerOrderID] int NULL,
    [ItemID] int NULL,
    [Quantity] float NULL,
    [UnitPrice] float NULL,
    [Approvedprice] float NULL,
    [DiscountINS] float NULL,
    [Ded] float NULL,
    CONSTRAINT [PK_InsurranceOrderDetails1] PRIMARY KEY ([InsurranceOrderDetailsID])
);

CREATE TABLE [StoreEmployee] (
    [StoreID] smallint NOT NULL,
    [EmployeeID] smallint NOT NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    CONSTRAINT [PK_StoreEmployee] PRIMARY KEY ([EmployeeID], [StoreID])
);

CREATE TABLE [GalleryProduct] (
    [ProductID] int NOT NULL,
    [GalleryID] smallint NOT NULL,
    [ExpiryDate] datetime NOT NULL,
    [Quantity] decimal NOT NULL,
    [Freeze] decimal NOT NULL,
    [Pending] decimal NOT NULL,
    [GallerySaleDateFrom] smalldatetime NULL,
    [GallerySaleDateTo] smalldatetime NULL,
    [GalleryDiscount] decimal NULL,
    [GallerySaleDiscount] decimal NULL,
    [RetailPrice] decimal NULL,
    [WhalePrice] decimal NULL,
    [CostPrice] decimal NULL,
    [EvaluationPrice] decimal NULL,
    CONSTRAINT [PK_GalleryProduct] PRIMARY KEY ([ExpiryDate], [GalleryID], [ProductID])
);

CREATE TABLE [EmployeeSign] (
    [IDserial] int NOT NULL,
    [EmployeeID] int NULL,
    [SignIN] datetime NULL,
    [SignOut] datetime NULL,
    [IPADDRESS] nvarchar(50) NULL,
    CONSTRAINT [PK_EmployeeSign] PRIMARY KEY ([IDserial])
);

CREATE TABLE [TCrossTab] (
    [id_num] int NOT NULL,
    [ProductID] int NULL,
    [ProductCode] nvarchar(50) NULL,
    [Quantity] int NULL,
    [Col1] nvarchar(50) NULL,
    [Col2] nvarchar(50) NULL,
    [Col3] nvarchar(50) NULL
);

CREATE TABLE [SupplierInvoice] (
    [SupplierInvoiceID] int NOT NULL,
    [Serial] int NULL,
    [Trans_Year] int NULL,
    [StoreID] smallint NOT NULL,
    [OriginalInvoiceNo] nvarchar(50) NULL,
    [SupplierID] smallint NOT NULL,
    [EmployeeID] smallint NOT NULL,
    [InvoiceDate] smalldatetime NOT NULL,
    [Status] tinyint NOT NULL,
    [CurrencyRate] decimal NULL,
    [CurrencyID] int NULL,
    [TotalBasePrice] decimal NULL,
    [TotalPrice] decimal NULL,
    [TotalBaseDiscount] decimal NULL,
    [TotalDiscount] decimal NULL,
    [Posted] bit NOT NULL,
    [Canceled] bit NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    [dtPostDate] datetime NULL,
    [sinPostUserID] smallint NULL,
    [FreeSerial] bigint NULL,
    CONSTRAINT [PK_SupplierInvoice] PRIMARY KEY ([SupplierInvoiceID])
);

CREATE TABLE [ProductHistory] (
    [Id] int NOT NULL,
    [ProductID] int NULL,
    [CreationDate] datetime NULL,
    [OldPrice] decimal NULL,
    [NewPrice] decimal NULL,
    [OldStoreDiscount] decimal NULL,
    [NewStoreDiscount] decimal NULL,
    [OldStoreSaleDiscount] decimal NULL,
    [NewStoreSaleDiscount] decimal NULL,
    [OldGalleryDiscount] decimal NULL,
    [NewGalleryDiscount] decimal NULL,
    [OldGallerySaleDiscount] decimal NULL,
    [NewGallerySaleDiscount] decimal NULL,
    [OldDescription] nvarchar(4000) NULL,
    [NewDescription] nvarchar(4000) NULL,
    [UserId] int NULL,
    [OldWhalePrice] decimal NULL,
    [NewWhalePrice] decimal NULL,
    CONSTRAINT [PK_ProductHistory] PRIMARY KEY ([Id])
);

CREATE TABLE [tblTotalSales] (
    [intID] int NOT NULL,
    [intMasterDepID] int NULL,
    [nvcharMasterDepName] nvarchar(50) NULL,
    [intDepID] int NULL,
    [nvcharDepName] nvarchar(50) NULL,
    [tintType] tinyint NULL,
    [decClientOrders] decimal NULL,
    [decClientRevokes] decimal NULL,
    [decClientPaymentCredit] decimal NULL,
    [decClientPaymentCash] decimal NULL,
    [decClientRevokePayment] decimal NULL,
    [decCustomerOrders] decimal NULL,
    [decCustomerRevokes] decimal NULL,
    [decCustomerDownPayment] decimal NULL,
    [decCustomerPaymentCredit] decimal NULL,
    [decCustomerPaymentCoupon] decimal NULL,
    [decCustomerPaymentCash] decimal NULL,
    [decCustomerRevokePayment] decimal NULL,
    [Fromdate] datetime NULL,
    [todate] datetime NULL
);

CREATE TABLE [StoreYearSerial] (
    [Year] int NOT NULL,
    [StoreID] smallint NOT NULL,
    [AdjustmentSerial] int NULL,
    [StoreRevokeSerial] int NULL,
    [GalleriesOrderSerial] int NULL,
    [GalleriesRevokeSerial] int NULL,
    [ClientRequestSerial] int NULL,
    [ClientOrderSerial] int NULL,
    [ClientRevokeSerial] int NULL,
    [ClientPaymentSerial] int NULL,
    [ClientRevokePayment] int NULL,
    [ClientAdjustmentSerial] int NULL,
    [PurchaseOrderSerial] int NULL,
    [SupplierInvoiceSerial] int NULL,
    [SupplierRevokeSerial] int NULL,
    [ExchangeProductsSerial] int NULL,
    [RequestProductSerial] int NULL,
    [TransferSerial] int NULL,
    [SpoiledProductsSerial] int NULL,
    [OpeningBalanceSerial] int NULL,
    [ProductTransferSerial] int NULL,
    CONSTRAINT [PK_StoreYearSerial] PRIMARY KEY ([StoreID], [Year])
);

CREATE TABLE [BupaPro] (
    [ID] float NULL,
    [BUPACode] nvarchar(255) NULL,
    [Name ] nvarchar(255) NULL,
    [Left] nvarchar(255) NULL,
    [Right] nvarchar(255) NULL
);

CREATE TABLE [AllGalleryTransactionsDetails] (
    [TransactionDetailsID] int NOT NULL,
    [TransactionMasterID] int NULL,
    [ProductID] int NULL,
    [ExpiryDate] datetime NULL,
    [Incoming] decimal NULL,
    [Outgoing] decimal NULL,
    CONSTRAINT [PK_AllGalleryTransactionsDetails] PRIMARY KEY ([TransactionDetailsID])
);

CREATE TABLE [Supplier] (
    [SupplierID] smallint NOT NULL,
    [SupplierCode] nvarchar(10) NULL,
    [SystemDepartmentID] smallint NULL,
    [Name] nvarchar(50) NOT NULL,
    [Address] nvarchar(50) NULL,
    [FirstPhone] nvarchar(13) NULL,
    [SecondPhone] nvarchar(13) NULL,
    [Email] nvarchar(50) NULL,
    [Fax] nvarchar(13) NULL,
    [Country] nvarchar(25) NULL,
    [Discount] float NULL,
    [Mobile] nvarchar(13) NULL,
    [intCurrencyID] tinyint NULL,
    [ContactPerson] nvarchar(200) NULL,
    [Active] tinyint NULL,
    [dtCreateDate] datetime NULL,
    [sinCreateUserID] smallint NULL,
    [dtUpdateDate] datetime NULL,
    [sinUpdateUserID] smallint NULL,
    [AccountNo] nvarchar(200) NULL,
    [BeginningBalance] decimal NULL,
    CONSTRAINT [PK_Supplier] PRIMARY KEY ([SupplierID])
);

CREATE TABLE [AllGalleryTransactionsMaster] (
    [TransactionMasterID] int NOT NULL,
    [DepID] smallint NULL,
    [TransactionTypeID] smallint NULL,
    [TransactionID] int NULL,
    [SerialNo] nvarchar(20) NULL,
    [OrderDate] datetime NULL,
    [FinishDate] datetime NULL,
    [FromToPlaceID] smallint NULL,
    [FromToPlaceType] smallint NULL,
    [OrderToID] int NULL,
    [ReceiveReceipt] smallint NULL,
    [Move] varchar(5) NULL,
    [TotalIncoming] decimal NULL,
    [TotalOutgoing] decimal NULL,
    [Status] smallint NULL,
    CONSTRAINT [PK_AllGalleryTransactionsMaster] PRIMARY KEY ([TransactionMasterID])
);

CREATE TABLE [SupplierAccount] (
    [SupplierID] int NOT NULL,
    [StoreID] int NOT NULL,
    [AccountNo] nvarchar(50) NULL,
    CONSTRAINT [PK_SupplierAccount] PRIMARY KEY ([StoreID], [SupplierID])
);

CREATE TABLE [GalleryProduct2] (
    [ProductID] int NOT NULL,
    [GalleryID] smallint NOT NULL,
    [ExpiryDate] datetime NOT NULL,
    [Quantity] decimal NOT NULL,
    [Freeze] decimal NOT NULL,
    [Pending] decimal NOT NULL,
    [GallerySaleDateFrom] smalldatetime NULL,
    [GallerySaleDateTo] smalldatetime NULL,
    [GalleryDiscount] decimal NULL,
    [GallerySaleDiscount] decimal NULL,
    [RetailPrice] decimal NULL,
    [WhalePrice] decimal NULL,
    [CostPrice] decimal NULL,
    [EvaluationPrice] decimal NULL
);

CREATE TABLE [AllGalleryTransactionsMaster2] (
    [TransactionMasterID] int NOT NULL,
    [DepID] smallint NULL,
    [TransactionTypeID] smallint NULL,
    [TransactionID] int NULL,
    [SerialNo] nvarchar(20) NULL,
    [OrderDate] datetime NULL,
    [FinishDate] datetime NULL,
    [FromToPlaceID] smallint NULL,
    [FromToPlaceType] smallint NULL,
    [OrderToID] int NULL,
    [ReceiveReceipt] smallint NULL,
    [Move] varchar(5) NULL,
    [TotalIncoming] decimal NULL,
    [TotalOutgoing] decimal NULL,
    [Status] smallint NULL
);

CREATE TABLE [CancelledSerial] (
    [CancelSerialID] int NOT NULL,
    [TransactionType] int NULL,
    [Type] bit NULL,
    [ID] smallint NULL,
    [Year] smallint NULL,
    [Serial] int NULL,
    CONSTRAINT [PK_CancelledSerial] PRIMARY KEY ([CancelSerialID])
);

CREATE TABLE [AllGalleryTransactionsDetails2] (
    [TransactionDetailsID] int NOT NULL,
    [TransactionMasterID] int NULL,
    [ProductID] int NULL,
    [ExpiryDate] datetime NULL,
    [Incoming] decimal NULL,
    [Outgoing] decimal NULL
);

CREATE TABLE [SystemDepartment] (
    [SystemDepartmentID] tinyint NOT NULL,
    [Name] nvarchar(50) NOT NULL,
    [Admin] bit NULL,
    CONSTRAINT [PK_SystemDepartment] PRIMARY KEY ([SystemDepartmentID])
);

CREATE TABLE [ClientAdjustment] (
    [ClientAdjustmentID] int NOT NULL,
    [ClientID] smallint NOT NULL,
    [Amount] float NOT NULL,
    [AdjustmentType] tinyint NOT NULL,
    [AdjustmentDate] smalldatetime NOT NULL,
    [Comment] nvarchar(200) NULL,
    [Trans_Year] int NULL,
    [Serial] int NULL,
    [StoreID] int NULL,
    [Posted] bit NULL,
    [ClientBalance] decimal NULL,
    CONSTRAINT [PK_ClientAdjustment] PRIMARY KEY ([ClientAdjustmentID])
);

CREATE TABLE [AllStoreTransactionsMaster2] (
    [TransactionMasterID] int NOT NULL,
    [DepID] smallint NULL,
    [TransactionTypeID] smallint NULL,
    [TransactionID] int NULL,
    [SerialNo] nvarchar(20) NULL,
    [OrderDate] datetime NULL,
    [FinishDate] datetime NULL,
    [FromToPlaceID] smallint NULL,
    [FromToPlaceType] smallint NULL,
    [OrderToID] int NULL,
    [Move] varchar(5) NULL,
    [SendReceipt] smallint NULL,
    [ReceiveReceipt] smallint NULL,
    [TotalIncoming] decimal NULL,
    [TotalOutgoing] decimal NULL,
    [Status] smallint NULL
);

CREATE TABLE [ClientInvPayments] (
    [StoreID] smallint NOT NULL,
    [ClientID] smallint NOT NULL,
    [PaymentID] int NOT NULL,
    [OrderID] int NOT NULL,
    [Amount] decimal NULL,
    [LinkDate] smalldatetime NULL,
    CONSTRAINT [PK_ClientInvPayments] PRIMARY KEY ([ClientID], [OrderID], [PaymentID], [StoreID])
);

CREATE TABLE [AllStoreTransactionsDetails2] (
    [TransactionDetailsID] int NOT NULL,
    [TransactionMasterID] int NULL,
    [ProductID] int NULL,
    [ExpiryDate] datetime NULL,
    [Incoming] decimal NULL,
    [Outgoing] decimal NULL,
    [Stock] decimal NULL
);


-- إضافة المفاتيح الخارجية (العلاقات)
-- --------------------------------------------

ALTER TABLE [AlertEmployee] ADD CONSTRAINT [FK_AlertEmployee_Alert] FOREIGN KEY ([AlertID]) REFERENCES [Alert]([AlertID]);
ALTER TABLE [AllGalleryTransactionsDetails] ADD CONSTRAINT [FK_AllGalleryTransactionsDetails_AllGalleryTransactionsMaster] FOREIGN KEY ([TransactionMasterID]) REFERENCES [AllGalleryTransactionsMaster]([TransactionMasterID]);
ALTER TABLE [AllStoreTransactionsDetails] ADD CONSTRAINT [FK_AllTransactionsDetails_AllTransactionsMaster] FOREIGN KEY ([TransactionMasterID]) REFERENCES [AllStoreTransactionsMaster]([TransactionMasterID]);
ALTER TABLE [CLientDiscount] ADD CONSTRAINT [FK_CLientDiscount_Client] FOREIGN KEY ([ClientID]) REFERENCES [Client]([ClientID]);
ALTER TABLE [ClientOrder] ADD CONSTRAINT [FK_ClientOrder_Client] FOREIGN KEY ([ClientID]) REFERENCES [Client]([ClientID]);
ALTER TABLE [ClientOrderDetails] ADD CONSTRAINT [FK_ClientOrderDetails_ClientOrder] FOREIGN KEY ([ClientOrderID]) REFERENCES [ClientOrder]([ClientOrderID]);
ALTER TABLE [ClientProduct] ADD CONSTRAINT [FK_ClientProduct_Client] FOREIGN KEY ([ClientID]) REFERENCES [Client]([ClientID]);
ALTER TABLE [ClientProductMove] ADD CONSTRAINT [FK_ClientProductMove_Client] FOREIGN KEY ([ClientID]) REFERENCES [Client]([ClientID]);
ALTER TABLE [ClientProductMove] ADD CONSTRAINT [FK_ClientProductMove_TransactionTypes] FOREIGN KEY ([TransactionTypeID]) REFERENCES [TransactionTypes]([TransactionTypeID]);
ALTER TABLE [ClientRequest] ADD CONSTRAINT [FK_ClientRequest_Client] FOREIGN KEY ([ClientID]) REFERENCES [Client]([ClientID]);
ALTER TABLE [ClientRequestDetails] ADD CONSTRAINT [FK_ClientRequestDetails_ClientRequest] FOREIGN KEY ([ClientRequestID]) REFERENCES [ClientRequest]([ClientRequestID]);
ALTER TABLE [ClientRevoke] ADD CONSTRAINT [FK_ClientRevoke_Client] FOREIGN KEY ([ClientID]) REFERENCES [Client]([ClientID]);
ALTER TABLE [ClientRevokeDetails] ADD CONSTRAINT [FK_ClientRevokeDetails_ClientRevoke] FOREIGN KEY ([ClientRevokeID]) REFERENCES [ClientRevoke]([ClientRevokeID]);
ALTER TABLE [CodeSettingDetail] ADD CONSTRAINT [FK_CodeSettingDetail_CodeSettingMaster] FOREIGN KEY ([CodeSettingMasterID]) REFERENCES [CodeSettingMaster]([TemplateID]);
ALTER TABLE [Customer] ADD CONSTRAINT [FK_Customer_AgeGroup] FOREIGN KEY ([AgeGroupID]) REFERENCES [AgeGroup]([AgeGroupID]);
ALTER TABLE [Customer] ADD CONSTRAINT [FK_Customer_Class] FOREIGN KEY ([ClassID]) REFERENCES [Class]([ClassID]);
ALTER TABLE [Customer] ADD CONSTRAINT [FK_Customer_Country] FOREIGN KEY ([CountryID]) REFERENCES [Country]([CountryID]);
ALTER TABLE [Customer] ADD CONSTRAINT [FK_Customer_Gender] FOREIGN KEY ([GenderID]) REFERENCES [Gender]([GenderID]);
ALTER TABLE [CustomerInvPayments] ADD CONSTRAINT [FK_CustomerInvPayments_PaymentType] FOREIGN KEY ([intType]) REFERENCES [PaymentType]([PaymentTypeID]);
ALTER TABLE [CustomerOrder] ADD CONSTRAINT [FK_CustomerOrder_Gallery] FOREIGN KEY ([GalleryID]) REFERENCES [Gallery]([GalleryID]);
ALTER TABLE [CustomerOrder] ADD CONSTRAINT [FK_CustomerOrder_Customer] FOREIGN KEY ([CustomerID]) REFERENCES [Customer]([CustomerID]);
ALTER TABLE [CustomerOrder] ADD CONSTRAINT [FK_CustomerOrder_CreditCard] FOREIGN KEY ([CreditCardID]) REFERENCES [CreditCard]([CreditCardID]);
ALTER TABLE [CustomerOrderDetails] ADD CONSTRAINT [FK_CustomerOrderDetails_CustomerOrder] FOREIGN KEY ([CustomerOrderID]) REFERENCES [CustomerOrder]([CustomerOrderID]);
ALTER TABLE [CustomerRevoke] ADD CONSTRAINT [FK_CustomerRevoke_Gallery] FOREIGN KEY ([GalleryID]) REFERENCES [Gallery]([GalleryID]);
ALTER TABLE [CustomerRevoke] ADD CONSTRAINT [FK_CustomerRevoke_CustomerOrder] FOREIGN KEY ([CustomerOrderID]) REFERENCES [CustomerOrder]([CustomerOrderID]);
ALTER TABLE [CustomerRevokeDetails] ADD CONSTRAINT [FK_CustomerRevokeDetails_CustomerOrderDetails] FOREIGN KEY ([CustomerOrderDetailsID]) REFERENCES [CustomerOrderDetails]([CustomerOrderDetailsID]);
ALTER TABLE [CustomerRevokeDetails] ADD CONSTRAINT [FK_CustomerRevokeDetails_CustomerRevoke] FOREIGN KEY ([CustomerRevokeID]) REFERENCES [CustomerRevoke]([CustomerRevokeID]);
ALTER TABLE [EmailAlert] ADD CONSTRAINT [FK_EmailAlert_AlertsInfo] FOREIGN KEY ([AlertID]) REFERENCES [Alert]([AlertID]);
ALTER TABLE [EmailAlert] ADD CONSTRAINT [FK_EmailAlert_TransactionTypes] FOREIGN KEY ([TransactionTypeID]) REFERENCES [TransactionTypes]([TransactionTypeID]);
ALTER TABLE [EmailAlertProduct] ADD CONSTRAINT [FK_EmailAlertProduct_EmailAlert] FOREIGN KEY ([EmailAlertID]) REFERENCES [EmailAlert]([EmailAlertID]);
ALTER TABLE [Forms] ADD CONSTRAINT [FK_Forms_Department] FOREIGN KEY ([DepartmentID]) REFERENCES [Department]([DepartmentID]);
ALTER TABLE [Gallery] ADD CONSTRAINT [FK_Gallery_SystemDepartment] FOREIGN KEY ([SystemDepartmentID]) REFERENCES [SystemDepartment]([SystemDepartmentID]);
ALTER TABLE [GalleryAdjustment] ADD CONSTRAINT [FK_Adjustment_Gallery] FOREIGN KEY ([GalleryID]) REFERENCES [Gallery]([GalleryID]);
ALTER TABLE [GalleryAdjustmentDetails] ADD CONSTRAINT [FK_GalleryAdjustmentDetails_GalleryAdjustment] FOREIGN KEY ([GalleryAdjustmentID]) REFERENCES [GalleryAdjustment]([GalleryAdjustmentID]);
ALTER TABLE [GalleryEmployee] ADD CONSTRAINT [FK_GalleryEmployee_Gallery] FOREIGN KEY ([GalleryID]) REFERENCES [Gallery]([GalleryID]);
ALTER TABLE [GalleryProduct] ADD CONSTRAINT [FK_GalleryProduct_Gallery] FOREIGN KEY ([GalleryID]) REFERENCES [Gallery]([GalleryID]);
ALTER TABLE [Groups] ADD CONSTRAINT [FK_Groups_Department] FOREIGN KEY ([DepartmentID]) REFERENCES [Department]([DepartmentID]);
ALTER TABLE [InsuranceDiscount] ADD CONSTRAINT [FK_InsuranceDiscount_InsuranceCompany] FOREIGN KEY ([InsuranceID]) REFERENCES [InsuranceCompany]([InsuranceCompanyID]);
ALTER TABLE [LookupDetails] ADD CONSTRAINT [FK_LookupDetails_LookupMaster] FOREIGN KEY ([MasterType]) REFERENCES [LookupMaster]([ID]);
ALTER TABLE [MainGroups] ADD CONSTRAINT [FK_MainGroups_CodeSettingMaster] FOREIGN KEY ([TemplateID]) REFERENCES [CodeSettingMaster]([TemplateID]);
ALTER TABLE [Product] ADD CONSTRAINT [FK_Product_Category] FOREIGN KEY ([CategoryID]) REFERENCES [Category]([CategoryID]);
ALTER TABLE [Product] ADD CONSTRAINT [FK_Product_Gender] FOREIGN KEY ([GenderID]) REFERENCES [Gender]([GenderID]);
ALTER TABLE [Product] ADD CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY ([ManufacturerID]) REFERENCES [Manufacturer]([ManufacturerID]);
ALTER TABLE [Product] ADD CONSTRAINT [FK_Product_Season] FOREIGN KEY ([SeasonID]) REFERENCES [Season]([SeasonID]);
ALTER TABLE [PurchaseOrderDetails] ADD CONSTRAINT [FK_PurchaseOrderDetails_PurchaseOrder] FOREIGN KEY ([PurchaseOrderID]) REFERENCES [PurchaseOrder]([PurchaseOrderID]);
ALTER TABLE [SpecialOffers] ADD CONSTRAINT [FK_SpecialOffers_SystemDepartment] FOREIGN KEY ([SystemDepartmentID]) REFERENCES [SystemDepartment]([SystemDepartmentID]);
ALTER TABLE [SpecialOffersDetail] ADD CONSTRAINT [FK_SpecialOffersDetail_Category] FOREIGN KEY ([CategoryID]) REFERENCES [Category]([CategoryID]);
ALTER TABLE [SpecialOffersDetail] ADD CONSTRAINT [FK_SpecialOffersDetail_SpecialOffers] FOREIGN KEY ([OfferID]) REFERENCES [SpecialOffers]([OfferID]);
ALTER TABLE [SpoiledProducts] ADD CONSTRAINT [FK_SpoiledProducts_Gallery] FOREIGN KEY ([DeptID]) REFERENCES [Gallery]([GalleryID]);
ALTER TABLE [SpoiledProductsDetails] ADD CONSTRAINT [FK_SpoiledProductsDetails_SpoiledProducts] FOREIGN KEY ([TransactionMasterID]) REFERENCES [SpoiledProducts]([TransactionID]);
ALTER TABLE [SpoiledProductsDetails] ADD CONSTRAINT [FK_SpoiledProductsDetails_Product] FOREIGN KEY ([ProductID]) REFERENCES [Product]([ProductID]);
ALTER TABLE [Store] ADD CONSTRAINT [FK_Store_SystemDepartment] FOREIGN KEY ([SystemDepartmentID]) REFERENCES [SystemDepartment]([SystemDepartmentID]);
ALTER TABLE [StoreAdjustment] ADD CONSTRAINT [FK_StoreAdjustment_Store] FOREIGN KEY ([StoreID]) REFERENCES [Store]([StoreID]);
ALTER TABLE [StoreAdjustmentDetails] ADD CONSTRAINT [FK_StoreAdjustmentDetails_StoreAdjustment] FOREIGN KEY ([StoreAdjustmentID]) REFERENCES [StoreAdjustment]([StoreAdjustmentID]);
ALTER TABLE [StoreAdjustmentDetails] ADD CONSTRAINT [FK_StoreAdjustmentDetails_Product] FOREIGN KEY ([ProductID]) REFERENCES [Product]([ProductID]);
ALTER TABLE [StoreEmployee] ADD CONSTRAINT [FK_StoreEmployee_Store] FOREIGN KEY ([StoreID]) REFERENCES [Store]([StoreID]);
ALTER TABLE [StoreOpenBalanceDetails] ADD CONSTRAINT [FK_StoreOpenBalanceDetails_Product] FOREIGN KEY ([intProductID]) REFERENCES [Product]([ProductID]);
ALTER TABLE [StoreOpenBalanceDetails] ADD CONSTRAINT [FK_StoreOpenBalanceDetails_StoreOpenBalance] FOREIGN KEY ([intBalanceID]) REFERENCES [StoreOpenBalance]([intBalanceID]);
ALTER TABLE [StoreOrder] ADD CONSTRAINT [FK_StoreOrder_Store] FOREIGN KEY ([StoreID]) REFERENCES [Store]([StoreID]);
ALTER TABLE [StoreOrderDetails] ADD CONSTRAINT [FK_StoreOrderDetials_StoreOrder] FOREIGN KEY ([StoreOrderID]) REFERENCES [StoreOrder]([StoreOrderID]);
ALTER TABLE [StoreOrderDetails] ADD CONSTRAINT [FK_StoreOrderDetails_Product] FOREIGN KEY ([ProductID]) REFERENCES [Product]([ProductID]);
ALTER TABLE [StoreProduct] ADD CONSTRAINT [FK_StoreProduct_Store] FOREIGN KEY ([StoreID]) REFERENCES [Store]([StoreID]);
ALTER TABLE [StoreProduct] ADD CONSTRAINT [FK_StoreProduct_Product] FOREIGN KEY ([ProductID]) REFERENCES [Product]([ProductID]);
ALTER TABLE [StoreProductTransferDetails] ADD CONSTRAINT [FK_StoreProductTransferDetails_StoreProductTransfer] FOREIGN KEY ([StoreProductTransferID]) REFERENCES [StoreProductTransfer]([StoreProductTransferID]);
ALTER TABLE [StoreRevoke] ADD CONSTRAINT [FK_StoreRevoke_Store] FOREIGN KEY ([StoreID]) REFERENCES [Store]([StoreID]);
ALTER TABLE [StoreRevokeDetails] ADD CONSTRAINT [FK_StoreRevokeDetails_StoreRevoke] FOREIGN KEY ([StoreRevokeID]) REFERENCES [StoreRevoke]([StoreRevokeID]);
ALTER TABLE [StoreRevokeDetails] ADD CONSTRAINT [FK_StoreRevokeDetails_Product] FOREIGN KEY ([ProductID]) REFERENCES [Product]([ProductID]);
ALTER TABLE [SupplierInvoice] ADD CONSTRAINT [FK_SupplierInvoice_Supplier] FOREIGN KEY ([SupplierID]) REFERENCES [Supplier]([SupplierID]);
ALTER TABLE [SupplierRevoke] ADD CONSTRAINT [FK_SupplierRevoke_Supplier] FOREIGN KEY ([SupplierID]) REFERENCES [Supplier]([SupplierID]);
ALTER TABLE [SupplierRevoke] ADD CONSTRAINT [FK_SupplierRevoke_Store] FOREIGN KEY ([StoreID]) REFERENCES [Store]([StoreID]);
ALTER TABLE [SupplierRevokeDetails] ADD CONSTRAINT [FK_SupplierRevokeDetails_SupplierRevoke] FOREIGN KEY ([SupplierRevokeID]) REFERENCES [SupplierRevoke]([SupplierRevokeID]);
ALTER TABLE [SupplierRevokeDetails] ADD CONSTRAINT [FK_SupplierRevokeDetails_Product] FOREIGN KEY ([ProductID]) REFERENCES [Product]([ProductID]);
ALTER TABLE [TransferDetails] ADD CONSTRAINT [FK_TransferDetails_Transfer] FOREIGN KEY ([TransferID]) REFERENCES [Transfer]([TransferID]);
