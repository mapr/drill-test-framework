select ca_address_sk, regexp_extract(ca_street_name, 'W(.*)nd', 1) from tpcds01_text.customer_address;
