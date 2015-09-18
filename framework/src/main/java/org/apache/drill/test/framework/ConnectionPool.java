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
import org.apache.drill.jdbc.Driver;
import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Queue;

public class ConnectionPool implements AutoCloseable {
  private static final Logger LOG = Logger.getLogger(ConnectionPool.class);

  private static final String URL_STRING = String.format("jdbc:drill:drillbit=%s",
    Utils.getDrillTestProperties().get("DRILL_STORAGE_PLUGIN_SERVER"));

  private final Map<String, Queue<Connection>> connections;

  public ConnectionPool() throws ClassNotFoundException {
    Class.forName("org.apache.drill.jdbc.Driver");
    Driver.load();
    connections = new HashMap<>();
  }

  public Connection getOrCreateConnection(TestCaseModeler test) throws SQLException {
    final String username = test.matrices.get(0).username;
    final String password = test.matrices.get(0).password;
    return getOrCreateConnection(username, password);
  }

  public void releaseConnection(TestCaseModeler test, Connection connection) {
    releaseConnection(test.matrices.get(0).username, test.matrices.get(0).password, connection);
  }

  public synchronized Connection getOrCreateConnection(String username, String password) throws SQLException {
    final String key = username + password;
    if (connections.containsKey(key)) {
      final Connection connection = connections.get(key).poll();
      if (connection == null) {
        return DriverManager.getConnection(URL_STRING, username, password);
      } else {
        return connection;
      }
    } else {
      final Queue<Connection> connectionQueue = Queues.newLinkedBlockingQueue();
      connections.put(key, connectionQueue);
      return DriverManager.getConnection(URL_STRING, username, password);
    }
  }

  public synchronized void releaseConnection(String username, String password, Connection connection) {
    final String key = username + password;
    if (connections.containsKey(key)) {
      connections.get(key).add(connection);
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
