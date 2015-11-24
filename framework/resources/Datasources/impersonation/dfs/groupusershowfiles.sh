hadoop fs -chmod 777 /drill/testdata/impersonation/threeparquettables
hadoop fs -chgrp impersonation /drill/testdata/impersonation/threeparquettables/data1.parquet
hadoop fs -chgrp impersonation /drill/testdata/impersonation/threeparquettables/data2.parquet
hadoop fs -chgrp impersonation /drill/testdata/impersonation/threeparquettables/data3.parquet
hadoop fs -chmod 750 /drill/testdata/impersonation/threeparquettables/data2.parquet
hadoop fs -chmod 700 /drill/testdata/impersonation/threeparquettables/data3.parquet
