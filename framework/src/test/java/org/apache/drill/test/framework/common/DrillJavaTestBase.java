package org.apache.drill.test.framework.common;

import com.google.common.base.Preconditions;
import org.apache.drill.test.framework.ConnectionPool;
import org.apache.drill.test.framework.Utils;
import org.apache.drill.test.framework.ssh.DrillCluster;
import org.apache.log4j.Logger;
import org.testng.annotations.AfterClass;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.AfterSuite;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.BeforeSuite;
import org.testng.annotations.BeforeTest;

import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;

public class DrillJavaTestBase {
    private static final Logger LOG = Logger.getLogger(DrillJavaTestBase.class);
    protected ConnectionPool connectionPool;
    protected DrillCluster drillCluster;

    @BeforeSuite(alwaysRun = true, description = "Invoked at the beginning of the Test Suite.")
    public void baseBeforeSuite() {
        LOG.debug("Running Base Before Suite");
    }

    @BeforeTest(alwaysRun = true, description = "Invoked at the beginning of every Test Module.")
    public void baseBeforeTest() {
        LOG.debug("Running Base Before Test");
    }

    @BeforeClass(alwaysRun = true, description = "Invoked at the beginning of every Test Class.")
    public void baseBeforeClass() throws IllegalStateException {
        LOG.debug("Running Base Before Class");
        final Properties props = Utils.createConnectionProperties();
        connectionPool = new ConnectionPool(props);
        drillCluster = createDrillCluster(connectionPool);
    }

    @BeforeMethod(alwaysRun = true, description = "Invoked before every Test Method.")
    public void baseBeforeMethod(Method method) {

        LOG.info("\n\n---------- Test " + method.getName() + " started ----------\n\n");
    }

    @AfterMethod(alwaysRun = true, description = "Invoked after every Test Method")
    public void baseAfterMethod(Method method) {
        LOG.info("\n\n---------- Test " + method.getName() + " finished ----------\n\n");
    }

    @AfterClass(alwaysRun = true, description = "Invoked after all tests in a Test Class finish.")
    public void baseAfterClass() {
        LOG.debug("Running Base After Class");
        if (connectionPool != null) {
            connectionPool.close();
        }

        if(drillCluster != null) {
            drillCluster.shutdown();
        }
    }

    @AfterTest(alwaysRun = true, description = "Invoked once tests in all classes in the Test Module finish.")
    public void baseAfterTest() {
        LOG.debug("Running Base After Test");
    }

    @AfterSuite(alwaysRun = true, description = "Invoked once all tests in the Suite are completed.")
    public void baseAfterSuite() {
        LOG.debug("Running Base After Suite");
    }

    /**
     * Utility method to create a {@link DrillCluster} instance.
     * @param pool
     * @return
     * @throws SQLException
     */
    protected DrillCluster createDrillCluster(ConnectionPool pool) throws IllegalStateException {
        Preconditions.checkNotNull(pool, "Connection pool is not created!");
        List<String> drillbitHosts;
        try {
             drillbitHosts = Utils.getDrillbitHosts(pool.getOrCreateConnection());
            LOG.info("Size of Drill cluster " + drillbitHosts.size());
            drillbitHosts.forEach(LOG::info);
        } catch (Exception e) {
            e.printStackTrace();
            throw new IllegalStateException("Could not query drillbit hosts.\n" +
                    "[Hint: Ensure that the Drill cluster is up and ready to take take queries.]");
        }
        return new DrillCluster(drillbitHosts);
    }
}
