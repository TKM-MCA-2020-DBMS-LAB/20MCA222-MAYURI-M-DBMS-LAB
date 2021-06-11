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
mysql> DELIMITER //
mysql> Create Trigger Before_insert_empworkingtime
    -> BEFORE INSERT ON emp FOR EACH ROW
    -> IF NEW.workingtime < 0 THEN SET NEW.workingtime = 0;
    -> END IF;
    -> END;//
Query OK, 0 rows affected (0.47 sec)
mysql> delimiter ;
mysql> insert into emp values('lekshmi','scientist','kottayam',13);
Query OK, 1 row affected (0.82 sec)

mysql> insert into emp values('akhilesh','business','kochi',14);
Query OK, 1 row affected (0.16 sec)

mysql> select * from emp;
+----------+------------+-------------+-------------+
| name     | occupation | place       | workingtime |
+----------+------------+-------------+-------------+
| anu      | doctor     | kollam      | 10          |
| manu     | engineer   | kottarakara | 20          |
| akhil    | police     | alappuzha   | 13          |
| lekshmi  | scientist  | kottayam    | 13          |
| akhilesh | business   | kochi       | 14          |
+----------+------------+-------------+-------------+
5 rows in set (0.00 sec)

mysql> SHOW TRIGGERS;
+------------------------------+--------+-------+-------------------------------------------------------------+--------+------------------------+--------------------------------------------+----------------+----------------------+----------------------+--------------------+
| Trigger                      | Event  | Table | Statement                                                   | Timing | Created                | sql_mode                                   | Definer        | character_set_client | collation_connection | Database Collation |
+------------------------------+--------+-------+-------------------------------------------------------------+--------+------------------------+--------------------------------------------+----------------+----------------------+----------------------+--------------------+
| Before_insert_empworkingtime | INSERT | emp   | IF NEW.workingtime < 0 THEN SET NEW.workingtime = 0;
END IF | BEFORE | 2021-06-11 10:27:55.10 | STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION | root@localhost | cp850                | cp850_general_ci     | utf8mb4_0900_ai_ci |
+------------------------------+--------+-------+-------------------------------------------------------------+--------+------------------------+--------------------------------------------+----------------+----------------------+----------------------+--------------------+
1 row in set (0.89 sec)
