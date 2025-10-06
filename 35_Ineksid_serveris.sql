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



-- 37. Unikaalne ja mitte-unikaalne indeks

-- Kuvame olemasolevad indeksid tabelis DimEmployee
EXECUTE sp_helpindex 'DimEmployee';

-- Lisame esimese kirje tabelisse DimEmployee
INSERT INTO DimEmployee(EmployeeKey, FirstName, LastName, Salary, Gender)
VALUES(1, 'Mike', 'Sandoz', 4500, 'M');

-- Lisame kaks kirjet tabelisse tblEmployee, kus Id väärtus on sama (1)
-- See tekitab vea, kui Id on primaarvõti ja unikaalne
INSERT INTO tblEmployee VALUES(1,'Mike', 'Sandoz',4500,'M');
INSERT INTO tblEmployee VALUES(1,'John', 'Menco',2500,'M');

-- Kuvame kõik read tabelist DimEmployee
SELECT * FROM DimEmployee;

-- Loome unikaalse mitte-klastreeritud indeksi veergudele FirstName ja LastName
-- See keelab sama ees- ja perekonnanimega dubleeritud kirjed
CREATE UNIQUE NONCLUSTERED INDEX UIX_DimEmployee_FirstName_LastName
ON DimEmployee(FirstName, LastName);

-- Lisame tabelile DimEmployee veeru City
ALTER TABLE DimEmployee 
ADD City VARCHAR(50);

-- Lisame veerule City unikaalse piirangu (constraint)
-- Selleks luuakse taga unikaalne mitte-klastreeritud indeks
ALTER TABLE DimEmployee 
ADD CONSTRAINT UQ_tblEmployee_City 
UNIQUE NONCLUSTERED (City);

-- Loome unikaalse indeksi veerule City koos IGNORE_DUP_KEY valikuga
-- See valik lubab sisestada dubleeruvaid väärtusi, mis jäetakse ignoreeritud
CREATE UNIQUE INDEX IX_tblEmployee_City
ON DimEmployee(City)
WITH IGNORE_DUP_KEY;
