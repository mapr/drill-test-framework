select stars,trunc(avg(review_count)) reviewsavg from business group by stars order by stars desc;
