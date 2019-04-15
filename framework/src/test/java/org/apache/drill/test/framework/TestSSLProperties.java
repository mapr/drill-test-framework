package org.apache.drill.test.framework;

import org.junit.Test;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

public class TestSSLProperties {

  @Test
  public void testSSLDisabled() {
    Properties connectionProperties = new Properties();

    connectionProperties.put("auth", DrillTestDefaults.AUTHENTICATION_MECHANISM);
    connectionProperties.put("enableTLS", "false");
    connectionProperties.put("user", DrillTestDefaults.USERNAME);
    connectionProperties.put("password", DrillTestDefaults.PASSWORD);

    try (Connection conn = ConnectionPool.createConnection(connectionProperties)){
      fail("Establishing connection succeeded, but should have failed!");
    } catch (SQLException ex) {
      String message = "Error setting/closing connection. Details: HANDSHAKE_COMMUNICATION";
      assertTrue(ex.getMessage().contains(message));
    }
  }

  @Test
  public void testSSLEnabled() {
    Properties connectionProperties = new Properties();

    connectionProperties.put("auth", DrillTestDefaults.AUTHENTICATION_MECHANISM);
    connectionProperties.put("enableTLS", "true");
    connectionProperties.put("trustStorePath", DrillTestDefaults.TRUSTSTORE_PATH);
    connectionProperties.put("trustStorePassword", DrillTestDefaults.TRUSTSTORE_PASSWORD);
    connectionProperties.put("user", DrillTestDefaults.USERNAME);
    connectionProperties.put("password", DrillTestDefaults.PASSWORD);

    try (Connection conn = ConnectionPool.createConnection(connectionProperties)){
      assertTrue(Utils.sanityTest(conn));
    } catch (SQLException ex) {
      ex.printStackTrace();
      fail("Establishing connection failed.");
    }
  }

}

