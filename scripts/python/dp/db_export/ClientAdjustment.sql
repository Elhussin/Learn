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
