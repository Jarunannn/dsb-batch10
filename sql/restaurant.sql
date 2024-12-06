----------- Table: transactions ------------
create table transactions(
  transaction_id int primary key,
  table_no int,
  waiter_id int,
  order_date date,
  order_time time,
  menu_item_id int,
  payment_method varchar(25),
  FOREIGN KEY (waiter_id) REFERENCES staffs(staff_id),
  FOREIGN KEY (menu_item_id) REFERENCES menus(menu_item_id)
);

insert into transactions values
  (1,2,001,'2024-07-22','18:15:21','1','cash'),
  (2,1,002,'2024-07-20','11:35:03','3','credit card'),
  (3,4,003,'2024-07-15','14:11:23','4','scan qr'),
  (4,3,004,'2024-06-21','12:01:45','2','cash'),
  (5,2,004,'2024-06-02','10:15:20','2','credit card');

----------- Table: staffs ------------
create table staffs(
  staff_id int primary key,
  first_name varchar(50),
  last_name varchar(50),
  role_name varchar(30),
  salary int
);

insert into staffs values
(1,'John','Doe','waiter',13000),
(2,'Merry','Jane','waiter',15000),
(3,'Peter','Pal','chef',25000),
(4,'Sindy','Kaia','Manageer',35000);

----------- Table: menus ------------
create table menus(
  menu_item_id int primary key,
  name varchar(50),
  price decimal(10,2)
);

insert into menus values
(1,'Cocoa',350.00),
(2,'Kiwi Smoothie',550.00),
(3,'Latte',997.57),
(4,'Black Tea',150);

-----------------------------------------------------
.mode table
.header on
select * from transactions;
select * from staffs;
select * from menus;

----------- with clauses ------------
WITH  temp1 (total_amount_m6)  AS (
      select sum(price) 
      from transactions tr
      join menus m 
      on tr.menu_item_id = m.menu_item_id
      where STRFTIME('%m',order_date) = '06'
),
    temp2 (total_amount_m7)  AS (
    select sum(price) 
    from transactions tr
    join menus m 
    on tr.menu_item_id = m.menu_item_id
    where STRFTIME('%m',order_date) = '07'
)
select 
  case
  when total_amount_m6 > total_amount_m7 
    then 'm6:[' || total_amount_m6 || '] > m7:[' || total_amount_m7 || ']'
    else  'm7:[' || total_amount_m7 || '] > m6:[' || total_amount_m6 || ']'
  end highest_sales_month
from temp1, temp2;

----------- subquery & aggregate function & group by ------------
select
  payment_method,
  ROUND(AVG(m.price),2)  average_transaction_amount
from transactions t
join menus m 
  on t.menu_item_id = m.menu_item_id
group by payment_method
order by average_transaction_amount desc;

-- พนักงานที่รับลูกค้ามากกว่า 1 คน และผลรวมของยอดขาย
-- firstname, lastname, total_customet, total_amount

select  s.first_name ||' '|| s.last_name fullname,
        (select count(*) from transactions t2 where t2.waiter_id = s.staff_id)  total_customers,
        SUM(m.price) AS total_sales
from transactions t
join staffs s 
  on t.waiter_id = s.staff_id
join menus m
  on m.menu_item_id = t.menu_item_id
group by s.staff_id
having count(*)>1;

--คนที่มีเงินเดือนมากสุดยอดขายเท่าไหร่

select  s.first_name ||' '|| s.last_name fullname,
        s.salary max_salary,
        SUM(m.price) AS total_sales
from transactions t
join staffs s
  on t.waiter_id = s.staff_id
join menus m
  on m.menu_item_id = t.menu_item_id
where s.salary = (select max(salary) from staffs)
group by s.staff_id;

--คนที่มีเงินเดือนน้อยสุดยอดขายเท่าไหร่
select  s.first_name ||' '|| s.last_name fullname,
        s.salary min_salary,
        SUM(m.price) AS total_sales
from transactions t
join staffs s
  on t.waiter_id = s.staff_id
join menus m
  on m.menu_item_id = t.menu_item_id
where s.salary = (select min(salary) from staffs)
group by s.staff_id

