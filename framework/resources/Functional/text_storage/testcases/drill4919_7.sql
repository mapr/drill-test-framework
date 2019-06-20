select Id, count(*) from `/drill/testdata/text_storage/drill4919.tcsv` group by Id order by count(*);
