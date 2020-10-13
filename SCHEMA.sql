CREATE TABLE Location_IMA(
LocationID int NOT NULL PRIMARY KEY,
Name varchar(255)
);



CREATE TABLE PostalCode_IMA(
PostalCodeID varchar(20) NOT NULL PRIMARY KEY,
City varchar(255)
);



CREATE TABLE Employee_IMA(
    EmployeeID int NOT NULL PRIMARY KEY,
    FirstName varchar(255) NULL,
    Initials varchar(255) NULL,
    LastName varchar(255) NULL,
    Street varchar(255) NULL,
    PostalCode varchar(20) NULL,
    Gender varchar(1) NOT NULL,
    BirthDate DATE NOT NULL,
    DepartmentID int NULL
    );
    

    

    
CREATE TABLE Department_IMA(
    DepartmentID int NOT NULL PRIMARY KEY,
    Name varchar(255),
    EmployeeID int NULL,
    LocationID int NULL
    );


    
CREATE TABLE Project_IMA(
    ProjectID int NOT NULL PRIMARY KEY,
    Name varchar(255),
    DepartmentID int NULL
    );
    



CREATE TABLE WorksON_IMA(
    EmployeeID int NOT NULL,
    ProjectID int NOT NULL,
    Hours float NULL,
    CONSTRAINT PK_WorksOn Primary KEY (EmployeeID, ProjectID)
    );


ALTER TABLE Employee_IMA
ADD CONSTRAINT FK_POSTALCODE
FOREIGN KEY(PostalCode) References PostalCode_IMA(PostalCodeID);


ALTER TABLE Employee_IMA
ADD CONSTRAINT FK_DEPARTMENT
FOREIGN KEY(DepartmentID) References Department_IMA(DepartmentID);

ALTER TABLE Department_IMA
ADD CONSTRAINT FK_LOCATION
FOREIGN KEY(LocationID) References Location_IMA(LocationID);


ALTER TABLE Project_IMA
ADD CONSTRAINT FK_DEPARTMENT_P
FOREIGN KEY(DepartmentID) References Department_IMA(DepartmentID);



ALTER TABLE WorksON_IMA
ADD CONSTRAINT FK_EMPLOYEE_W
FOREIGN KEY(EmployeeID) References Employee_IMA(EmployeeID);

ALTER TABLE WorksON_IMA
ADD CONSTRAINT FK_PROJECT_W
FOREIGN KEY(ProjectID) References Project_IMA(ProjectID);



INSERT INTO PostalCode_IMA(PostalCodeId, City)
VALUES ('19543', 'Bucuresti');
INSERT INTO PostalCode_IMA(PostalCodeId, City)
VALUES ('19201', 'Bucuresti');
INSERT INTO PostalCode_IMA(PostalCodeId, City)
VALUES ('19492', 'Bucuresti');
INSERT INTO PostalCode_IMA(PostalCodeId, City)
VALUES ('19211', 'Bucuresti');
INSERT INTO PostalCode_IMA(PostalCodeId, City)
VALUES ('10741', 'Craiova');
INSERT INTO PostalCode_IMA(PostalCodeId, City)
VALUES ('10402', 'Craiova');
INSERT INTO PostalCode_IMA(PostalCodeId, City)
VALUES ('15321', 'Oradea');
INSERT INTO PostalCode_IMA(PostalCodeId, City)
VALUES ('15715', 'Oradea');
INSERT INTO PostalCode_IMA(PostalCodeId, City)
VALUES ('17566', 'Constanta');
INSERT INTO PostalCode_IMA(PostalCodeId, City)
VALUES ('17233', 'Constanta');
INSERT INTO PostalCode_IMA(PostalCodeId, City)
VALUES ('12454', 'Cluj');
INSERT INTO PostalCode_IMA(PostalCodeId, City)
VALUES ('12813', 'Cluj');


INSERT INTO Location_IMA(LocationId, Name)
VALUES ('1', 'Bulevardul Iuliu Maniu, Bucuresti');
INSERT INTO Location_IMA(LocationId, Name)
VALUES ('2', 'Calea Severin, Craiova');
INSERT INTO Location_IMA(LocationId, Name)
VALUES ('3', 'Strada Cuza Voda, Oradea');
INSERT INTO Location_IMA(LocationId, Name)
VALUES ('4', 'Strada Lucian Blaga, Constanta');
INSERT INTO Location_IMA(LocationId, Name)
VALUES ('5', 'Calea Aurel Suciu, Cluj');


INSERT INTO Department_IMA(DepartmentId, Name, LocationID)
VALUES (1, 'Vanzari', 1);
INSERT INTO Department_IMA(DepartmentId, Name, LocationID)
VALUES (2, 'Suport', 1);
INSERT INTO Department_IMA(DepartmentId, Name, LocationID)
VALUES (3, 'Logistica', 2);
INSERT INTO Department_IMA(DepartmentId, Name, LocationID)
VALUES (4, 'Marketing', 3);
INSERT INTO Department_IMA(DepartmentId, Name, LocationID)
VALUES (5, 'Mentenanta', 4);
INSERT INTO Department_IMA(DepartmentId, Name, LocationID)
VALUES (6, 'Transport', 5);


INSERT INTO Project_IMA(ProjectId, Name, DepartmentID)
VALUES (1, 'Crestere vanzari', 1);
INSERT INTO Project_IMA(ProjectId, Name, DepartmentID)
VALUES (2, 'Problem solving', 2);
INSERT INTO Project_IMA(ProjectId, Name, DepartmentID)
VALUES (3, 'Sporire eficienta', 3);
INSERT INTO Project_IMA(ProjectId, Name, DepartmentID)
VALUES (4, 'Noua strategie', 4);
INSERT INTO Project_IMA(ProjectId, Name, DepartmentID)
VALUES (5, 'Innoire aparate', 5);
INSERT INTO Project_IMA(ProjectId, Name, DepartmentID)
VALUES (6, 'Optimizare', 6);


INSERT INTO Employee_IMA(EmployeeID, FirstName, Initials, LastName, Street, PostalCode, Gender, BirthDate, DepartmentID)
VALUES (1, 'Gheorghe', 'G.P.', 'Popescu', 'Strada Ardealului', '19543', 'M', TO_DATE('1989-12-09','YYYY-MM-DD'), 1);
INSERT INTO Employee_IMA(EmployeeID, FirstName, Initials, LastName, Street, PostalCode, Gender, BirthDate, DepartmentID)
VALUES (2, 'Ion', 'I.I.', 'Ionescu', 'Strada Vlahuta', '19201', 'M', TO_DATE('1977-06-02','YYYY-MM-DD'), 1);
INSERT INTO Employee_IMA(EmployeeID, FirstName, Initials, LastName, Street, PostalCode, Gender, BirthDate, DepartmentID)
VALUES (3, 'Andreea', 'A.A.', 'Andronescu', 'Strada Bratianu', '19492', 'F', TO_DATE('1991-01-19','YYYY-MM-DD'), 2);
INSERT INTO Employee_IMA(EmployeeID, FirstName, Initials, LastName, Street, PostalCode, Gender, BirthDate, DepartmentID)
VALUES (4, 'Marcel', 'M.S.', 'Staicu', 'Strada Fratii Buzesti', '19211', 'M', TO_DATE('1988-02-04','YYYY-MM-DD'), 2);
INSERT INTO Employee_IMA(EmployeeID, FirstName, Initials, LastName, Street, PostalCode, Gender, BirthDate, DepartmentID)
VALUES (5, 'Ioana', 'I.A.', 'Adam', 'Strada Lebedei', '10741', 'F', TO_DATE('1992-11-06','YYYY-MM-DD'), 3);
INSERT INTO Employee_IMA(EmployeeID, FirstName, Initials, LastName, Street, PostalCode, Gender, BirthDate, DepartmentID)
VALUES (6, 'Andrei', 'A.F.', 'Filip', 'Strada Gorjului', '10402', 'M', TO_DATE('1990-01-14','YYYY-MM-DD'), 3);
INSERT INTO Employee_IMA(EmployeeID, FirstName, Initials, LastName, Street, PostalCode, Gender, BirthDate, DepartmentID)
VALUES (7, 'Mihaela', 'M.R.', 'Radu', 'Strada Avram Iancu', '15321', 'F', TO_DATE('1985-10-13','YYYY-MM-DD'), 4);
INSERT INTO Employee_IMA(EmployeeID, FirstName, Initials, LastName, Street, PostalCode, Gender, BirthDate, DepartmentID)
VALUES (8, 'Matei', 'M.I.', 'Iordache', 'Strada Frunzei', '15715', 'M', TO_DATE('1987-03-22','YYYY-MM-DD'), 4);
INSERT INTO Employee_IMA(EmployeeID, FirstName, Initials, LastName, Street, PostalCode, Gender, BirthDate, DepartmentID)
VALUES (9, 'Liana', 'L.O.', 'Olteanu', 'Strada Mihai Eminescu', '17566', 'M', TO_DATE('1984-12-05','YYYY-MM-DD'), 5);
INSERT INTO Employee_IMA(EmployeeID, FirstName, Initials, LastName, Street, PostalCode, Gender, BirthDate, DepartmentID)
VALUES (10, 'Radu', 'R.A.', 'Anton', 'Strada Caragiale', '17233', 'M', TO_DATE('1991-09-27','YYYY-MM-DD'), 5);
INSERT INTO Employee_IMA(EmployeeID, FirstName, Initials, LastName, Street, PostalCode, Gender, BirthDate, DepartmentID)
VALUES (11, 'Flavia', 'F.M.', 'Munteanu', 'Strada Nichita Stanescu', '12454', 'F', TO_DATE('1993-11-01','YYYY-MM-DD'), 6);
INSERT INTO Employee_IMA(EmployeeID, FirstName, Initials, LastName, Street, PostalCode, Gender, BirthDate, DepartmentID)
VALUES (12, 'Mircea', 'M.M.', 'Manescu', 'Strada Vrabiei', '12813', 'M', TO_DATE('1995-02-21','YYYY-MM-DD'), 6);

INSERT INTO WORKSON_IMA
VALUES (1,1,500);
INSERT INTO WORKSON_IMA
VALUES (2,1,300);
INSERT INTO WORKSON_IMA
VALUES (3,2,400);
INSERT INTO WORKSON_IMA
VALUES (4,2,500);
INSERT INTO WORKSON_IMA
VALUES (5,3,1000);
INSERT INTO WORKSON_IMA
VALUES (6,3,800);
INSERT INTO WORKSON_IMA
VALUES (7,4,550);
INSERT INTO WORKSON_IMA
VALUES (8,4,780);
INSERT INTO WORKSON_IMA
VALUES (9,5,1200);
INSERT INTO WORKSON_IMA
VALUES (10,5,600);
INSERT INTO WORKSON_IMA
VALUES (11,6,890);
INSERT INTO WORKSON_IMA
VALUES (12,6,710);
