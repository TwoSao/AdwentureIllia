-- Loome tabelile DimEmployee klastreeritud indeksi veeru FirstName põhjal
Create Clustered Index IX_DimEmployee_Name
on DimEmployee(FirstName)

-- Kustutame tabeli DimEmployee olemasoleva primaarvõtme indeksi PK_DimEmployee_EmployeeKey
Drop index DimEmployee.PK_DimEmployee_EmployeeKey

-- Loome tabelile DimEmployee klastreeritud ühendindeksi kahte veergu (Gender ja Salary) põhinevalt
Create Clustered Index IX_DimEmployee_Gender_Salary
ON DimEmployee(Gender DESC, Salary ASC)

-- Loome tabelile DimEmployee mitte-klastreeritud indeksi veeru FirstName põhjal
Create NonClustered Index IX_DimEmployee_Name
On DimEmployee(FirstName)




-- Klastreeritud indeks:
-- Määrab tabelis andmete füüsilise järjestuse.
-- Tabelil võib olla ainult üks klastreeritud indeks.
-- Klastreeritud indeks muudab andmete salvestusjärjestust kettal.
-- Näiteks primaarvõti loob automaatselt klastreeritud indeksi, kui see pole teisiti määratud.

-- Mitte-klastreeritud indeks:
-- Indeks on salvestatud eraldi tabeli andmetest.
-- Võib olla mitu mitte-klastreeritud indeksit ühel tabelil.
-- Mitte-klastreeritud indeks sisaldab näitajaid (pointereid) tegelike andmete asukohtadele.
-- Ei mõjuta andmete füüsilist järjestust tabelis.
