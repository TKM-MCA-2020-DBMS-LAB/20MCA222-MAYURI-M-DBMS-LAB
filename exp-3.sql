create database work;
use work;
create table department(dept_no int primary key,dept_name varchar(20),location varchar(30));
create table employee(emp_no int primary key,emp_name varchar(20) not null,DOB date,address varchar(30),date_of_join date,mobile_no bigint,dept_no int,foreign key(dept_no) references department(dept_no),salary float);

//inserting 5 rows

insert into work values(101,"Mayuri","Alappuzha");
insert into work values(102,"Monisha","Malappuram");
insert into work values(103,"Devika","Kochi");
insert into work values(104,"Manu","Kottayam");
insert into work values(105,"Devutty","Kannur");

insert into employee values(1,"Malu",'1998-07-20',"Rose villa",'2020-01-10',9785439910,101,10000);
insert into employee values(2,"Gopu",'2009-05-23',"Prime rose",'2020-02-11',7012349019,102,8000);
insert into employee values(3,"Rani",'1995-09-29',"Rose petals",'2021-01-14',9912120010,103,10000);
insert into employee values(2,"RANI",'2009-05-2',"Rani housee",'2020-02-5',7012349098,104,8000);
insert into employee values(3,"David",'1995-09-29',"Rose petals",'2021-05-14',9912120456,105,10000);
//display all records
select * from work;
select * from employee;
//.Display the empno and name of all the employees from department no2
select emp_no,emp_name from employee where dept_no =102;
//Display empno,name,designation,dept no and salary in the descending order of salary
 select emp_no,emp_name,dept_no,salary,Designation from employee order by salary desc;
//Display the empno and name of all employees whose salary is between 2000 and 5000
 select emp_no,emp_name from employee where salary between 34000 and 45000;
//Display all designations without duplicate values
select distinct Designation from employee;
//7.Display the dept name and total salary of employees of each department
select dept_no,sum(salary) from employee group by dept_no;
//Change the salary of employees to 25000 whose designation is ‘Accountant’
update employee set salary =25000 where designation ="Accountant";
//Change the mobile no of employee named ‘David’
 update employee set mobile_no=8685765745 where emp_name = "David";
//Delete all employees whose salaries are equal to Rs.25000
delete from employee where salary =25000;
//Select the department that has total salary paid for its employees more than 25000
 select dept_no,sum(salary) from employee group by dept_no having sum(salary)>25000;
