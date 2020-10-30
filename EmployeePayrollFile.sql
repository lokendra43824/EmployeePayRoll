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
