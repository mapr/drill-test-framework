select count(*) from (select distinct RTRIM(promotion_name) as c0 from promotion as promotion) as init;
