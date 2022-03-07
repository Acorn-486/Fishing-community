drop table product;

create table product(
	productID int primary key,
	productName varchar(50),
	productPrice int,
	productDetail varchar(1000),
	productCategory varchar(30),
	productImage longblob,
	userID varchar(20)
);

select * from product;

commit;