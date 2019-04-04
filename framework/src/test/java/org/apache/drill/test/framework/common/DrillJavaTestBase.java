package org.apache.drill.test.framework.common;

import org.apache.drill.test.framework.ConnectionPool;
import org.apache.drill.test.framework.Utils;
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
    protected List<String> drillbitHosts;

    @BeforeSuite(alwaysRun = true, description = "Invoked at the beginning of the Test Suite.")
    public void baseBeforeSuite() {
        LOG.debug("Running Base Before Suite");
    }

    @BeforeTest(alwaysRun = true, description = "Invoked at the beginning of every Test Module.")
    public void baseBeforeTest() {
        LOG.debug("Running Base Before Test");
    }

    @BeforeClass(alwaysRun = true, description = "Invoked at the beginning of every Test Class.")
    public void baseBeforeClass() throws SQLException {
        LOG.debug("Running Base Before Class");
        final Properties props = Utils.createConnectionProperties();
        connectionPool = new ConnectionPool(props);
        drillbitHosts = Utils.getDrillbitHosts(connectionPool.getOrCreateConnection());
        LOG.info("Size of drillbitHosts " + drillbitHosts.size());
        drillbitHosts.forEach(LOG::info);
        if(drillbitHosts == null || drillbitHosts.size() == 0) {
            throw new IllegalStateException("Cannot run test suite without connecting to drillbits!");
        }
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
    }

    @AfterTest(alwaysRun = true, description = "Invoked once tests in all classes in the Test Module finish.")
    public void baseAfterTest() {
        LOG.debug("Running Base After Test");
    }

    @AfterSuite(alwaysRun = true, description = "Invoked once all tests in the Suite are completed.")
    public void baseAfterSuite() {
        LOG.debug("Running Base After Suite");
    }
}
