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
import java.util.Properties;

import static org.apache.drill.test.framework.DrillTestDefaults.DRILL_HOME;
import static org.apache.drill.test.framework.DrillTestDefaults.DRILL_RM_OVERRIDE_CONF_FILENAME;
import static org.apache.drill.test.framework.common.DrillTestNGDefaults.DEFAULT_RM_CONFIG_FILEPATH;
import static org.apache.drill.test.framework.common.DrillTestNGDefaults.FUNCTIONAL_GROUP;
import static org.apache.drill.test.framework.common.DrillTestNGDefaults.TPCH_01_PARQUET_SCHEMA;

@Test(groups = FUNCTIONAL_GROUP)
public class QueuePlannerTests extends DrillJavaTestBase {
    private static final Logger LOG = Logger.getLogger(QueuePlannerTests.class);

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
     * Test validates that if max_query_memory_per_node is set to a value
     * greater than optimal memory estimated by RM planner,
     * the query runs to completion in the queue.
     *
     * Test also validates that the estimation for optimal memory required does NOT change.
     *
     * @throws IOException
     */
    @Test(groups = FUNCTIONAL_GROUP)
    public void testLargerThanOptimalProject() throws IOException {
        final String query = "SELECT o_orderkey, o_totalprice, o_comment FROM orders";
        final String queryTag = "test"; //Set tag such that both dev and test are eligible
        final String expectedPoolName = "root";
        long expectedOptimalMemoryPerNode = 0; //initialize
        long expectedRowCount = 0; //initialize

        final Properties props = Utils.createConnectionProperties(
                TPCH_01_PARQUET_SCHEMA, null, queryTag);

        try(Connection conn = ConnectionPool
                .createConnection(DrillTestNGDefaults.CONNECTION_URL_FOR_DRILLBIT(
                        drillCluster.getHosts().get(0)),
                        null,
                        null,
                        props); //Create a connection based on hostname and properties

            Statement stmt = conn.createStatement();
            ResultSet res = stmt.executeQuery(query)) {
            final String queryId = Utils.getQueryID(res); //Get query id
            LOG.info("QueryID: " + queryId + ", Query: " + query);

            final DrillQueryProfile queryProfile = Utils.getQueryProfile(queryId); //Get query profile
            expectedOptimalMemoryPerNode = queryProfile.getTotalOptimalMemoryPerNode();
            LOG.info("QueryID: " + queryId + ", Estimated total optimal memory per node: " +
                    expectedOptimalMemoryPerNode);

            DrillRMConfig config = DrillRMConfig.load(DEFAULT_RM_CONFIG_FILEPATH);
            config.queue.maxQueryMemoryPerNode = (long)(queryProfile.getTotalOptimalMemoryPerNode() * 1.2);

            LOG.info("Setting max_query_memory_per_node: " + config.queue.maxQueryMemoryPerNode);

            Utils.applyRMConfigToDrillCluster(config, drillCluster);
            Utils.restartDrillbits(drillCluster);

            long rowCount = 0;
            while(res.next()) {
                rowCount++;
            }
            expectedRowCount = rowCount;
        } catch (Exception e) {
            e.printStackTrace();
            Assert.fail(e.getMessage());
        }

        try(Connection conn = ConnectionPool
                .createConnection(DrillTestNGDefaults.CONNECTION_URL_FOR_DRILLBIT(
                        drillCluster.getHosts().get(0)),
                        null,
                        null,
                        props); //Create a connection based on hostname and properties

            Statement stmt = conn.createStatement();
            ResultSet res = stmt.executeQuery(query)) {

            final String queryId = Utils.getQueryID(res); //Get query id
            LOG.info("QueryID: " + queryId + ", Query: " + query);

            final DrillQueryProfile queryProfile = Utils.getQueryProfile(queryId); //Get query profile
            //Validate that the query was allowed into the queue
            Assert.assertEquals(queryProfile.queueName, expectedPoolName,
                    "QueryID: " + queryId + " - The pool names do not match!");

            Assert.assertEquals(queryProfile.getTotalOptimalMemoryPerNode(),
                    expectedOptimalMemoryPerNode,
                    "Optimal memory per node estimation did not match");

            long rowCount = 0;
            while(res.next()) {
                rowCount++;
            }
            Assert.assertEquals(rowCount, expectedRowCount, "Number of rows returned did not match!");
        } catch (Exception e) {
            e.printStackTrace();
            Assert.fail(e.getMessage());
        }
    }
}
