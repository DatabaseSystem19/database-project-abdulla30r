--printing name and email from customers (Basic pl/sql structure)
set serveroutput on
declare cus_name customers.customer_name%type;
email varchar(50);
begin
    select customer_name, email into cus_name,email from customers where customer_id = 5001;
    dbms_output.put_line('Name:' || cus_name || ' Email:'||email);
end;
/

--use of rowtype
set serveroutput on
declare orders_row ORDERS%rowtype;
begin 
    select order_id into orders_row.order_id from orders where order_id = 7001;
    dbms_output.put_line('id:' || orders_row.order_id );
end;
/



--insert or set default value
set serveroutput on
declare
    order_id ORDERS.ORDER_ID%type:=7010;
    product_id ORDERS.PRODUCT_ID%type := 3001;
    customer_id Orders.Customer_id%type := 5001;
    quantity ORDERS.QUANTITY%type := 2;
    
begin
    INSERT INTO orders (order_id, product_id, customer_id, quantity) VALUES (order_id, product_id, customer_id, quantity);
end;
/

--cursor
set serveroutput on 
declare
cursor c is select * from customers;
c_row customers%rowtype;
begin
 open c;
 fetch c into c_row.customer_id,c_row.customer_name,c_row.address,c_row.phone,c_row.email;
 dbms_output.put_line('id:'|| c_row.customer_id || ' name:'||c_row.customer_name);
 close c;
end;
/

--cursor with loop
set serveroutput on 
declare
cursor c is select * from customers;
c_row customers%rowtype;
begin
 open c;
 fetch c into c_row.customer_id,c_row.customer_name,c_row.address,c_row.phone,c_row.email;
 while c%found loop
 dbms_output.put_line('id:'|| c_row.customer_id || ' name:'||c_row.customer_name);
 dbms_output.put_line('row_count: ' || c%rowcount);
 fetch c into c_row.customer_id,c_row.customer_name,c_row.address,c_row.phone,c_row.email; 
 end loop;
 close c;
end;
/

--array
set serveroutput on
declare
i number;
c_name customers.customer_name%type;
TYPE NAMEARRAY is VARRAY(5) of CUSTOMERS.CUSTOMER_NAME%type;
myarray NAMEARRAY:= NAMEARRAY();

begin
i:= 1;
for x in 5001..5005
loop 
    select customer_name into c_name from customers where customer_id = x;
    myarray.EXTEND();
    myarray(i):= c_name;
    i:=i+1;
end loop;

i:=1;
while i<=myarray.count
loop
    dbms_output.put_line(myarray(i));
    i:=i+1;
end loop;
end;
/

--array with extend function
set serveroutput on
declare
i number;
c_name customers.customer_name%type;
TYPE NAMEARRAY is VARRAY(5) of CUSTOMERS.CUSTOMER_NAME%type;
myarray NAMEARRAY:= NAMEARRAY('Customer 1','Customer 2','Customer 3','Customer 4','Customer 5');

begin
i:= 1;
for x in 5001..5005
loop 
    select customer_name into c_name from customers where customer_id = x;
    myarray(i):= c_name;
    i:=i+1;
end loop;

i:=1;
while i<=myarray.count
loop
    dbms_output.put_line(myarray(i));
    i:=i+1;
end loop;
end;
/

--if/else
set serveroutput on;
declare
i number;
product_id PRODUCTS.PRODUCT_ID%type;
seller_id PRODUCTS.SELLER_ID%type;
begin
    i:=1;
    for x in 3001..3015
    loop
        select product_id,seller_id into product_id,seller_id from products where product_id = x;
        IF seller_id = 1001 then
            dbms_output.put_line(product_id || ' sold by ABC Books');
        ELSIF seller_id = 1002 then
            dbms_output.put_line(product_id || ' sold by XYZ Bookstore');
        else
            dbms_output.put_line(product_id || ' sold by other sellers'); 
    end if;   
    end loop;
end;
/

--simple procedure for printing customer name according to customer_id (IN)

create or replace procedure proc(var1 in customers.customer_id%type) is
var2 varchar2(30);
begin
select customer_name into var2 from customers where customer_id = var1;
dbms_output.put_line('customer name:'|| var2);
end;
/

set serveroutput on
declare 
begin
proc(5005);
end;
/


--in out

create or replace procedure proc2(varId in customers.customer_id%type, varName out customers.customer_name%type,varEmail out customers.email%type) is
begin
select customer_name,email into varName,varEmail from customers where customer_id = varId;
end;
/

set serveroutput on
declare 
cName Customers.customer_name%type;
cEmail CUSTOMERS.EMAIL%type;
begin
proc2(5005,CName,CEmail);
dbms_output.put_line('Name:'||cName || ' Email: '||cEmail);
end;
/

--function (take input of a customer id and print his email)
create or replace function func(varId in Customers.customer_id%type) return varchar as
cName customers.customer_NAME%type;
begin
select customer_NAME into cName from customers where customer_id = varId;
return cName;
end;
/


set serveroutput on
declare 
cName customers.customer_name%type;
cEmail customers.Email%type;
begin
cName:=func(5001);
select email into cEmail from customers where customer_name = cName;
dbms_output.put_line('Email: '||cEmail);
end;
/
