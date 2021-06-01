mysql> use work;
Database changed
mysql> show tables;
+----------------+
| Tables_in_work |
+----------------+
| department     |
| employee       |
+----------------+
2 rows in set (0.55 sec)

mysql> describe department;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| dept_no   | int         | NO   | PRI | NULL    |       |
| dept_name | varchar(20) | YES  |     | NULL    |       |
| location  | varchar(30) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.20 sec)

mysql> select * from department;
+---------+-----------+------------+
| dept_no | dept_name | location   |
+---------+-----------+------------+
|     101 | Mayuri    | Alappuzha  |
|     102 | Monisha   | Malappuram |
|     103 | Devika    | Kochi      |
|     104 | Manu      | Kottayam   |
|     105 | Devutty   | Kannur     |
+---------+-----------+------------+
5 rows in set (0.00 sec)

mysql> select * from employee;
+--------+----------+------------+-------------+--------------+------------+---------+--------+
| emp_no | emp_name | DOB        | address     | date_of_join | mobile_no  | dept_no | salary |
+--------+----------+------------+-------------+--------------+------------+---------+--------+
|      1 | Malu     | 1998-07-20 | Rose villa  | 2020-01-10   | 9785439910 |     101 |  10000 |
|      2 | Gopu     | 2009-05-23 | Prime rose  | 2020-02-11   | 7012349019 |     102 |   8000 |
|      3 | Rani     | 1995-09-29 | Rose petals | 2021-01-14   | 9912120010 |     103 |  10000 |
|      4 | RANI     | 2009-05-02 | Rani housee | 2020-02-05   | 7012349098 |     104 |   8000 |
|      5 | David    | 1995-09-29 | Rose petals | 2021-05-14   | 9912120456 |     105 |  10000 |
+--------+----------+------------+-------------+--------------+------------+---------+--------+
5 rows in set (0.00 sec)

mysql>  create view Manager as SELECT  emp_name,DOB,salary,location from employee,department;
Query OK, 0 rows affected (0.21 sec)

mysql>  select  distinct e.emp_name from employee e ,Manager m where e.salary >m.salary;
+----------+
| emp_name |
+----------+
| Malu     |
| Rani     |
| David    |
+----------+
3 rows in set (0.14 sec)

mysql> DROP VIEW MANAGER;
Query OK, 0 rows affected (0.16 sec)

mysql> update manager set salary = 1.1 * salary where location ="Alappuzha";
mysql> create table deptsal as select dept_no , 0 as totalsalary from department;
Query OK, 5 rows affected (1.43 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> delimiter //
mysql> create procedure updatesal(IN Param1 int)
    -> begin
    -> update deptsal
    -> set totalsalary= (select sum(salary)from employee  where dept_no=Param1)
    -> where dept_no =param1;
    -> end; //
Query OK, 0 rows affected (0.28 sec)

mysql> delimiter ;
mysql> call updatesal(101);
Query OK, 1 row affected (0.26 sec)

mysql> call updatesal(102);
Query OK, 1 row affected (0.09 sec)

mysql> call updatesal(103);
Query OK, 1 row affected (0.11 sec)
mysql> select * from deptsal;

+---------+-------------+
| dept_no | totalsalary |
+---------+-------------+
|     101 |       10000 |
|     102 |        8000 |
|     103 |       10000 |
|     104 |           0 |
|     105 |           0 |
+---------+-------------+
5 rows in set (0.00 sec)

mysql>    drop procedure updatesal;
Query OK, 0 rows affected (0.21 sec)

mysql> delimiter //
mysql>  CREATE PROCEDURE Getdetails()
    -> begin
    -> select * from employee;
    -> end //
Query OK, 0 rows affected (0.14 sec)
mysql>    drop procedure updatesal;
Query OK, 0 rows affected (0.21 sec)

mysql> delimiter //
mysql>  CREATE PROCEDURE Getdetails()
    -> begin
    -> select * from employee;
    -> end //
Query OK, 0 rows affected (0.14 sec)
