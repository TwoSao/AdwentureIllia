use AdventureWorksDW2019
--funktsioonid 32
select * from DimEmployee

-- Tabelisisev‰‰rtusega funktsioon e Inline Table Valued function (ILTVF) koodin‰ide: 
create function fn_ILTVF_GeyEmployess()
returns table
as
return (select EmployeeKey, FirstName, Cast(BirthDate as Date) as DOB from dbo.DimEmployee);


select * from fn_ILTVF_GeyEmployess();

-- ’pilane teeb p‰ringu ja n‰itab koodi kirja ning tulemust pildi kujul.

Create Function fn_MSTVF_GetEmployess()
Returns @Table Table (EmployeeKey int, FirstName nvarchar(20), BrithDate Date) 
as
Begin
Insert into @Table
Select EmployeeKey, FirstName, Cast(BirthDate as DATE)
from DimEmployee
return
end

Select * from fn_MSTVF_GetEmployess()
--funktsioonid 33

--’pilane teeb p‰ringu ja n‰itab koodi kirja ning tulemust pildi kujul.
CREATE FUNCTION fn_GetEmployeeNameById (@ID INT)
RETURNS NVARCHAR(20)
AS
BEGIN
    RETURN (SELECT FirstName FROM DimEmployee WHERE EmployeeKey = @ID);
END;

-- ’pilane teeb p‰ringu ja n‰itab koodi kirja ning tulemust pildi kujul.
EXEC sp_helptext 'fn_GetEmployeeNameById';
SELECT dbo.fn_GetEmployeeNameById(1) AS EmployeeName;


--’pilane teeb p‰ringu ja n‰itab koodi kirja ning tulemust pildi kujul.
Alter Function fn_GetEmployeeNameById(@ID int)
Returns nvarchar(20)
with Encryption
as
begin
return (Select FirstName from DimEmployee where EmployeeKey=@ID)
end


-- ’pilane teeb p‰ringu ja n‰itab koodi kirja ning tulemust pildi kujul.
Alter function fn_GetEmployeeNameById( @ID int)
returns nvarchar(20)
With SchemaBinding
as
begin
Return(Select FirstName from dbo.DimEmployee Where EmployeeKey=@ID)
end

