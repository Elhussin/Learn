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
