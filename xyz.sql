create database supriya

create table customer (c_name varchar(50),
c_add varchar(50),
c_id int primary key auto_increment,
c_mobileno int unique key ,
c_dob date);


create table product(p_id int primary key auto_increment,
p_name varchar(50),
p_details varchar(50),
pc_id int,
 foreign key(pc_id) reference customer(c_id));

insert into customer(c_id,c_name,c_add,c_mobileno,c_dob)values('','Ajay','Thane',4567676767,'2018-4-17');
insert into customer(c_id,c_name,c_add,c_mobileno,c_dob)values('','Sonal','Airoli',4567676767,'2001-5-17');
	insert into customer(c_id,c_name,c_add,c_mobileno,c_dob)values('','Sai','Dadar',4567676767,'2010-6-17');
insert into product(p_id,p_name,p_details, pc_id)values('','Mobile','Nokia',1);
insert into product(p_id,p_name,p_details, pc_id)values('','Mobile','Samsung',4);
insert into product(p_id,p_name,p_details, pc_id)values('','Cloth','Jeans',1);
insert into product(p_id,p_name,p_details, pc_id)values('','Cloth','Shirt',4);
insert into product(p_id,p_name,p_details, pc_id)values('','Zara','Dress',5);
insert into product(p_id,p_name,p_details, pc_id)values('','W','Dress',5);

alter table product
add p_amount decimal(6,2);

update product
set p_amount=1000
where 1

select c_name,c_add,p_name,p_amount
from product,customer where pc_id=c_id

select c_name,c_add,p_name,p_amount
from product join customer on pc_id=c_id

select c_name,c_add,product.p_name,p_amount
from customer left join product on pc_id=c_id


select c_name,c_add,p.p_name,p_amount
from customer left join product as p on pc_id=c_id

select c_name, sum(p_amount)
from product, customer 
where pc_id=c_id 
group by c_id

select c_name, sum(p_amount)
from product, customer 
where pc_id=c_id 
group by c_id
having sum(p_amount)<10000

select c_name, sum(p_amount)
from product, customer 
where pc_id=c_id 
group by c_id
having sum(p_amount)<10000
order by c_name desc

select c_name, sum(p_amount)
from product, customer 
where pc_id=c_id 
group by c_id
having sum(p_amount)<10000
order by c_name desc
limit 0,1

select min(p_amount) from product 

select * from product 
where p_amount=(select min(p_amount) from product )


select * from product 
where p_details like '%Dress'

select * from product 
where p_details like '_r%'

alter table product 
add fulltext(p_name,p_details)

select * from product
where match(p_name,p_details) 
against('Dress')

DELIMITER //
CREATE PROCEDURE country_hos
(IN con CHAR(20))
BEGIN
  SELECT * FROM product
  WHERE p_name = con;
END //
DELIMITER ;

CALL country_hos('Mobile');