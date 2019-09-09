PRAGMA foreign_keys = OFF;

CREATE TABLE employee(Fname varchar(15) NOT NULL,
 Minit varchar(1),
 Lname varchar(15) NOT NULL,
 ssn varchar(9) NOT NULL,
 Bdate date,
 Address varchar(150),
 Sex varchar(1),
 Salary numeric(9, 2),
 Super_ssn char(9),
 Dno int NOT NULL,
 primary key(ssn),
 check (Sex in ('M', 'F')),
foreign key(Super_ssn) references Employee(ssn) ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(Dno) references department(Dnumber) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE department(Dname varchar(15) NOT NULL,
Dnumber int not null,
Mgr_ssn varchar(9),
Mgr_start_date date,
primary key(Dnumber),
foreign key(Mgr_ssn) references Employee(ssn) ON DELETE CASCADE ON UPDATE CASCADE);

create table project(Pname varchar(15) NOT NULL,
 Pnumber int NOT NULL,
 Plocation varchar(15),
 Dnum int NOT NULL,
 primary key(Pnumber),
 foreign key(Dnum) references department(Dnumber) ON DELETE CASCADE ON UPDATE CASCADE);

create table works_on(essn varchar(9) NOT NULL,
 Pno int NOT NULL,
 Hours numeric(3, 1),
 primary key(essn, Pno),
 foreign key(essn) references employee(ssn) ON DELETE CASCADE ON UPDATE CASCADE,
 foreign key(Pno) references project(Pnumber) ON DELETE CASCADE ON UPDATE CASCADE);


create table dept_locations(Dnumber int NOT NULL,
 Dlocation varchar(20) NOT NULL,
 primary key(Dnumber, Dlocation),
 foreign key(Dnumber) references department(Dnumber) ON DELETE CASCADE ON UPDATE CASCADE);

create table dependent(Essn varchar(9) NOT NULL,
 Dependent_name varchar(15) NOT NULL,
 Sex varchar(1),
 Bdate date,
 Relationship varchar(25),
 primary key(Essn, Dependent_name),
 check (Sex in ('M', 'F')),
 foreign key(Essn) references employee(ssn) ON DELETE CASCADE ON UPDATE CASCADE);


insert into department(Dname, Dnumber) values('Research', 5);
insert into department(Dname, Dnumber) values('Administration', 4);
insert into department(Dname, Dnumber) values('Headquarters', 1);


insert into employee values('James', 'E', 'Borg', '888665555', '1937-11-10', '450 Stone, Houston, TX', 'M', 55000, 'null', 1);
insert into employee values('Franklin', 'T', 'Wong', '333445555', '1955-12-08', '638 Voss, Houston, TX', 'M', 40000, '888665555', 5);
insert into employee values('Joyce', 'A', 'English', '453453453', '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000, '333445555', 5);
insert into employee values('Ramesh', 'K', 'Narayan', '666884444', '1962-09-15', '975 Fire Oak, Humble, TX', 'M', 38000, '333445555', 5);
insert into employee values('John', 'B', 'Smith', '123456789', '1965-01-09', '731 Fondren, Houston, TX', 'M', 30000, '333445555', 5);
insert into employee values('Jennifer', 'S', 'Wallace', '987654321', '1941-06-20', '291 Berry, Bellaire, TX', 'F', 43000, '888665555', 4);
insert into employee values('Alicia', 'J', 'Zelaya', '99887777', '1968-01-19', '3321 Castle, Spring, TX', 'F', 25000, '987654321', 4);
insert into employee values('Ahmad', 'V', 'Jabbar', '987987987', '1969-03-29', '960 Dallas, Houston, TX', 'M', 25000, '987654321', 4);


update department
set Mgr_ssn = '333445555',
	Mgr_start_date = '1988-05-22'
where Dnumber = 5;

update department
set Mgr_ssn = '987654321',
	Mgr_start_date = '1995-01-01'
where Dnumber = 4;

update department
set Mgr_ssn = '8888665555', 
	Mgr_start_date = '1981-06-19'
where Dnumber = 1;

insert into dept_locations values(1, 'Houston');
insert into dept_locations values(4, 'Stafford');
insert into dept_locations values(5, 'Bellaire');
insert into dept_locations values(5, 'Sugarland');
insert into dept_locations values(5, 'Houston');

insert into works_on values('123456789', 1, 32.5);
insert into works_on values('123456789', 2, 7.5);
insert into works_on values('666884444', 3, 40.0);
insert into works_on values('453453453', 1, 20.0);
insert into works_on values('453453453', 2, 20.0);
insert into works_on values('333445555', 2, 10.0);
insert into works_on values('333445555', 3, 10.0);
insert into works_on values('333445555', 10, 10.0);
insert into works_on values('333445555', 20, 10.0);
insert into works_on values('999887777', 30, 30.0);
insert into works_on values('999887777', 10, 10.0);
insert into works_on values('987987987', 10, 35.0);
insert into works_on values('987987987', 30, 5.0);
insert into works_on values('987654321', 30, 20.0);
insert into works_on values('987654321', 20, 15.0);
insert into works_on values('888665555', 20, 'null');

insert into project values('ProductX', 1, 'Bellaire', 5);
insert into project values('ProductY', 2, 'Sugarland', 5);
insert into project values('ProductZ', 3, 'Houston', 5);
insert into project values('Computerization', 10, 'Stafford', 4);
insert into project values('Reorganization', 20, 'Houston', 1);
insert into project values('Newbenefits', 30, 'Stafford', 4);

insert into dependent values('333445555', 'Alice', 'F', '1986-04-05', 'Daughter');
insert into dependent values('333445555', 'Theodore', 'M', '1983-10-25', 'Son');
insert into dependent values('333445555', 'Joy', 'F', '1958-05-03', 'Spouse');
insert into dependent values('987654321', 'Abner', 'M', '1942-02-28', 'Spouse');
insert into dependent values('123456789', 'Michael', 'M', '1988-01-04', 'Son');
insert into dependent values('123456789', 'Alice', 'F', '1988-12-30', 'Daughter');
insert into dependent values('123456789', 'Elizabeth', 'F', '1967-05-05', 'Spouse');

PRAGMA foreign_keys = ON;

