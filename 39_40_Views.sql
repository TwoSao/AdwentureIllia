-- 39. View SQL Serveris

-- Kuvame k�ik andmed tabelist DimEmployee (baastabel, mille andmeid kasutame)
SELECT * FROM DimEmployee


-- Loome view, mis kuvab t��tajate p�hiandmed koos osakonna nimega
-- See lihtsustab keerukate p�ringute kasutamist mitte-IT kasutajatele
CREATE VIEW vWEmployeesByDepartment
AS
SELECT EmployeeKey, FirstName, Salary, Gender, DepartmentName
FROM DimEmployee


-- Kuvame andmed l�bi loodud view
SELECT * FROM vWEmployeesByDepartment


-- Loome view, mis kuvab ainult IT osakonna t��tajad
-- N�ide reataseme turvalisusest (row-level security)
CREATE VIEW vWITDepartment_Employees
AS
SELECT EmployeeKey, FirstName, Salary, Gender, DepartmentName
FROM DimEmployee
WHERE DimEmployee.DepartmentName = 'IT'


-- Loome view, mis ei n�ita palgainfot (Salary)
-- N�ide veerutaseme turvalisusest (column-level security)
CREATE VIEW vWEmployeesNonConfidentialData
AS
SELECT EmployeeKey, FirstName, Gender, DepartmentName
FROM DimEmployee


-- Loome view, mis tagastab koondandmed � t��tajate arvu osakonna kaupa
-- N�ide view kasutamisest kokkuv�tlike andmete kuvamiseks
CREATE VIEW vWEmployeesCountByDepartment
AS
SELECT DepartmentName, COUNT(EmployeeKey) AS TotalEmployees
FROM DimEmployee
GROUP BY DepartmentName

-- 40. View uuendused (vaadete uuendamine)

-- Loome view, mis ei sisalda palgainfot (Salary veergu)
-- Seda vaadet saame kasutada, kui soovime kuvada ainult mitte-konfidentsiaalseid andmeid
CREATE VIEW vWEmployeesDataExceptSalary
AS
SELECT EmployeeKey, FirstName, Gender, DepartmentName
FROM DimEmployee


-- Kuvame loodud view andmed
SELECT * FROM vWEmployeesDataExceptSalary


-- Uuendame andmeid l�bi view
-- Siin muudame t��taja nime (EmployeeKey = 2) v��rtuseks 'Mikey'
UPDATE vWEmployeesDataExceptSalary
SET FirstName = 'Mikey'
WHERE EmployeeKey = 2


-- Loome teise view, mis sisaldab ka Salary veergu
-- Selle kaudu saame muuta osakonna nime konkreetse t��taja puhul
CREATE VIEW vwEmployeeDetalisByDepartment
AS
SELECT EmployeeKey, FirstName, Salary, Gender, DepartmentName
FROM DimEmployee


-- Uuendame andmeid l�bi teise view
-- Muudame t��taja 'John' osakonna nimeks 'IT'
UPDATE vwEmployeeDetalisByDepartment
SET DepartmentName = 'IT'
WHERE FirstName = 'John'
