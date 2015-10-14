mkdir -p tpch0.01_$1files
mkdir -p tpch0.01_$1files/lineitem
mkdir -p tpch0.01_$1files/orders
mkdir -p tpch0.01_$1files/supplier
mkdir -p tpch0.01_$1files/part
mkdir -p tpch0.01_$1files/partsupp
mkdir -p tpch0.01_$1files/region
mkdir -p tpch0.01_$1files/nation
mkdir -p tpch0.01_$1files/customer
for i in `seq 1 $1`
do
    `cp ../Tpch0.01/parquet/lineitem.parquet tpch0.01_$1files/lineitem/lineitem_$i.parquet`
    `cp ../Tpch0.01/parquet/orders.parquet tpch0.01_$1files/orders/orders_$i.parquet`
    `cp ../Tpch0.01/parquet/supplier.parquet tpch0.01_$1files/supplier/supplier_$i.parquet`
    `cp ../Tpch0.01/parquet/part.parquet tpch0.01_$1files/part/part_$i.parquet`
    `cp ../Tpch0.01/parquet/partsupp.parquet tpch0.01_$1files/partsupp/partsupp_$i.parquet`
    `cp ../Tpch0.01/parquet/region.parquet tpch0.01_$1files/region/region_$i.parquet`
    `cp ../Tpch0.01/parquet/nation.parquet tpch0.01_$1files/nation/nation_$i.parquet`
    `cp ../Tpch0.01/parquet/customer.parquet tpch0.01_$1files/customer/customer_$i.parquet`
done
