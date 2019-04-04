package org.apache.drill.test.framework.resourcemanagement;

import org.apache.drill.test.framework.ConnectionPool;
import org.apache.drill.test.framework.DrillQueryProfile;
import org.apache.drill.test.framework.DrillRMConfig;
import org.apache.drill.test.framework.Utils;
import org.apache.drill.test.framework.common.DrillJavaTestBase;
import org.apache.drill.test.framework.common.DrillTestNGDefaults;
import org.apache.log4j.Logger;
import org.testng.Assert;
import org.testng.annotations.Test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

import static org.apache.drill.test.framework.common.DrillTestNGDefaults.*;

@SuppressWarnings("Duplicates")
@Test(groups = FUNCTIONAL_GROUP)
public class QueueSelectionTests extends DrillJavaTestBase {
    private static final Logger LOG = Logger.getLogger(QueueSelectionTests.class);

    /**
     * Test to check if a connection with a valid tag is admitted into the queue.
     *
     * @throws IOException
     */
    @Test(groups = FUNCTIONAL_GROUP)
    public void testTagSelectorBasic() throws IOException {
        final String query = "SELECT o_orderkey " +
                "FROM orders " +
                "ORDER BY o_orderkey " +
                "DESC limit 1";

        //Expectations
        final long expectedOrderId = 60000;
        final String queryTag = "dev";
        final String expectedPoolName = "DevPool";
        final int expectedRowCount = 1;

        final Properties props = Utils.createConnectionProperties(
                "dfs.drilltestdirtpch01parquet", null, queryTag);

        //Create a RM config from existing template
        DrillRMConfig config = DrillRMConfig.load(BASIC_RM_CONFIG_NAME);
        for (String host : drillbitHosts) {
            Utils.applyRMConfigToDrillbit(config, host);
        }

        Utils.restartDrillbits(); //Restart drillbits
        Utils.sleepForTimeInMillis(DEFAULT_SLEEP_IN_MILLIS);

        try(Connection conn = ConnectionPool
                .createConnection(DrillTestNGDefaults.CONNECTION_URL_FOR_DRILLBIT(
                        drillbitHosts.get(0)), props);
            Statement stmt = conn.createStatement();
            ResultSet res = stmt.executeQuery(query)) {
            final String queryId = Utils.getQueryID(res); //Get query id
            LOG.info("Query ID: " + queryId + ", Query: " + query);

            final DrillQueryProfile queryProfile = Utils.getQueryProfile(queryId); //Get query profile

            //Validate that the query was allowed into the queue
            Assert.assertEquals(queryProfile.queueName, expectedPoolName, "The pool names do not match!");

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
     * Test to check if a connection with a valid tag is admitted into the queue.
     *
     * @throws IOException
     */
    @Test(groups = FUNCTIONAL_GROUP)
    public void testAclSelectorForUser() throws IOException {
        final String query = "SELECT o_orderkey " +
                "FROM orders " +
                "ORDER BY o_orderkey " +
                "DESC limit 1";
        final String queryTag = "dev,test";

        //Expectations
        final long expectedOrderId = 60000;
        final String expectedPoolName = "TestPool";
        final int expectedRowCount = 1;
        final String expectedUsername = "mapr";

        final Properties props = Utils.createConnectionProperties(
                "dfs.drilltestdirtpch01parquet", null, null);

        //Create a RM config from existing template
        DrillRMConfig config = DrillRMConfig.load(BASIC_RM_CONFIG_NAME);
        for (String host : drillbitHosts) {
            Utils.applyRMConfigToDrillbit(config, host);
        }

        Utils.restartDrillbits(); //Restart drillbits
        Utils.sleepForTimeInMillis(DEFAULT_SLEEP_IN_MILLIS);

        try(Connection conn = ConnectionPool
                .createConnection(DrillTestNGDefaults.CONNECTION_URL_FOR_DRILLBIT(
                        drillbitHosts.get(0)), expectedUsername, null, props);
            Statement stmt = conn.createStatement();
            ResultSet res = stmt.executeQuery(query)) {
            final String queryId = Utils.getQueryID(res); //Get query id
            LOG.info("Query ID: " + queryId + ", Query: " + query);

            final DrillQueryProfile queryProfile = Utils.getQueryProfile(queryId); //Get query profile

            //Validate that the query was allowed into the queue
            Assert.assertEquals(queryProfile.queueName, expectedPoolName, "The pool names do not match!");

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
     * Test to check if a connection with a valid tag is admitted into the queue.
     *
     * @throws IOException
     */
    @Test(groups = FUNCTIONAL_GROUP)
    public void testTagSelectBestFitPool() throws IOException {
        final String query = "SELECT o_orderkey " +
                "FROM orders " +
                "ORDER BY o_orderkey " +
                "DESC limit 1";
        final String queryTag = "dev,test";
        //Expectations
        final long expectedOrderId = 60000;
        final String expectedPoolName = "DevPool";
        final int expectedRowCount = 1;

        final Properties props = Utils.createConnectionProperties(
                "dfs.drilltestdirtpch01parquet", null, queryTag);

        //Create a RM config from existing template
        DrillRMConfig config = DrillRMConfig.load(BASIC_RM_CONFIG_NAME);
        for (String host : drillbitHosts) {
            Utils.applyRMConfigToDrillbit(config, host);
        }

        Utils.restartDrillbits(); //Restart drillbits
        Utils.sleepForTimeInMillis(DEFAULT_SLEEP_IN_MILLIS);

        try(Connection conn = ConnectionPool
                .createConnection(DrillTestNGDefaults.CONNECTION_URL_FOR_DRILLBIT(
                        drillbitHosts.get(0)), props);
            Statement stmt = conn.createStatement();
            ResultSet res = stmt.executeQuery(query)) {
            final String queryId = Utils.getQueryID(res); //Get query id
            LOG.info("Query ID: " + queryId + ", Query: " + query);

            final DrillQueryProfile queryProfile = Utils.getQueryProfile(queryId); //Get query profile

            //Validate that the query was allowed into the queue
            Assert.assertEquals(queryProfile.queueName, expectedPoolName, "The pool names do not match!");

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
     * Test to check if a connection with a valid tag is admitted into the queue.
     *
     * @throws IOException
     */
    @Test(groups = FUNCTIONAL_GROUP)
    public void testTagAndAclDoesNotAllowQuery() throws IOException {
        final String query = "SELECT o_orderkey " +
                "FROM orders " +
                "ORDER BY o_orderkey " +
                "DESC limit 1";
        final Properties props = Utils.createConnectionProperties("dfs.drilltestdirtpch01parquet",
                null, null); //NO Query Tags

        //Create a RM config from existing template
        DrillRMConfig config = DrillRMConfig.load(BASIC_RM_CONFIG_NAME);
        for (String host : drillbitHosts) {
            Utils.applyRMConfigToDrillbit(config, host);
        }

        Utils.restartDrillbits(); //Restart drillbits
        Utils.sleepForTimeInMillis(DEFAULT_SLEEP_IN_MILLIS);

        try(Connection conn = ConnectionPool
                .createConnection(DrillTestNGDefaults.CONNECTION_URL_FOR_DRILLBIT(drillbitHosts.get(0)),
                        "anonymous", null, props);
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
