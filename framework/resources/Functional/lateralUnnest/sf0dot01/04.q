SELECT  customer.c_custkey,customer.c_name,orders.o_id, orders.o_amount 
FROM customer, LATERAL (SELECT O.o_id, O.o_amount FROM UNNEST(customer.c_orders) O WHERE O.o_amount in (10,20,30,40,100,89230.03,270087.44) )orders;
