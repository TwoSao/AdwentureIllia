-- Loome tabelile DimEmployee klastreeritud indeksi veeru FirstName p�hjal
Create Clustered Index IX_DimEmployee_Name
on DimEmployee(FirstName)

-- Kustutame tabeli DimEmployee olemasoleva primaarv�tme indeksi PK_DimEmployee_EmployeeKey
Drop index DimEmployee.PK_DimEmployee_EmployeeKey

-- Loome tabelile DimEmployee klastreeritud �hendindeksi kahte veergu (Gender ja Salary) p�hinevalt
Create Clustered Index IX_DimEmployee_Gender_Salary
ON DimEmployee(Gender DESC, Salary ASC)

-- Loome tabelile DimEmployee mitte-klastreeritud indeksi veeru FirstName p�hjal
Create NonClustered Index IX_DimEmployee_Name
On DimEmployee(FirstName)




-- Klastreeritud indeks:
-- M��rab tabelis andmete f��silise j�rjestuse.
-- Tabelil v�ib olla ainult �ks klastreeritud indeks.
-- Klastreeritud indeks muudab andmete salvestusj�rjestust kettal.
-- N�iteks primaarv�ti loob automaatselt klastreeritud indeksi, kui see pole teisiti m��ratud.

-- Mitte-klastreeritud indeks:
-- Indeks on salvestatud eraldi tabeli andmetest.
-- V�ib olla mitu mitte-klastreeritud indeksit �hel tabelil.
-- Mitte-klastreeritud indeks sisaldab n�itajaid (pointereid) tegelike andmete asukohtadele.
-- Ei m�juta andmete f��silist j�rjestust tabelis.
