CREATE TABLE [Alert] (
    [AlertID] smallint NOT NULL,
    [AlertName] nvarchar(50) NOT NULL,
    [AlertType] varchar(50) NOT NULL,
    [AlertBody] nvarchar(400) NOT NULL,
    CONSTRAINT [PK_Alert] PRIMARY KEY ([AlertID])
);
