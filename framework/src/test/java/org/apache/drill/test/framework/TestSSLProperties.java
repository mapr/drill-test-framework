package org.apache.drill.test.framework;

import org.junit.Test;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

public class TestSSLProperties {

  @Test
  public void testSSLDisabled() throws Exception {
    Properties connectionProperties = new Properties();

    connectionProperties.put("auth", DrillTestDefaults.AUTHENTICATION_MECHANISM);
    connectionProperties.put("enableTLS", "false");
    connectionProperties.put("user", DrillTestDefaults.USERNAME);
    connectionProperties.put("password", DrillTestDefaults.PASSWORD);

    ConnectionPool connectionPool = new ConnectionPool(connectionProperties);
    try {
      connectionPool.createConnection(connectionProperties);
    } catch (SQLException ex) {
      String message = "Error setting/closing connection. Details: HANDSHAKE_COMMUNICATION";
      assertTrue(ex.getMessage().contains(message));
    }
  }

  @Test
  public void testSSLEnabled() throws Exception {
    Properties connectionProperties = new Properties();

    connectionProperties.put("auth", DrillTestDefaults.AUTHENTICATION_MECHANISM);
    connectionProperties.put("enableTLS", "true");
    connectionProperties.put("trustStorePath", DrillTestDefaults.TRUSTSTORE_PATH);
    connectionProperties.put("trustStorePassword", DrillTestDefaults.TRUSTSTORE_PASSWORD);
    connectionProperties.put("user", DrillTestDefaults.USERNAME);
    connectionProperties.put("password", DrillTestDefaults.PASSWORD);

    ConnectionPool connectionPool = new ConnectionPool(connectionProperties);
    try {
      connectionPool.createConnection(connectionProperties);
    } catch (SQLException ex) {
      ex.printStackTrace();
      fail("Establishing connection failed.");
    } finally {
      Connection connection = connectionPool.createConnection(connectionProperties);
      assertTrue(Utils.sanityTest(connection));
      connection.close();
      connectionPool.close();
    }
  }

}

