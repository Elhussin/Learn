CREATE TABLE [EmailAlert] (
    [EmailAlertID] int NOT NULL,
    [EmailDate] smalldatetime NOT NULL,
    [AlertID] smallint NOT NULL,
    [GalleryID] smallint NULL,
    [TransactionTypeID] smallint NULL,
    [TransactionID] int NULL,
    CONSTRAINT [PK_EmailAlert] PRIMARY KEY ([EmailAlertID])
);
