import com.mapr.db.TableDescriptor;
import com.mapr.db.Admin;
import com.mapr.db.exceptions.DBException;
import com.mapr.db.MapRDB;
import com.mapr.fs.tables.TableProperties;
import java.util.*;
import org.apache.drill.test.framework.DrillTestDefaults;

public class CreateTable {
    public static void main(String args[]) throws DBException {

        Map<String, String> drillProperties = DrillTestDefaults.getDrillProperties();

        String tablePath = drillProperties.get("DRILL_TESTDATA")+"/schema_change_empty_batch/maprdb/json/";
        String table1 = "part";
        String table2 = "partsupp";
        String table3 = "empty";
        String table4 = "partsupp1";

        TableDescriptor tableDesc = MapRDB.newTableDescriptor(tablePath+table1);
        String[] splitPoints1 = {"1", "1000", "10000", "99999"};

        try (Admin admin = MapRDB.newAdmin()) {
            if (!admin.tableExists(tablePath+table1)) {
                admin.createTable(tableDesc, splitPoints1).close();
            }
        }

        tableDesc = MapRDB.newTableDescriptor(tablePath+table2);
        String[] splitPoints2 = {"1", "10000", "40000", "50000", "999999"};

        try (Admin admin = MapRDB.newAdmin()) {
            if (!admin.tableExists(tablePath+table2)) {
                admin.createTable(tableDesc, splitPoints2).close();
            }
        }

        tableDesc = MapRDB.newTableDescriptor(tablePath+table3);
        String[] splitPoints3 = {"1", "1000", "2000"};

        try (Admin admin = MapRDB.newAdmin()) {
            if (!admin.tableExists(tablePath+table3)) {
                admin.createTable(tableDesc, splitPoints3).close();
            }
        }

        tableDesc = MapRDB.newTableDescriptor(tablePath+table4);
        String[] splitPoints4 = {"2", "4", "6", "8"};

        try (Admin admin = MapRDB.newAdmin()) {
            if (!admin.tableExists(tablePath+table4)) {
                admin.createTable(tableDesc, splitPoints4).close();
            }
        }
    }
}
