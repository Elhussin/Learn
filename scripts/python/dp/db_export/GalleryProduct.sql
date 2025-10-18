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
