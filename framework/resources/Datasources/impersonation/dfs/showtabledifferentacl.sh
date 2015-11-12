hadoop fs -chmod 777 /drill/testdata/impersonation/threecsvtables
hadoop fs -chown user1:user1 /drill/testdata/impersonation/threecsvtables/user1datav1.view.drill
hadoop fs -chown root:user1 /drill/testdata/impersonation/threecsvtables/user1datav2.view.drill
hadoop fs -chmod 755 /drill/testdata/impersonation/threecsvtables/user1datav2.view.drill
hadoop fs -chgrp impersonation /drill/testdata/impersonation/threecsvtables/user1datav3.view.drill
hadoop fs -chmod 744 /drill/testdata/impersonation/threecsvtables/user1datav3.view.drill
