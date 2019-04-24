package org.apache.drill.test.framework;

import com.typesafe.config.Config;
import com.typesafe.config.ConfigFactory;
import oadd.org.apache.drill.exec.proto.UserBitShared;
import org.apache.drill.test.framework.common.DrillJavaTestBase;
import org.apache.log4j.Logger;
import org.testng.Assert;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Properties;

import static org.apache.drill.test.framework.DrillTestDefaults.DRILL_EXEC_RM_CONFIG_KEY;
import static org.apache.drill.test.framework.common.DrillTestNGDefaults.BASIC_RM_CONFIG_FILEPATH;
import static org.apache.drill.test.framework.common.DrillTestNGDefaults.UNIT_GROUP;
import static org.apache.drill.test.framework.common.DrillTestNGDefaults.PROD_RM_CONFIG_FILEPATH;

@Test(groups = UNIT_GROUP)
public class DrillTestFrameworkUnitTests extends DrillJavaTestBase {
    private static final Logger LOG = Logger.getLogger(DrillTestFrameworkUnitTests.class);


    @BeforeTest(alwaysRun = true)
    public void runBeforeTest() {
        LOG.debug("Running before test");
    }


    /**
     * A unit test to validate that {@link Utils#getQueryProfile(String)}
     * can be used to obtain query profile. This test also validates that
     * the returned query profile can be deserialized to {@link DrillQueryProfile}.
     *
     * @param method
     */
    @Test(groups = UNIT_GROUP)
    public void testGetQueryProfile(Method method) {
        final String sqlStatement = "select name, val, status from sys.options where name like \'%runtime%\'";

        try (Connection connection = connectionPool.getOrCreateConnection()) {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sqlStatement);

            final String queryId = Utils.getQueryID(resultSet);
            DrillQueryProfile profile = Utils.getQueryProfile(queryId);
            Assert.assertEquals(profile.queryId, queryId);
        } catch (Exception e) {
            e.printStackTrace();
            Assert.fail("Test " + method.getName() + " failed due to " + e.getMessage());
        }
    }

    /**
     * A unit test to validate that {@link Utils#getQueryProfile(String)}
     * fails with the right error if a profile for a specified queryId does not exist.
     */
    @Test(groups = UNIT_GROUP)
    public void testQueryProfileDoesNotExist() {
        final String queryId = "invalidQueryId";

        try {
            Utils.getQueryProfile(queryId);
            Assert.fail("Querying invalid query profile did not throw exception!");
        } catch (IOException e) {
            Assert.assertTrue(e.getMessage().contains("Could not get query profile"),
                    "Expected error message \"Could not get query profile\" " +
                            "but obtained - " + e.getMessage());
        }
    }


    /**
     * Test reading a sample RM config file in to a Java Bean.
     */
    @Test(groups = UNIT_GROUP)
    public void testReadSampleRMConfigFile() {
        try {
            DrillRMConfig drillRMConfig = DrillRMConfig.load(PROD_RM_CONFIG_FILEPATH);
            Assert.assertEquals(drillRMConfig.poolName, "root",
                    "Root resource pool name did not match");

            Assert.assertEquals(drillRMConfig.childPools.size(), 2,
                    "Number of child pools in the config did not match!");
        } catch (Exception e) {
            e.printStackTrace();
            Assert.fail(e.getMessage());
        }
    }

    /**
     * Test reading a sample RM config file, with complex selectors, in to a Java Bean.
     */
    @Test(groups = UNIT_GROUP)
    public void testReadComplexSelectorsRMConfigFile() {
        try {
            DrillRMConfig drillRMConfig = DrillRMConfig.load(BASIC_RM_CONFIG_FILEPATH);
            Assert.assertEquals(drillRMConfig.childPools.get(1).selector.or.size(), 2,
                    "Or selector should have had 2 children!");

        } catch (Exception e) {
            e.printStackTrace();
            Assert.fail(e.getMessage());
        }
    }

    /**
     * Negative test to validate the behavior when the config file does not exist.
     */
    @Test(groups = UNIT_GROUP, expectedExceptions = IOException.class)
    public void testLoadConfigWhenFileDoesNotExist() throws IOException {
        final String invalidPath = "invalid-config-file.conf";

        DrillRMConfig.load(invalidPath);
    }

    /**
     * Test reading a sample RM config file in to a Java Bean.
     */
    @Test(groups = UNIT_GROUP)
    public void testConfigFileRenderer() {
        try {
            DrillRMConfig drillRMConfig = DrillRMConfig.load(PROD_RM_CONFIG_FILEPATH);
            Assert.assertEquals(drillRMConfig.poolName, "root",
                    "Root resource pool name did not match");

            Assert.assertEquals(drillRMConfig.childPools.size(), 2,
                    "Number of child pools in the config did not match!");

            Config config = ConfigFactory.parseString(drillRMConfig.render());
            Assert.assertEquals(config.getString(DrillRMConfig.RESOURCE_POOL_NAME_KEY),
                    drillRMConfig.poolName,
                    "Pool names did not match!");
            Assert.assertEquals(config.getString(DrillRMConfig.QUEUE_SELECTION_POLICY_KEY),
                    drillRMConfig.queueSelectionPolicy,
                    "Queue selection policy did not match!");
        } catch (Exception e) {
            e.printStackTrace();
            Assert.fail(e.getMessage());
        }
    }

    /**
     * Test if DrillRMConfig can be serialized to a file.
     * Read from the file to validate.
     * @throws IOException
     */
    @Test(groups = UNIT_GROUP)
    public void testWriteRMConfigToFile() throws IOException {
        final String fileName = "tempRMConfig.conf";
        final String filePath = DrillTestDefaults.TEST_ROOT_DIR + "conf/" + fileName;
        File file = new File(filePath);

        if(file.exists()) {
            LOG.warn(filePath + " exists! Removing the file");
            Utils.execCmd("rm -rf " + filePath);
        }

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            DrillRMConfig drillRMConfig = DrillRMConfig.load(PROD_RM_CONFIG_FILEPATH);
            writer.write(DRILL_EXEC_RM_CONFIG_KEY + ":" + drillRMConfig.render());
        }

        DrillRMConfig drillRMConfig2 = DrillRMConfig.load(filePath);
        Assert.assertEquals(drillRMConfig2.poolName, "root",
                "Root resource pool name did not match");

        Assert.assertEquals(drillRMConfig2.childPools.size(), 2,
                "Number of child pools in the config did not match!");
    }

    /**
     * Test parsing operator memory and type from QueryProfile.
     */
    @Test
    public void testTotalMemoryForQueryProfile() {
        final Properties props = Utils.createConnectionProperties();
        final ConnectionPool pool = new ConnectionPool(props);
        final String sqlStatement = "select name, val, status from sys.options where name like \'%runtime%\'";

        try (Connection connection = pool.getOrCreateConnection()) {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sqlStatement);

            final String queryId = Utils.getQueryID(resultSet);
            DrillQueryProfile profile = Utils.getQueryProfile(queryId);
            Assert.assertEquals(profile.queryId, queryId);

            long rmMemEstimate = profile.getTotalOptimalMemoryPerNode();
            LOG.info("Memory estimated by RM planner: " + rmMemEstimate);
            Assert.assertTrue(rmMemEstimate > 0,
                    "RM estimated memory should be greater than 0");
            List<UserBitShared.CoreOperatorType> operators = profile.getOperatorsFromProfile();
            Assert.assertTrue(operators.size() > 0,
                    "Number of operators in the profile should be greater than 0");
            operators.forEach(o -> LOG.info("Operator: " + o + ", Optimal Memory per Node in bytes: " +
                    profile.getOptimalMemoryPerOperatorPerNode(o)));
        } catch (Exception e) {
            e.printStackTrace();
            Assert.fail(e.getMessage());
        }
    }
}
