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
