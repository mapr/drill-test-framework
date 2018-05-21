DROP TABLE IF EXISTS h_tab1 PURGE;
CREATE EXTERNAL TABLE IF NOT EXISTS h_tab1 (
    itm int
)
PARTITIONED BY (y int, m int, category int)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
STORED AS PARQUET LOCATION "/drill/testdata/ctas/parquet/DRILL_6173/tab1/";

ALTER TABLE h_tab1 ADD PARTITION (y=1987, m=5, category=1) location '/drill/testdata/ctas/parquet/DRILL_6173/tab1/1';
ALTER TABLE h_tab1 ADD PARTITION (y=1987, m=5, category=2) location '/drill/testdata/ctas/parquet/DRILL_6173/tab1/2';
ALTER TABLE h_tab1 ADD PARTITION (y=1987, m=7, category=1) location '/drill/testdata/ctas/parquet/DRILL_6173/tab1/3';
ALTER TABLE h_tab1 ADD PARTITION (y=1987, m=7, category=2) location '/drill/testdata/ctas/parquet/DRILL_6173/tab1/4';
ALTER TABLE h_tab1 ADD PARTITION (y=1988, m=11, category=1) location '/drill/testdata/ctas/parquet/DRILL_6173/tab1/5';
ALTER TABLE h_tab1 ADD PARTITION (y=1988, m=11, category=2) location '/drill/testdata/ctas/parquet/DRILL_6173/tab1/6';
ALTER TABLE h_tab1 ADD PARTITION (y=1988, m=12, category=1) location '/drill/testdata/ctas/parquet/DRILL_6173/tab1/7';
ALTER TABLE h_tab1 ADD PARTITION (y=1988, m=12, category=2) location '/drill/testdata/ctas/parquet/DRILL_6173/tab1/8';
ALTER TABLE h_tab1 ADD PARTITION (y=1990, m=4, category=1) location '/drill/testdata/ctas/parquet/DRILL_6173/tab1/9';
ALTER TABLE h_tab1 ADD PARTITION (y=1990, m=4, category=2) location '/drill/testdata/ctas/parquet/DRILL_6173/tab1/10';
ALTER TABLE h_tab1 ADD PARTITION (y=1990, m=5, category=1) location '/drill/testdata/ctas/parquet/DRILL_6173/tab1/11';
ALTER TABLE h_tab1 ADD PARTITION (y=1990, m=5, category=2) location '/drill/testdata/ctas/parquet/DRILL_6173/tab1/12';
ALTER TABLE h_tab1 ADD PARTITION (y=1991, m=3, category=1) location '/drill/testdata/ctas/parquet/DRILL_6173/tab1/13';
ALTER TABLE h_tab1 ADD PARTITION (y=1991, m=3, category=2) location '/drill/testdata/ctas/parquet/DRILL_6173/tab1/14';
ALTER TABLE h_tab1 ADD PARTITION (y=1991, m=3, category=3) location '/drill/testdata/ctas/parquet/DRILL_6173/tab1/15';
ALTER TABLE h_tab1 ADD PARTITION (y=1991, m=3, category=4) location '/drill/testdata/ctas/parquet/DRILL_6173/tab1/16';

DROP TABLE IF EXISTS h_tab2 PURGE;
CREATE EXTERNAL TABLE IF NOT EXISTS h_tab2 (
    itm int,
    category int
    )
    PARTITIONED BY (y int, m int)
    ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
    STORED AS PARQUET LOCATION "/drill/testdata/ctas/parquet/DRILL_6173/tab2/";

ALTER TABLE h_tab2 ADD PARTITION (y=1987, m=5) location '/drill/testdata/ctas/parquet/DRILL_6173/tab2/1';
ALTER TABLE h_tab2 ADD PARTITION (y=1987, m=7) location '/drill/testdata/ctas/parquet/DRILL_6173/tab2/2';
ALTER TABLE h_tab2 ADD PARTITION (y=1988, m=11) location '/drill/testdata/ctas/parquet/DRILL_6173/tab2/3';
ALTER TABLE h_tab2 ADD PARTITION (y=1988, m=12) location '/drill/testdata/ctas/parquet/DRILL_6173/tab2/4';
ALTER TABLE h_tab2 ADD PARTITION (y=1990, m=4) location '/drill/testdata/ctas/parquet/DRILL_6173/tab2/5';
ALTER TABLE h_tab2 ADD PARTITION (y=1990, m=5) location '/drill/testdata/ctas/parquet/DRILL_6173/tab2/6';
ALTER TABLE h_tab2 ADD PARTITION (y=1991, m=3) location '/drill/testdata/ctas/parquet/DRILL_6173/tab2/7';

DROP TABLE IF EXISTS h_tab3 PURGE;
CREATE EXTERNAL TABLE IF NOT EXISTS h_tab3 (
    category int
    )
    PARTITIONED BY (sub_category String)
    ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
    STORED AS PARQUET LOCATION "/drill/testdata/ctas/parquet/DRILL_6173/tab3/";

ALTER TABLE h_tab3 ADD PARTITION (sub_category='sub1') location '/drill/testdata/ctas/parquet/DRILL_6173/tab3/1';
ALTER TABLE h_tab3 ADD PARTITION (sub_category='sub2') location '/drill/testdata/ctas/parquet/DRILL_6173/tab3/2';
ALTER TABLE h_tab3 ADD PARTITION (sub_category='sub3') location '/drill/testdata/ctas/parquet/DRILL_6173/tab3/3';
ALTER TABLE h_tab3 ADD PARTITION (sub_category='sub4') location '/drill/testdata/ctas/parquet/DRILL_6173/tab3/4';
ALTER TABLE h_tab3 ADD PARTITION (sub_category='sub5') location '/drill/testdata/ctas/parquet/DRILL_6173/tab3/5';
ALTER TABLE h_tab3 ADD PARTITION (sub_category='sub6') location '/drill/testdata/ctas/parquet/DRILL_6173/tab3/6';
ALTER TABLE h_tab3 ADD PARTITION (sub_category='sub7') location '/drill/testdata/ctas/parquet/DRILL_6173/tab3/7';