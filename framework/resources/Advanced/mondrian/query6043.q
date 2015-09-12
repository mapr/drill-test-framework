select warehouse.wa_address1 as c0 from warehouse as warehouse where (warehouse.warehouse_fax is null) group by warehouse.wa_address1 order by warehouse.wa_address1 ASC NULLS LAST;
