-- 34.Ajutised tabelid

-- �pilane teeb p�ringu ja n�itab koodi kirja ning tulemust pildi kujul.
Create Table #PersonDetails(Id int, Name nvarchar(20))

Insert into #PersonDetails values(1, 'Mike')

Insert into #PersonDetails values(2, 'Ema')
Insert into #PersonDetails values(3, 'Todd')

-- �pilane teeb p�ringu ja n�itab koodi kirja ning tulemust pildi kujul.
Select * from #PersonDetails

-- �pilane teeb p�ringu ja n�itab koodi kirja ning tulemust pildi kujul.
SELECT name
FROM tempdb.sys.objects
WHERE name LIKE '#PersonDetails%';

-- �pilane teeb p�ringu ja n�itab koodi kirja ning tulemust pildi kujul.

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

-- �pilane teeb p�ringu ja n�itab koodi kirja ning tulemust pildi kujul.
Create Table ##EmployeeDetails(Id int, Name nvarchar(20))
-- Globaalsed ajutised tabelid on n�htavad k�ikidele �hendustele serveris ja h�vitatakse, kui viimane �hendus on kinni pandud.

