package org.apache.drill.test.framework.resourcemanagement;

import com.google.common.base.Preconditions;
import org.apache.drill.test.framework.*;
import org.apache.drill.test.framework.common.DrillJavaTestBase;
import org.apache.drill.test.framework.common.DrillTestNGDefaults;
import org.apache.log4j.Logger;
import org.testng.Assert;
import org.testng.annotations.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

import static org.apache.drill.test.framework.DrillTestDefaults.DRILL_HOME;
import static org.apache.drill.test.framework.DrillTestDefaults.DRILL_RM_OVERRIDE_CONF_FILENAME;
import static org.apache.drill.test.framework.common.DrillTestNGDefaults.*;

@SuppressWarnings("Duplicates")
@Test(groups = FUNCTIONAL_GROUP)
public class AdvancedSelectionTests extends DrillJavaTestBase {
    private static final Logger LOG = Logger.getLogger(AdvancedSelectionTests.class);

    @BeforeClass(alwaysRun = true, description = "Invoked before all tests in the class")
    private void setup() throws IOException {
        cleanup(false);
        DrillRMConfig config = DrillRMConfig.load(PROD_RM_CONFIG_FILEPATH);
        Utils.applyRMConfigToDrillCluster(config, drillCluster);
        Utils.restartDrillbits(drillCluster);
    }

    @AfterClass(alwaysRun = true, description = "Invoked after all tests in the class are executed")
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
     * Test to validate that the query is not admitted since the specified user is restricted into the queue.
     *
     * @throws IOException
     */
    @Test(groups = FUNCTIONAL_GROUP)
    public void testRestrictUserShortNotation() throws IOException {
        final String query = "SELECT o_orderkey " +
                "FROM orders " +
                "ORDER BY o_orderkey " +
                "DESC limit 1";
        final Properties props = Utils.createConnectionProperties(TPCH_01_PARQUET_SCHEMA,
                null, null); //NO Query Tags

        try(Connection conn = ConnectionPool
                .createConnection(DrillTestNGDefaults.CONNECTION_URL_FOR_DRILLBIT(drillCluster.getHosts().get(0)),
                        "jane",
                        null,
                        props);
            Statement stmt = conn.createStatement();
            ResultSet res = stmt.executeQuery(query)) {
            final String queryId = Utils.getQueryID(res); //Get query id
            LOG.info("Query ID: " + queryId + ", Query: " + query);

            Utils.getQueryProfile(queryId); //Get query profile
            Assert.fail("Did not receive expected exception: " + NO_RESOURCE_POOL_ERROR);
        } catch (Exception e) {
            if (e.getMessage().contains(NO_RESOURCE_POOL_ERROR)) {
                LOG.info("Received expected exception: " + e.getMessage());
            } else {
                e.printStackTrace();
                Assert.fail(e.getMessage());
            }
        }
    }

    /**
     * Test validates that a hierarchical resource pool notation configuration is read correctly.
     * It also validates that the right leaf queue is picked based on Acl and Tag configuration.
     *
     * @throws IOException
     */
    @Test(groups = FUNCTIONAL_GROUP)
    public void testAclComplexUserAndTag() throws IOException {
        final String query = "SELECT o_orderkey " +
                "FROM orders " +
                "ORDER BY o_orderkey " +
                "DESC limit 1";

        //Set expectations
        final long expectedOrderId = 60000;
        final String expectedPoolName = "ExperimentalQueryResourcePool";
        final int expectedRowCount = 1;
        final String expectedUser = "alice";
        final String queryTags = "experimental";

        //Build a connection with only schema
        final Properties props = Utils.createConnectionProperties(
                TPCH_01_PARQUET_SCHEMA, null, queryTags);

        try(Connection conn = ConnectionPool
                .createConnection(
                        DrillTestNGDefaults.CONNECTION_URL_FOR_DRILLBIT(drillCluster.getHosts().get(0)),
                        expectedUser, //Provide username for the connection
                        null,
                        props);

            Statement stmt = conn.createStatement();
            ResultSet res = stmt.executeQuery(query)) {
            final String queryId = Utils.getQueryID(res); //Get query id
            LOG.info("Query ID: " + queryId + ", Query: " + query);

            final DrillQueryProfile queryProfile = Utils.getQueryProfile(queryId); //Get query profile

            //Validate that the query was allowed into the queue
            Assert.assertEquals(queryProfile.queueName, expectedPoolName, "The pool names do not match!");
            LOG.info("QueryID: " + queryId + ", Queue: " + queryProfile.queueName);

            long rowCount = 0;
            while(res.next()) {
                rowCount++;
                Assert.assertEquals(res.getLong("o_orderkey"), expectedOrderId,
                        "OrderId expected did not match");

            }
            Assert.assertEquals(rowCount, expectedRowCount, "Number of rows returned did not match!");
            Assert.assertEquals(queryProfile.user, expectedUser);
        } catch (Exception e) {
            e.printStackTrace();
            Assert.fail(e.getMessage());
        }
    }
}

