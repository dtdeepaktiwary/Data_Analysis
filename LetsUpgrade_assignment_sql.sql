
-- Considering the table name as employees
-- Q 1.1. Alter the table to change datatype of empID from int to varchar2(10) ?
Alter table employees modify column empID varchar(10);

-- Q 1.2. Select the data from the table grouped by address and blood group ?
select count(empID) from employees group by EmpAddress;
select count(empname) from employees group by bloodgroup;

-- Q 1.3. Display the data of employee no 2 and 3 ?
select * from employees where empid not in (1);

-- Q 1.4.Delete the record of employee no 1 ?
delete from employees where EmpName = 'Abhishek';


-- Q2. Consider the following schema
-- Q.2.1 Select the appointments with the patient dated 20/2/2022?
select * from Appointments left join Patient on Appointments.PID= Patient.PID where Date ='20/2/2022';

-- Q.2.2. Find the appointment time and patient name of all appointments for doctor Akash on April-14-2021. ?
select Appointments.time_all, Patient.name
from Appointments
inner join Doctor on  Appointments.SID= Doctor.SID
inner join Patient on Appointments.PID= Patient.PID
where Doctor.name= 'Akash';


-- Q3. From the following tables write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city ?
select orders.ord_no,orders.purch_amt,customer.cust_name,customer.city
from orders
inner join customer on orders.customer_id=customer.customer_id
where purch_amt between 500 and 2000;


-- Q4.1. Consider the following table salesman --Create a view for those salespeople who belong to the city of New York. ?
select * from salesman where city='NewYork';

-- Q4.2. Return salesperson_ID, name, and city?
select salesman_id, name ,city
from salesman

-- Q4.3. Create a view to find all the salesman who have the commission = 0.15, Return all the fields of the salesman ?
select * from salesman where commission = '0.15';

-- Q4.4. Create a view to count the number of salespeople in each city. Return city,number of salespersons?
select count(salesman_id),city from salesman group by city;

-- Q5.1. Consider the following schema for a beauty parlour, Select the appointments with the customer dated 20/2/2022 ?
select * from Appointments left join Customer on Appointments.CID= Customer.CID 
where Appointments.date = '20/2/2022';

-- Q5.2. Find the appointment time and client name of all appointments for employee member Joy on Dec-14-2021 ?
select Appointments.time,Customer.name
from Appointments
inner join customer on Appointments.CID= Customer.CID
inner join Employee on Appointments.SID= Employee.SID
where Employee.name = 'Joy' and Appointments.date = 'Dec-14-2021';

-- Q.6.1  Write a plsql query to display empid , empname , deptmanager ?
select Employee.empid,Income.empid,Employee.empname,Department.deptmanager
from employee
inner join Income on Employee.empid= Income.empid
inner join Department on Employee.deptid=Department.deptid;

-- Q.6.2 Write a plsql query to display empid , salary ?
select *
from Employee
right join Income on Employee.empid= Income.empid;

-- Q.6.3 Write a plsql query to run left join on employee and department ?
select * 
from Employee
left join Department on Employee.deptid=Department.deptid;

-- Q.6.4  Write a plsql query to run right join on employee and salary?
select *
from Employee
right join Income on Employee.empid= Income.empid;

-- Q.6.5  Write a plsql query to run cross join on all the three tables?
select *
from employee
cross join department on Employee.deptid=Department.deptid
cross join Income on Employee.empid= Income.empid;

-- Q7.1. Write plsql queries for the following ,create a table customer (columns: customerid , customer_name ,customer_address) ?
create table customer(
customerid int(100),
customer_name varchar(100),
customer_address varchar(200));

-- Q7.2.Insert a record in the table in above table?
insert into customer values(1,'Rajesh','Pune');

-- Q7.3. delete a record from the above table where customerid = 1 ?
delete from customer
where customerid= '1';

-- Q7.4. update the above table to change customer_name as ‘Rajesh’ where customerid=1
update customer
set customer_name = ‘Rajesh’
where customerid=1;

-- Q8.1. Consider the following tables,Write a plsql query to display sid , sname , books_issued, books_returned?
select sid,Student.sname, Library.books_issued, Library.books_returned
from student
inner join library on Student.sid=Library.sid
inner join marks on Student.sid=Marks.sid;

-- Q8.2. Write a plsql query to display sname , grade?
select student.sname,marks.grade
from student
inner join marks on Student.sid=Marks.sid;

-- Q8.3. Write a plsql query to run left join on student and library?
select *
from student
left join library on Student.sid=Library.sid;

-- Q8.4. Wirte a plsql query to run right join on library and marks?
select *
from marks
right join libraray on marks.sid=library.sid;

-- Q8.5. .Write a plsql query to run full join on all the three tables?
select *
from student
full join library on Student.sid=Library.sid
full join marks on Student.sid=marks.sid;


-- Q9. Explain group by clauses in plsql with the help of example?
-- Ans- The GROUP BY statement groups rows that have the same values into summary rows, like "find the number of customers in each country".
-- The GROUP BY statement is often used with aggregate functions (COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set by one or more columns.
-- Group by Syntax:: SELECT column_name(s) FROM table_name WHERE condition GROUP BY column_name(s) ORDER BY column_name(s);
Example :: SELECT COUNT(CustomerID), Country FROM Customers GROUP BY Country ORDER BY COUNT(CustomerID) DESC;


-- Q10. Explain subqueries in pl/sql with the help of an example ?
-- A Subquery is a query within another SQL query and embedded within the WHERE clause.
-- Important Rule:A subquery can be placed in a number of SQL clauses like WHERE clause, FROM clause, HAVING clause.
-- You can use Subquery with SELECT, UPDATE, INSERT, DELETE statements along with the operators like =, <, >, >=, <=, IN, BETWEEN, etc.
-- A subquery is a query within another query. The outer query is known as the main query, and the inner query is known as a subquery.
-- Subqueries are on the right side of the comparison operator.
-- A subquery is enclosed in parentheses.
-- In the Subquery, ORDER BY command cannot be used. But GROUP BY command can be used to perform the same function as ORDER BY command.
-- Example :: SELECT * FROM EMPLOYEE  WHERE ID IN (SELECT ID  FROM EMPLOYEE WHERE SALARY > 4500);  





















