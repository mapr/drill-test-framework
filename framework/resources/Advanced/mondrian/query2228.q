select product_class.product_subcategory as c0 from product as product, product_class as product_class where product.product_class_id = product_class.product_class_id and (product_class.product_category = 'Bread' and product_class.product_department = 'Baked Goods' and product_class.product_family = 'Food') and UPPER(product_class.product_subcategory) = UPPER('Bagels') group by product_class.product_subcategory order by product_class.product_subcategory ASC NULLS LAST;
