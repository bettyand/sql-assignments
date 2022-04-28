-- question 1
insert into rental_records (rental_id, veh_reg_no, customer_id, start_date, end_date)
values (
	null, 
    'SBA1111A', 
    (select customer_id from customers where name = 'Angel'),
    curdate(),
    date_add(curdate(), interval 10 day)
);

-- question 2
insert into rental_records (rental_id, veh_reg_no, customer_id, start_date, end_date)
values (
	null,
    'GA5555E',
    (select customer_id from customers where name = 'Kumar'),
    date_add(curdate(), interval 1 day),
    date_add(curdate(), interval 3 month)
);

-- question 3
select start_date, end_date, veh_reg_no, brand, name
from rental_records join customers using (customer_id) join vehicles using (veh_reg_no)
order by category, start_date;

-- question 4
select * from rental_records where end_date < curdate();

-- question 5
select veh_reg_no, name, start_date, end_date
from customers join rental_records using (customer_id)
where start_date < '2012-01-10' and end_date > '2012-01-10';

-- question 6
select veh_reg_no, name, start_date, end_date
from customers join rental_records using (customer_id)
where start_date <= curdate() and end_date >= curdate();

-- question 7
select veh_reg_no, name, start_date, end_date
from customers join rental_records using (customer_id)
where (start_date >= '2012-01-03' and start_date <= '2012-01-18') 
	or (end_date >= '2012-01-03' and end_date <= '2012-01-18')
    or (start_date <= '2012-01-03' and end_date >= '2012-01-18');
    
-- question 8
select veh_reg_no, brand, vehicles.desc
from vehicles join rental_records using (veh_reg_no)
where not (start_date < '2012-01-10' and end_date > '2012-01-10');

-- question 9
select veh_reg_no, brand, vehicles.desc
from vehicles join rental_records using (veh_reg_no)
where not (
	(start_date >= '2012-01-03' and start_date <= '2012-01-18') 
	or (end_date >= '2012-01-03' and end_date <= '2012-01-18')
    or (start_date <= '2012-01-03' and end_date >= '2012-01-18')
);

-- question 10
select veh_reg_no, brand, vehicles.desc
from vehicles join rental_records using (veh_reg_no)
where not (
	(start_date >= curdate() and start_date <= date_add(curdate(), interval 10 day)) 
	or (end_date >= curdate() and end_date <= date_add(curdate(), interval 10 day))
    or (start_date <= curdate() and end_date >= date_add(curdate(), interval 10 day))
);