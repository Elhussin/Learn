CREATE TABLE [SpecialOffersDetail] (
    [OfferDetailID] int NOT NULL,
    [OfferID] smallint NULL,
    [CategoryID] smallint NULL,
    [NoOfItems] decimal NULL,
    [Price] decimal NULL,
    CONSTRAINT [PK_SpecialOffersDetail] PRIMARY KEY ([OfferDetailID])
);
