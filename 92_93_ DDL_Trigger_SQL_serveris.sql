-- 92. DDL Trigger SQL serveris

-- DDL triggereid loomiseks s�ntaks
CREATE TRIGGER [Trigger_Name]
ON [Scope(Server/Database)]
FOR [EventType1, EventType2, EventType3]
AS
BEGIN
-- Triggeri keha
END

-- Trigger k�ivitub CREATE_TABLE DDL s�ndmuse korral
CREATE TRIGGER FirstTrigger
ON Database
FOR CREATE_TABLE
AS
BEGIN
PRINT 'Uus tabel on loodud'
END

CREATE TABLE test (id INT)

-- Trigger mitme s�ndmuse korral
ALTER TRIGGER FirstTrigger 
ON Database
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
PRINT 'Tabel on loodud, muudetud v�i kustutatud'
END

-- Tabeli loomise, muutmise v�i kustutamise takistamine
ALTER TRIGGER FirstTrigger 
ON Database
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
ROLLBACK
PRINT 'Tabeli loomine, muutmine v�i kustutamine pole lubatud'
END

-- Triggeri keelamine
DISABLE TRIGGER FirstTrigger ON DATABASE
-- Triggeri kustutamine
DROP TRIGGER FirstTrigger ON DATABASE

-- Trigger sp_rename k�ivitamisel
CREATE TRIGGER RenameTable 
ON Database
FOR RENAME
AS
BEGIN
ROLLBACK
PRINT 'Te tegite �mbernimetuse'
END

-- Tabeli ja veeru �mbernimetamise n�ited
sp_rename 'TestTable', 'NewTestTable' 
sp_rename 'NewTestTable.Id' , 'NewId', 'column'
