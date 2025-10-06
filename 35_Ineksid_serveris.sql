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



-- 37. Unikaalne ja mitte-unikaalne indeks

-- Kuvame olemasolevad indeksid tabelis DimEmployee
EXECUTE sp_helpindex 'DimEmployee';

-- Lisame esimese kirje tabelisse DimEmployee
INSERT INTO DimEmployee(EmployeeKey, FirstName, LastName, Salary, Gender)
VALUES(1, 'Mike', 'Sandoz', 4500, 'M');

-- Lisame kaks kirjet tabelisse tblEmployee, kus Id v��rtus on sama (1)
-- See tekitab vea, kui Id on primaarv�ti ja unikaalne
INSERT INTO tblEmployee VALUES(1,'Mike', 'Sandoz',4500,'M');
INSERT INTO tblEmployee VALUES(1,'John', 'Menco',2500,'M');

-- Kuvame k�ik read tabelist DimEmployee
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
-- See valik lubab sisestada dubleeruvaid v��rtusi, mis j�etakse ignoreeritud
CREATE UNIQUE INDEX IX_tblEmployee_City
ON DimEmployee(City)
WITH IGNORE_DUP_KEY;
