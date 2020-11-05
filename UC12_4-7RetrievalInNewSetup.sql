create table company
( CompId int not null primary key, Comp_Name varchar(1000) not null, 
);

create table employee
(EmpId int not null identity(1,1) primary key,
EmpName varchar(150) not null,
Gender char(1) not null,
PhoneNo bigint not null,
Address varchar(500) not null,
StartDate date not null,
CompId int not null foreign key references company(CompId)
);

create table payroll
(EmpId int not null primary key references employee(EmpId),
BasicPay float not null,
Deductions float not null,
TaxablePay float not null,
Tax float not null,
NetPay float not null);

create table department
(DeptId int not null primary key,
DeptName varchar(100) not null);

create table employee_dept
(EmpId int not null foreign key references employee(EmpId),
DeptId int not null foreign key references department(DeptId));

insert into company values
(1001,'Capgemini'),
(1002,'Bridgelabz');

insert into employee values
('Bill','M',3456787654,'Goa','2020-03-28',1001),
('Teressa','F',5677893456,'New York','2019-05-12',1001),
('Jonas','M',2345678765,'Australia','2019-02-13',1001),
('Fury','M',3452341234,'USA','2020-06-04',1001),
('George','M',7898765678,'USA','2020-07-04',1002);

insert into payroll values
(1,90000,5000,85000,5000,80000),
(2,50000,5000,45000,4000,41000),
(3,60000,4000,56000,4000,52000),
(4,90000,5000,85000,5000,80000),
(5,90000,5000,85000,5000,80000);

insert into department values
(100,'Sales'),
(101,'Marketing'),
(102,'HR');

insert into employee_dept values
(1,102),
(2,100),
(2,101),
(3,102),
(4,101),
(5,101);
select * from employee_dept;

--UC4
select e.CompId, e.EmpId, e.EmpName, e.Gender, e.PhoneNo, e.Address, e.StartDate,
p.NetPay, d.DeptName from employee e, payroll p,department d, employee_dept ed where e.EmpId = p.EmpId and 
ed.EmpId = e.EmpId and ed.DeptId=d.DeptId;

--UC5
select e.EmpId,e.EmpName,p.BasicPay,p.Deductions,p.TaxablePay,p.Tax,p.NetPay
from employee e,payroll p
where e.EmpName='Teressa' and e.EmpId=p.EmpId;

--UC7
select e.Gender,
count(e.EmpId) as EmpCount,
min(p.NetPay) as MinSalary,
max(p.NetPay) as MaxSalary,
sum(p.NetPay) as SalarySum,
avg(p.NetPay) as AvgSalary
from employee e,payroll p
 where e.EmpId=p.EmpId group by Gender;



