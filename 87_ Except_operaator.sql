-- 87. Except operaator
-- Loome tabeli TableA
Create Table TableA
(
    id int primary key,
    Name nvarchar(50),
    Gender nvarchar(10)
)
Go

-- Lisame andmed TableA tabelisse
Insert into TableA values (1, 'Mark', 'Male')
Insert into TableA values (2, 'Mary', 'Female')
Insert into TableA values (3, 'Steve', 'Male')
Insert into TableA values (4, 'John', 'Male')
Insert into TableA values (5, 'Sara', 'Female')
Go

-- Loome tabeli TableB
Create Table TableB
(
    id int primary key,
    Name nvarchar(50),
    Gender nvarchar(10)
)
Go

-- Lisame andmed TableB tabelisse
Insert into TableB values (4, 'John', 'Male')
Insert into TableB values (5, 'Sara', 'Female')
Insert into TableB values (6, 'Pam', 'Female')
Insert into TableB values (7, 'Rebeka', 'Female')
Insert into TableB values (8, 'Jordan', 'Male')
Go

-- Tagastab read, mis on TableA-s, kuid mitte TableB-s
Select Id, Name, Gender  
From TableA  
Except  
Select Id, Name, Gender  
From TableB


-- N�ide DimEmployee tabeliga:
-- Tagastab t��tajad, kelle palk on 50 000 kuni 59 999
Select EmployeeKey, FirstName, Gender, Salary  
From DimEmployee  
Where Salary >= 50000  
Except  
Select EmployeeKey, FirstName, Gender, Salary  
From DimEmployee  
Where Salary >= 60000  
Order By FirstName


-- 88. Erinevus EXCEPT ja NOT IN operaatoril

-- Tagastab read, mis on TableA-s, kuid mitte TableB-s
select Id, Name, Gender 
from TableA
except
select Id, Name, Gender 
from TableB


-- Sama tulemus NOT IN operaatoriga
select Id, Name, Gender 
from TableA
where id NOT IN (select id from TableB)


-- See p�ring tekitab vea, sest alam-p�ringus on mitu veergu
select Id, Name, Gender 
from TableA
where id NOT IN (select id, Name from TableB)


/*
Kokkuv�te:
- EXCEPT tagastab unikaalsed read vasakust p�ringust, mida ei ole paremas p�ringus.
- NOT IN tagastab read vasakust tabelist, mille v��rtusi ei leita alamp�ringu tulemustest.
- EXCEPT eemaldab duplikaadid ja n�uab sama arvu ning t��pi veerge m�lemas p�ringus.
- NOT IN t��tab ainult �he veeruga ja ei eemalda duplikaate.
*/
