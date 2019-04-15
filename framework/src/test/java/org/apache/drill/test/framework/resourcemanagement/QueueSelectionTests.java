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
import static org.apache.drill.test.framework.common.DrillTestNGDefaults.FUNCTIONAL_GROUP;
import static org.apache.drill.test.framework.common.DrillTestNGDefaults.NO_RESOURCE_POOL_ERROR;
import static org.apache.drill.test.framework.common.DrillTestNGDefaults.BASIC_RM_CONFIG_NAME;

@SuppressWarnings("Duplicates")
@Test(groups = FUNCTIONAL_GROUP)
public class QueueSelectionTests extends DrillJavaTestBase {
    private static final Logger LOG = Logger.getLogger(QueueSelectionTests.class);

    @BeforeClass(alwaysRun = true, description = "Invoked before all tests in the class")
    private void setup() throws IOException {
        cleanup(false);
        DrillRMConfig config = DrillRMConfig.load(BASIC_RM_CONFIG_NAME);
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
     * Test validates that the tag is evaluated and the right queue is picked based on the tag.
     *
     * @throws IOException
     */
    @Test(groups = FUNCTIONAL_GROUP)
    public void testTagSelectorBasic() throws IOException {
        final String query = "SELECT o_orderkey " +
                "FROM orders " +
                "ORDER BY o_orderkey " +
                "DESC limit 1";

        //Set expectations
        final long expectedOrderId = 60000;
        final String queryTag = "dev";
        final String expectedPoolName = "DevPool";
        final int expectedRowCount = 1;

        //Build a connection with queryTag
        final Properties props = Utils.createConnectionProperties(
                "dfs.drilltestdirtpch01parquet", null, queryTag);

        try(Connection conn = ConnectionPool
                .createConnection(
                        DrillTestNGDefaults.CONNECTION_URL_FOR_DRILLBIT(drillCluster.getHosts().get(0)),
                        props);
            Statement stmt = conn.createStatement();
            ResultSet res = stmt.executeQuery(query)) {
            final String queryId = Utils.getQueryID(res); //Get query id
            LOG.info("QueryID: " + queryId + " - Query: " + query);

            final DrillQueryProfile queryProfile = Utils.getQueryProfile(queryId); //Get query profile

            //Validate that the query was allowed into the queue
            Assert.assertEquals(queryProfile.queueName, expectedPoolName,
                    "QueryID: " + queryId + " - The pool names do not match!");
            LOG.info("QueryID: " + queryId + ", Queue: " + queryProfile.queueName);

            //Validate the data returned.
            long rowCount = 0;
            while(res.next()) {
                rowCount++;
                Assert.assertEquals(res.getLong("o_orderkey"), expectedOrderId,
                        "QueryID: " + queryId + " - OrderId expected did not match");

            }
            Assert.assertEquals(rowCount, expectedRowCount,
                    "QueryID: " + queryId + " - Number of rows returned did not match!");
        } catch (Exception e) {
            e.printStackTrace();
            Assert.fail(e.getMessage());
        }
    }

    /**
     * Test validates that user in Acl is evaluated and the right queue is picked based on the Acl.
     *
     * @throws IOException
     */
    @Test(groups = FUNCTIONAL_GROUP)
    public void testAclSelectorForUser() throws IOException {
        final String query = "SELECT o_orderkey " +
                "FROM orders " +
                "ORDER BY o_orderkey " +
                "DESC limit 1";

        //Set expectations
        final long expectedOrderId = 60000;
        final String expectedPoolName = "TestPool";
        final int expectedRowCount = 1;
        final String expectedUser = "bob";

        //Build a connection with only schema
        final Properties props = Utils.createConnectionProperties(
                "dfs.drilltestdirtpch01parquet", null, null);

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

    /**
     * Test validates where multiple queues are eligible to admit a query, based on tag,
     * but the bestfit queue is selected.
     *
     * @throws IOException
     */
    @Test(groups = FUNCTIONAL_GROUP)
    public void testTagSelectBestFitPool() throws IOException {
        final String query = "SELECT o_orderkey " +
                "FROM orders " +
                "ORDER BY o_orderkey " +
                "DESC limit 1";
        final String queryTag = "dev,test"; //Set tag such that both dev and test are eligible

        //Set expectations
        final long expectedOrderId = 60000;
        final String expectedPoolName = "DevPool"; //As per "bestfit" policy
        final int expectedRowCount = 1;
        final String user = "bob";

        final Properties props = Utils.createConnectionProperties(
                "dfs.drilltestdirtpch01parquet", null, queryTag);

        try(Connection conn = ConnectionPool
                .createConnection(DrillTestNGDefaults.CONNECTION_URL_FOR_DRILLBIT(
                        drillCluster.getHosts().get(0)),
                        user,
                        null,
                        props); //Create a connection based on hostname and properties

            Statement stmt = conn.createStatement();
            ResultSet res = stmt.executeQuery(query)) {
            final String queryId = Utils.getQueryID(res); //Get query id
            LOG.info("Query ID: " + queryId + ", Query: " + query);

            final DrillQueryProfile queryProfile = Utils.getQueryProfile(queryId); //Get query profile

            Assert.assertEquals(queryProfile.user, user, "Query user did not match for queryID: " +
                    queryId + " !");

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
        } catch (Exception e) {
            e.printStackTrace();
            Assert.fail(e.getMessage());
        }
    }

    /**
     * Test to validate that the query is not admitted since there are no tags and Acls do not match
     * any of the queues.
     * Also validates the error message.
     *
     * @throws IOException
     */
    @Test(groups = FUNCTIONAL_GROUP)
    public void testUnknownUserDoesNotAllowQuery() throws IOException {
        final String query = "SELECT o_orderkey " +
                "FROM orders " +
                "ORDER BY o_orderkey " +
                "DESC limit 1";
        final Properties props = Utils.createConnectionProperties("dfs.drilltestdirtpch01parquet",
                null, null); //NO Query Tags

        try(Connection conn = ConnectionPool
                .createConnection(DrillTestNGDefaults.CONNECTION_URL_FOR_DRILLBIT(drillCluster.getHosts().get(0)),
                        "anonymous",
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
     * Validates that an unknown tag is not wrongly admitted into the queue.
     *
     * @throws IOException
     */
    @Test(groups = FUNCTIONAL_GROUP)
    public void testUnknownTagDoesNotAllowQuery() {
        final String query = "SELECT o_orderkey " +
                "FROM orders " +
                "ORDER BY o_orderkey " +
                "DESC limit 1";
        final String queryTag = "marketing"; //This tag is not configured for basic RM template
        final Properties props = Utils.createConnectionProperties("dfs.drilltestdirtpch01parquet",
                null, queryTag); //NO Query Tags

        try(Connection conn = ConnectionPool
                .createConnection(DrillTestNGDefaults.CONNECTION_URL_FOR_DRILLBIT(drillCluster.getHosts().get(0)),
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
}
