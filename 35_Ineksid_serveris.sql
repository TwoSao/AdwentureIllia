-- Lisame tabelile DimEmployee uue veeru Salary t��pi int
alter table DimEmployee
ADD Salary int

-- Valime k�ik t��tajad, kelle palk on suurem kui 5000 ja v�iksem kui 7000
Select * from DimEmployee
where Salary > 5000 and Salary < 7000

-- Loome indeksit veerule Salary, et p�ringud selle veeru j�rgi kiiremaks muuta
Create Index IX_tblEmployee_Salary
ON DimEmployee (Salary asc)

-- Kuvame DimEmployee objekti teksti (nt vaadata objekti definitsiooni)
execute sp_helptext DimEmployee

-- Kustutame indeks IX_tblEmployee_Salary tabelist DimEmployee
Drop Index DimEmployee.IX_tblEmployee_Salary
