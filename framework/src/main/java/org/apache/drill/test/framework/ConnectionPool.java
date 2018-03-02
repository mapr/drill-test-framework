/**
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.apache.drill.test.framework;

import com.google.common.collect.Queues;
import org.apache.log4j.Logger;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Queue;

public class ConnectionPool implements AutoCloseable {
  private static final Logger LOG = Logger.getLogger(ConnectionPool.class);

  private final Map<String, Queue<Connection>> connections;
  private Properties connectionProperties;

  public ConnectionPool(Properties connectionProperties) {
    this.connectionProperties = connectionProperties;
    try {
      Class.forName(DrillTestDefaults.JDBC_DRIVER.getClassName());
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
      System.exit(-1);
    }
    //Driver.load();
    connections = new HashMap<>();
  }

  /**
   * Get / create connection for user in TestSuite
   * @param test TestCaseModeler of the test suite
   * @return Connection for user specified in the TestSuite
   * @throws SQLException
   */
  public Connection getOrCreateConnection(TestCaseModeler test) throws SQLException {
    final String username = test.matrices.get(0).username;
    final String password = test.matrices.get(0).password;
    return getOrCreateConnection(username, password);
  }

  /**
   * Get / create connection for user in DrillTestConfig
   * @return Connection for user specified in DrillTestConfig
   * @throws SQLException
   */
  public Connection getOrCreateConnection() throws SQLException {
    return getOrCreateConnection(DrillTestDefaults.USERNAME, DrillTestDefaults.PASSWORD);
  }

  /**
   * Get / create connection for user
   * @param username connection user info
   * @param password password user info
   * @return Connection for specified user
   * @throws SQLException
   */
  private synchronized Connection getOrCreateConnection(String username, String password) throws SQLException {
    String connectionKey = username + "|" + password;
    if (connections.containsKey(connectionKey)) {
      final Connection connection = connections.get(connectionKey).poll();
      if (connection != null) {
        return connection;
      }
    } else {
      final Queue<Connection> connectionQueue = Queues.newLinkedBlockingQueue();
      connections.put(connectionKey, connectionQueue);
    }
    connectionProperties.put("user", username);
    connectionProperties.put("password", password);
    return DriverManager.getConnection(DrillTestDefaults.CONNECTION_STRING, connectionProperties);
  }

  /**
   * Add connection to connection pool
   * @param test TestCaseModeler of the test suite
   * @param connection Connection for user specified in the TestSuite
   */
  public void releaseConnection(TestCaseModeler test, Connection connection) {
    releaseConnection(test.matrices.get(0).username, test.matrices.get(0).password, connection);
  }

  /**
   * Add connection to connection pool
   * @param connection Connection for user specified in DrillTestConfig
   */
  public void releaseConnection(Connection connection) {
    releaseConnection(DrillTestDefaults.USERNAME, DrillTestDefaults.PASSWORD, connection);
  }

  /**
   * Add connection to connection pool
   * @param username connection user info
   * @param password password user info
   * @param connection Connection for specified user
   */
  private synchronized void releaseConnection(String username, String password, Connection connection) {
    String connectionKey = username + "|" + password;
    if (connections.containsKey(connectionKey)) {
      connections.get(connectionKey).add(connection);
    } else {
      LOG.warn("Unknown connection released to pool. Closing connection now.");
      try {
        connection.close();
      } catch (SQLException e) {
        LOG.warn("Error while closing connection.", e);
      }
    }
  }

  @Override
  public void close() {
    for (final Queue<Connection> queue : connections.values()) {
      for (final Connection connection : queue) {
        try {
          connection.close();
        } catch (final SQLException e) {
          LOG.warn("Error while closing connection.", e);
        }
      }
    }
  }
}
