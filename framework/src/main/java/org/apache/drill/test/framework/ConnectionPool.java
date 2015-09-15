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
import java.util.Queue;

public class ConnectionPool {
  protected static final Logger LOG = Logger.getLogger(Utils.getInvokingClassName());

  //private static final String URL_STRING = "jdbc:drill:zk=%s";
  private static final String URL_STRING = "jdbc:drill:drillbit=%s";

  private final String zkConnectString;
  private HashMap<String, Queue<Connection>> hash;

  public ConnectionPool(String zkConnectString) throws ClassNotFoundException {
    Class.forName("org.apache.drill.jdbc.Driver");
    Driver.load();
    this.zkConnectString = zkConnectString;
    hash = new HashMap();
  }

  public synchronized Connection getConnection(TestCaseModeler test) throws SQLException {
	String user = test.matrices.get(0).username;
	String password = test.matrices.get(0).password;
	String key = user + password;
	Connection connection;
	if (hash.containsKey(key)) {
		connection = hash.get(key).poll();
		if (connection == null) {
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			connection = DriverManager.getConnection(String.format(URL_STRING, 
					Utils.getDrillTestProperties().get("DRILL_STORAGE_PLUGIN_SERVER")), user, password);
		}
	} else {
		Queue<Connection> connectionQueue = Queues.newLinkedBlockingQueue();
		hash.put(key, connectionQueue);
		connection = DriverManager.getConnection(String.format(URL_STRING,
				Utils.getDrillTestProperties().get("DRILL_STORAGE_PLUGIN_SERVER")), user, password);
	}
	return connection;
  }

  public synchronized void release(TestCaseModeler test, Connection connection) {
	String key = test.matrices.get(0).username + test.matrices.get(0).password;
	if (hash.containsKey(key)) {
		hash.get(key).add(connection);
	} 
  }
  
  public Connection getConnection() throws SQLException {
	return DriverManager.getConnection(String.format(URL_STRING,
	  Utils.getDrillTestProperties().get("DRILL_STORAGE_PLUGIN_SERVER")));
  }
  
  public Connection getConnection(String username, String password) throws SQLException {
	return DriverManager.getConnection(String.format(URL_STRING,
	  Utils.getDrillTestProperties().get("DRILL_STORAGE_PLUGIN_SERVER")), username, password);
  }
}
