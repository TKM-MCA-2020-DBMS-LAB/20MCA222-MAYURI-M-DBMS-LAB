mysql> create database employee;
Query OK, 1 row affected (0.22 sec)

mysql> use employee;
Database changed
mysql> create table emp(name varchar(15) not null,occupation varchar(27) not null, place varchar(17) not null,workingtime varchar(10));
Query OK, 0 rows affected (3.90 sec)
mysql> insert into emp values('anu','doctor','kollam',10);
Query OK, 1 row affected (0.97 sec)

mysql> insert into emp values('manu','engineer','kottarakara',20);
Query OK, 1 row affected (0.17 sec)
mysql> insert into emp values('akhil','police','alappuzha',13);
Query OK, 1 row affected (0.11 sec)
mysql> select * from emp;
+-------+------------+-------------+-------------+
| name  | occupation | place       | workingtime |
+-------+------------+-------------+-------------+
| anu   | doctor     | kollam      | 10          |
| manu  | engineer   | kottarakara | 20          |
| akhil | police     | alappuzha   | 13          |
+-------+------------+-------------+-------------+
3 rows in set (0.17 sec)
