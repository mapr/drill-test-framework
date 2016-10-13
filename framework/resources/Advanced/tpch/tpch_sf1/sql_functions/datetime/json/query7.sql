select min(extract(day from cast(O_ORDERDate as Date))) from orders;
