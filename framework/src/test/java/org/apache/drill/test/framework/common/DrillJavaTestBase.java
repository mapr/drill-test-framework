package org.apache.drill.test.framework.common;

import org.apache.log4j.Logger;
import org.testng.annotations.AfterClass;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.AfterSuite;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.BeforeSuite;
import org.testng.annotations.BeforeTest;

public class DrillJavaTestBase {
    private static final Logger LOG = Logger.getLogger(DrillJavaTestBase.class);

    @BeforeSuite(alwaysRun = true, description = "Invoked at the beginning of the Test Suite.")
    public void baseBeforeSuite() {
        LOG.debug("Running Base Before Suite");
    }

    @BeforeTest(alwaysRun = true, description = "Invoked at the beginning of every Test Module.")
    public void baseBeforeTest() {
        LOG.debug("Running Base Before Test");
    }

    @BeforeClass(alwaysRun = true, description = "Invoked at the beginning of every Test Class.")
    public void baseBeforeClass() {
        LOG.debug("Running Base Before Class");
    }

    @BeforeMethod(alwaysRun = true, description = "Invoked before every Test Method.")
    public void baseBeforeMethod() {
        LOG.debug("Running Base Before Method");
    }

    @AfterMethod(alwaysRun = true, description = "Invoked after every Test Method")
    public void baseAfterMethod() {
        LOG.debug("Running Base After Method");
    }

    @AfterClass(alwaysRun = true, description = "Invoked after all tests in a Test Class finish.")
    public void baseAfterClass() {
        LOG.debug("Running Base After Class");
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
