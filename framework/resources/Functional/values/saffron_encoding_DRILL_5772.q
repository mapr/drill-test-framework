drop table if exists encoding_test;
create table encoding_test as select name, alias, description from (values('Василий Теркин', 'Вася', 'персонаж'), ('王維', '摩詰', '詩人'), ('Ибн Рушд', 'ابن رشد', 'философ'), ('James Cook', 'James', 'navigator')) as t(name, alias, description);
--@test
select name from encoding_test where alias in ('Вася', '摩詰', 'ابن رشد');
drop table if exists encoding_test;
