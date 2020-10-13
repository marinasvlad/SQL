--1. Sa se afiseze numele de familie al angajatilor nascuti intre 1980 si 1990

select LastName
from Employee_IMA
where BirthDate BETWEEN TO_DATE('1980-01-01','YYYY-MM-DD') AND TO_DATE('1990-01-01','YYYY-MM-DD');

--2. Sa se afiseze numele de familie al angajatului care locuieste pe Strada Frunezi

select LastName
from Employee_IMA
where Street like '%Frunzei%';

--3. Sa se afiseze initialele angajatilor care lucreaza la proiectul Sporire eficienta

select WorksOn_IMA.EmployeeID,WorksOn_IMA.ProjectID, Employee_IMA.Initials,Project_IMA.name
from WorksOn_IMA
INNER JOIN employee_ima on WorksOn_IMA.EmployeeID = Employee_IMA.EmployeeID
INNER JOIN Project_ima on WorksOn_IMA.ProjectID = Project_IMA.ProjectID
where Project_IMA.name like '%Sporire%';

--4. Sa se afiseze numele angajatilor si orasele lor

select Employee_IMA.PostalCode, Employee_IMA.LastName, PostalCode_IMA.City
from Employee_IMA
LEFT JOIN PostalCode_IMA on Employee_IMA.PostalCode = PostalCode_IMA.PostalCodeID;

--5. Sa se afiseze 2 cate 2 angajati in functie de departament

SELECT A.LastName AS Employee1,B.LastName AS Employee2, A.DepartmentID
FROM Employee_IMA A, Employee_IMA B
WHERE A.LastName <> B.LastName
AND A.DepartmentID = B.DepartmentID
ORDER BY A.DepartmentID;

--6. Sa se afiseze id ul locatiei departamentului Vanzari folosind INTERSECT

SELECT LocationID
FROM Location_IMA
INTERSECT
SELECT LocationID
FROM Department_IMA
Where Name like '%Vanzari%';

--7. Sa se afiseze numele angajatilor cu mai mult de 600 de ore lucrate la proiectul Noua Strategie

select Employee_Ima.LastName,WorksOn_IMA.Hours
from WorksOn_IMA
INNER JOIN employee_ima on WorksOn_IMA.EmployeeID = Employee_IMA.EmployeeID
INNER JOIN Project_ima on WorksOn_IMA.ProjectID = Project_IMA.ProjectID
where Project_IMA.name like '%Noua%' and WorksOn_IMA.Hours > 600;

--8. Sa se afiseze cati angajati se afla in fiecare oras in ordine descrescatoare

select count(EmployeeID),PostalCode_IMA.City
from Employee_IMA
JOIN PostalCode_IMA on Employee_IMA.PostalCode = PostalCode_IMA.PostalCodeID
Group by PostalCode_IMA.City
Order BY Count(EmployeeID) DESC;

--9. Sa se afiseze numarul mediu de ore muncite la proiectul 'Innoire aparate'

select AVG(Hours)
from WorksOn_IMA
JOIN Project_IMA ON WorksOn_IMA.ProjectID = project_ima.projectid
where project_ima.name like '%aparate%';

--10. Sa se afiseze locatiile departamentelor in care lucreaza femei

select Gender, Department_IMA.DepartmentID, Location_IMA.Name
from Employee_IMA
JOIN Department_IMA ON Employee_IMA.DepartmentID = Department_IMA.DepartmentID
JOIN Location_IMA ON Department_IMA.LocationID = Location_IMA.LocationID
where Gender = 'F';

--11. Sa se afiseze orasul angajatilor al carui prenume incepe cu litera A

select PostalCode_IMA.City
from Employee_IMA
JOIN PostalCode_IMA ON Employee_IMA.PostalCode = PostalCode_IMA.PostalCodeID
where FirstName like 'A%';

--12. Sa se afiseze numele locatiei unde lucreaza cel putin 3 angajati

select Count(Employee_IMA.EmployeeID),Location_IMA.Name
from Employee_IMA
JOIN Department_IMA ON Employee_IMA.DepartmentID = Department_IMA.DepartmentID
JOIN Location_IMA ON Department_IMA.LocationID = Location_IMA.LocationID
GROUP BY Location_IMA.Name
HAVING COUNT(Employee_IMA.EmployeeID) >= 3;

--13. Sa se afiseze numarul lucrat in total pentru fiecare departament

select SUM(Hours),Employee_IMA.DepartmentID
from WorksON_IMA
JOIN Employee_IMA ON WorksOn_IMA.EmployeeID = Employee_IMA.EmployeeID
GROUP BY Employee_IMA.DepartmentID
ORDER BY SUM(Hours) DESC;

--14. Sa se afiseze adresa si numele departamentului in cadrul caruia se desfasoara proiectul Optimizare

select Department_IMA.Name, Location_IMA.Name
from Project_IMA
JOIN Department_IMA on Project_IMA.DepartmentID = Department_IMA.DepartmentID
JOIN Location_IMA on Department_IMA.LocationID = Location_IMA.LocationID
WHERE Project_IMA.Name like '%Optimizare%';

--15. Sa se afiseze prenumele, initialele,numele de familie si strada strada unde locuiesc angajatii care lucreaza in departamentul aflat in Craiova

select FirstName, Initials, LastName, Street
from Employee_IMA
JOIN Department_IMA on Employee_IMA.DepartmentID = Department_IMA.DepartmentID
JOIN Location_IMA on Department_IMA.LocationID = Location_IMA.LocationID
WHERE Location_IMA.Name like '%Craiova%';