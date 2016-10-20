select state, city, count(*) totalreviews from business group by state, city order by count(*) desc limit 10;
