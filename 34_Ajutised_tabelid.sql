-- 34.Ajutised tabelid

-- Õpilane teeb päringu ja näitab koodi kirja ning tulemust pildi kujul.
Create Table #PersonDetails(Id int, Name nvarchar(20))

Insert into #PersonDetails values(1, 'Mike')

Insert into #PersonDetails values(2, 'Ema')
Insert into #PersonDetails values(3, 'Todd')

-- Õpilane teeb päringu ja näitab koodi kirja ning tulemust pildi kujul.
Select * from #PersonDetails

-- Õpilane teeb päringu ja näitab koodi kirja ning tulemust pildi kujul.
SELECT name
FROM tempdb.sys.objects
WHERE name LIKE '#PersonDetails%';

-- Õpilane teeb päringu ja näitab koodi kirja ning tulemust pildi kujul.

Create Procedure spCreateLocalTempTable
as
Begin
Create Table #PersonDetails(
Id int,
Name nvarchar(20)
)
Insert into #PersonDetails values(1, 'Mike')
Insert into #PersonDetails values(2, 'Ema')
Insert into #PersonDetails values(3, 'Todd')

select * from #PersonDetails
End

-- Õpilane teeb päringu ja näitab koodi kirja ning tulemust pildi kujul.
Create Table ##EmployeeDetails(Id int, Name nvarchar(20))
-- Globaalsed ajutised tabelid on nähtavad kõikidele ühendustele serveris ja hävitatakse, kui viimane ühendus on kinni pandud.

