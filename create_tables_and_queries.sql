
CREATE TABLE Containers (
    ID UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    Number INT NOT NULL,
    Type NVARCHAR(50) NOT NULL,
    Length INT NOT NULL,
    Width INT NOT NULL,
    Height INT NOT NULL,
    Weight INT NOT NULL,
    IsEmpty BIT NOT NULL,
    DateReceived DATETIME NOT NULL
);


CREATE TABLE Operations (
    ID UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    ContainerID UNIQUEIDENTIFIER NOT NULL FOREIGN KEY REFERENCES Containers(ID),
    StartDate DATETIME NOT NULL,
    EndDate DATETIME NOT NULL,
    OperationType NVARCHAR(50) NOT NULL,
    OperatorName NVARCHAR(100) NOT NULL,
    InspectionLocation NVARCHAR(100) NOT NULL
);

SELECT
    '{' +
    '"ID": "' + CAST(ID AS NVARCHAR(36)) + '", ' +
    '"Number": ' + CAST(Number AS NVARCHAR(50)) + ', ' +
    '"Type": "' + Type + '", ' +
    '"Length": ' + CAST(Length AS NVARCHAR(50)) + ', ' +
    '"Width": ' + CAST(Width AS NVARCHAR(50)) + ', ' +
    '"Height": ' + CAST(Height AS NVARCHAR(50)) + ', ' +
    '"Weight": ' + CAST(Weight AS NVARCHAR(50)) + ', ' +
    '"IsEmpty": ' + CAST(IsEmpty AS NVARCHAR(1)) + ', ' +
    '"DateReceived": "' + CONVERT(VARCHAR, DateReceived, 126) + '"' +
    '}' AS ContainerJSON
FROM Containers;
