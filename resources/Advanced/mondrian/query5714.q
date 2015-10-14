select promotion.promotion_id as c0, promotion.media_type as c1 from promotion as promotion group by promotion.promotion_id, promotion.media_type order by promotion.promotion_id ASC NULLS LAST;
