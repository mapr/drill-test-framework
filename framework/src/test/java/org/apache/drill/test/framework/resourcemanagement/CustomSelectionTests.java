package org.apache.drill.test.framework.resourcemanagement;

import com.google.common.base.Preconditions;
import org.apache.drill.test.framework.ConnectionPool;
import org.apache.drill.test.framework.DrillQueryProfile;
import org.apache.drill.test.framework.DrillRMConfig;
import org.apache.drill.test.framework.Utils;
import org.apache.drill.test.framework.common.DrillJavaTestBase;
import org.apache.drill.test.framework.common.DrillTestNGDefaults;
import org.apache.log4j.Logger;
import org.testng.Assert;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import static org.apache.drill.test.framework.DrillTestDefaults.DRILL_HOME;
import static org.apache.drill.test.framework.DrillTestDefaults.DRILL_RM_OVERRIDE_CONF_FILENAME;
import static org.apache.drill.test.framework.common.DrillTestNGDefaults.DEFAULT_RM_CONFIG_FILEPATH;
import static org.apache.drill.test.framework.common.DrillTestNGDefaults.FUNCTIONAL_GROUP;
import static org.apache.drill.test.framework.common.DrillTestNGDefaults.TPCH_01_PARQUET_SCHEMA;

@Test(groups = FUNCTIONAL_GROUP)
public class CustomSelectionTests extends DrillJavaTestBase {
    private static final Logger LOG = Logger.getLogger(CustomSelectionTests.class);

    @BeforeClass(alwaysRun = true, description = "Invoked before all tests in the class")
    private void setup() throws IOException {
        cleanup(true);
    }

    @AfterMethod(alwaysRun = true, description = "Invoked after all tests in the class are executed")
    private void cleanup() {
        cleanup(true);
    }

    private void cleanup(final boolean restart) {
        Preconditions.checkNotNull(connectionPool,
                "Cleanup failed! Connection pool has not be instantiated");
        Preconditions.checkNotNull(drillCluster,
                "Cleanup failed! Drill cluster information is unavailable");
        drillCluster.runCommand("rm -rf " + DRILL_HOME + "/conf/" + DRILL_RM_OVERRIDE_CONF_FILENAME);
        if(restart) {
            Utils.restartDrillbits(drillCluster);
        }
    }

    /**
     * Test validates that a "*" for "users" will allow all users to run query.
     *
     * @throws IOException
     */
    @Test(groups = FUNCTIONAL_GROUP)
    public void testStarToAllowUser() throws IOException {
        final String query = "SELECT o_orderkey, o_totalprice, o_comment FROM orders";
        final String expectedPoolName = "root";
        final String expectedUserName = "anonymous";

        DrillRMConfig config = DrillRMConfig.load(DEFAULT_RM_CONFIG_FILEPATH);
        config.selector = new DrillRMConfig.SelectorConfig();
        config.selector.acl = new DrillRMConfig.AclConfig();
        config.selector.acl.users = new ArrayList<>();
        config.selector.acl.users.add("*");

        LOG.info("drill.exec.rm: " + config.render());

        Utils.applyRMConfigToDrillCluster(config, drillCluster);
        Utils.restartDrillbits(drillCluster);

        final Properties props = Utils.createConnectionProperties(
                TPCH_01_PARQUET_SCHEMA, null, null);

        try(Connection conn = ConnectionPool
                .createConnection(DrillTestNGDefaults.CONNECTION_URL_FOR_DRILLBIT(
                        drillCluster.getHosts().get(0)),
                        expectedUserName,
                        null,
                        props); //Create a connection based on hostname and properties

            Statement stmt = conn.createStatement();
            ResultSet res = stmt.executeQuery(query)) {
            final String queryId = Utils.getQueryID(res); //Get query id
            LOG.info("QueryID: " + queryId + ", Query: " + query);

            final DrillQueryProfile queryProfile = Utils.getQueryProfile(queryId); //Get query profile
            LOG.info("QueryID: " + queryId + ", QueueName: " + queryProfile.queueName + ", User: " + queryProfile.user);

            //Validate that the query was allowed into the queue
            Assert.assertEquals(queryProfile.queueName, expectedPoolName,
                    "QueryID: " + queryId + " - The pool names do not match!");

            Assert.assertEquals(queryProfile.user, expectedUserName,
                    "QueryID: " + queryId + " - The user names do not match!");
        } catch (Exception e) {
            e.printStackTrace();
            Assert.fail(e.getMessage());
        }
    }
}
