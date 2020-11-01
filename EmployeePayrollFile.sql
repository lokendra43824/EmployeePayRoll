--UC-1 created database 
--..........................................


--UC-2-Create_Table
create table Employee_payroll(

id int NOT NULL identity(1,1) PRIMARY KEY,
name VARCHAR(30) NOT NULL,
salary DECIMAL(10,2) NOT NULL,
start_Date DATETIME NOT NULL ) ;


--UC-3-insert-data

INSERT INTO Employee_payroll (name, salary, start_Date)
values('lokendra',40000,'2020-09-18');
INSERT INTO Employee_payroll (name, salary, start_Date)
values('ajay',50000,'2019-09-18');
INSERT INTO Employee_payroll (name, salary, start_Date)
values('karan',60000,'2018-09-18');
INSERT INTO Employee_payroll (name, salary, start_Date)
values('saurabh',70000,'2017-09-18');
INSERT INTO Employee_payroll (name, salary, start_Date)
values('varsha',80000,'2016-09-18');


--uc-4-retrieve-data
select * from Employee_payroll;



--uc-5-retrieve salary data for a particular employee
select salary from Employee_payroll where name='karan';

--uc-5-details for a particular employee in specfied date range

select * from Employee_payroll where start_Date between CAST('2017-01-01' as date) and GETDATE();



--uc-6-add-gender-column
ALTER TABLE Employee_payroll add gender varchar(2)  not null default  'M' ;
--uc-6-update the gender based on person name
update Employee_payroll set gender='F' where name='varsha';

--uc-7- find sum,max,min and avg salaries

select gender,sum(salary) as SumOfSalary from Employee_payroll group by(gender);
select gender,avg(salary) as AvgOfSalary from Employee_payroll group by(gender);
select gender,max(salary) as MaxOfSalary from Employee_payroll group by(gender);
select gender,min(salary) as MinSalary from Employee_payroll group by(gender);


select gender,count(*) as TotalPerson from Employee_payroll group by gender;

-- uc-8

ALTER TABLE Employee_payroll add phoneNumber varchar(30) ;
ALTER TABLE Employee_payroll add address varchar(200) default 'AP' not null;
ALTER TABLE Employee_payroll add department  varchar(30) default 'TBA' NOT NULL ;
EXEC sp_RENAME 'Employee_payroll.gender', 'Gender', 'COLUMN';
EXEC sp_RENAME 'Employee_payroll.salary', 'basicPay', 'COLUMN';

SELECT name FROM master.sys.databases

--UC9 Adding deductions,taxable pay ,tax and net_pay to existing table
alter table Employee_payroll add deductions decimal(10,3) NOT NULL default 0;

alter table Employee_payroll add taxable_pay decimal(10,3) NOT NULL default 0 ;

alter table Employee_payroll add tax decimal(10,3) NOT NULL default 0;

alter table Employee_payroll add net_pay decimal(10,3) NOT NULL default 0;

select * from Employee_payroll;


--UC 10 adding terissa as a part of sales and marketing department
insert into Employee_payroll values ('Terissa',90000,'2015-07-09','F',NULL,NULL,'SALES',0,0,0,0);
insert into Employee_payroll values ('Terissa',90000,'2015-07-09','F',NULL,NULL,'MARKETING',0,0,0,0);

select * from Employee_payroll;

--UC 11 create a new table employee department and department table

create table DEPARTMENT(DeptId int primary key,DeptName varchar(100));


select * from DEPARTMENT;
INSERT INTO DEPARTMENT VALUES(7,'SALES');
INSERT INTO DEPARTMENT VALUES(8,'MARKETING');
INSERT INTO DEPARTMENT VALUES(9,'BUSINESS');


create table Employee_department (id int, DeptId int ,Primary key(id,DeptId));

insert into Employee_department values(7,111);
insert into Employee_department values(8,111);
insert into Employee_department values(9,222);

select * from Employee_department;

select * from Employee_payroll;

select EP.name,D.DeptName from 
Employee_payroll EP inner join Employee_department ED on EP.id=ED.id 
 inner join DEPARTMENT D on ED.DeptId=D.DeptId ;

 --UC12 Ensure all the operations working fine

select EP.name,EP.basicPay,EP.start_Date,EP.Gender,
EP.phoneNumber,EP.address,EP.deductions,
EP.taxable_pay,EP.tax,EP.net_pay,D.DeptName from 
Employee_payroll EP inner join Employee_department ED on EP.id=ED.id 
 inner join DEPARTMENT D on ED.DeptId=D.DeptId where D.DeptName='SALES';

 select * from Employee_payroll;