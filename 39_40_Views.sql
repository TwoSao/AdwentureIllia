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
