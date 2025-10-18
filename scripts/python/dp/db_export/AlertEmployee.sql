CREATE TABLE [AlertEmployee] (
    [AlertID] smallint NOT NULL,
    [EmployeeID] smallint NOT NULL,
    CONSTRAINT [PK_AlertEmployee] PRIMARY KEY ([AlertID], [EmployeeID])
);
