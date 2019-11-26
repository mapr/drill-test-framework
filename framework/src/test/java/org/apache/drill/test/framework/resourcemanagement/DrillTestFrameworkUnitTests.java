package org.apache.drill.test.framework.resourcemanagement;

import org.apache.drill.test.framework.ConnectionPool;
import org.apache.drill.test.framework.DrillQueryProfile;
import org.apache.drill.test.framework.Utils;
import org.apache.drill.test.framework.common.DrillJavaTestBase;
import org.apache.log4j.Logger;
import org.testng.Assert;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import java.io.IOException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

import static org.apache.drill.test.framework.common.DrillTestNGDefaults.UNIT_GROUP;

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
        LOG.info("Test " + method.getName() + " started.");

        final Properties props = Utils.createConnectionProperties();
        final ConnectionPool pool = new ConnectionPool(props);
        final String sqlStatement = "select name, val, status from sys.options where name like \'%runtime%\'";

        try (Connection connection = pool.getOrCreateConnection()) {
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
     *
     * @param method
     */
    @Test(groups = UNIT_GROUP)
    public void testQueryProfileDoesNotExist(Method method) {
        LOG.info("Test " + method.getName() + " started.");
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
}
