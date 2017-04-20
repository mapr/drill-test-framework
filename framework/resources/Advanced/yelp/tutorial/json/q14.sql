create or replace view dfs.tmp.businessreviews as Select b.name,b.stars,b.state,b.city,r.votes.funny,r.votes.useful,r.votes.cool, r.`date` from business b , review r where r.business_id=b.business_id order by b.name,b.stars,b.state,b.city,r.votes.funny,r.votes.useful,r.votes.cool, r.`date` ;

select count(*) as Total from dfs.tmp.businessreviews;
