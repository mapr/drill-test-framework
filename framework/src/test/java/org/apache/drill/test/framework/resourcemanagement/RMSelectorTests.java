package org.apache.drill.test.framework.resourcemanagement;

import org.apache.drill.test.framework.*;
import org.apache.drill.test.framework.common.DrillJavaTestBase;
import org.apache.drill.test.framework.DrillQueryProfile;
import org.apache.drill.test.framework.common.DrillTestConstants;
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

import static org.apache.drill.test.framework.common.DrillTestConstants.UNIT_GROUP;

public class RMSelectorTests extends DrillJavaTestBase {
    private static final Logger LOG = Logger.getLogger(RMSelectorTests.class);

    @BeforeTest(alwaysRun = true)
    public void runBeforeTest() {
        LOG.info("Running before test");
    }
}
