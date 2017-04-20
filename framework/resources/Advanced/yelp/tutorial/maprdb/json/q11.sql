select categories[0], count(categories[0]) as categorycount from business 
group by categories[0] order by count(categories[0]) desc limit 10;
