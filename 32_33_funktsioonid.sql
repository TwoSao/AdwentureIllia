--funktsioonid
select * from DimEmployee

-- Tabelisisev‰‰rtusega funktsioon e Inline Table Valued function (ILTVF) koodin‰ide: 
create function fn_ILTVF_GeyEmployess()
returns table
as
return (select EmployeeKey, FirstName, Cast(BirthDate as Date) as DOB from dbo.DimEmployee);


select * from fn_ILTVF_GeyEmployess();

