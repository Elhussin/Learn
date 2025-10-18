CREATE TABLE [GalleryAdjustmentDetails] (
    [GalleryAdjustmentDetailsID] int NOT NULL,
    [GalleryAdjustmentID] int NOT NULL,
    [ProductID] int NOT NULL,
    [ExpiryDate] datetime NULL,
    [Quantity] decimal NULL,
    [AdjustmentType] varchar(50) NULL,
    CONSTRAINT [PK_GalleryAdjustmentDetails] PRIMARY KEY ([GalleryAdjustmentDetailsID])
);
