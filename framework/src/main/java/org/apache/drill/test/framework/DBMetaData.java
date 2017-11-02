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

import java.sql.SQLException;
import java.sql.DatabaseMetaData;

import org.apache.log4j.Logger;

/**
* Retrieves DataBase MetaData.
*/

public class DBMetaData {
	private static final Logger LOG = Logger.getLogger(DBMetaData.class);
	private DatabaseMetaData md = null;
	public DBMetaData(DatabaseMetaData md) {
		this.md = md;
	}
	
	public String toString() {
		try {
			return
				"Catalog Separator\t=\t" + md.getCatalogSeparator() + "\n" +
				"Catalog Term\t\t=\t" + md.getCatalogTerm() + "\n" +
				"DB Major Version\t=\t" + md.getDatabaseMajorVersion() + "\n" +
				"DB Minor Version\t=\t" + md.getDatabaseMinorVersion() + "\n" +
				"DB Product Name\t\t=\t" + md.getDatabaseProductName() + "\n" +
				"DB Product Version\t=\t" + md.getDatabaseProductVersion() + "\n" +
				"Transaction Isolation\t=\t" + md.getDefaultTransactionIsolation() + "\n" +
				"Driver Major Version\t=\t" + md.getDriverMajorVersion() + "\n" +
				"Driver Minor Version\t=\t" + md.getDriverMinorVersion() + "\n" +
				"Driver Name\t\t=\t" + md.getDriverName() + "\n" +
				"Driver Version\t\t=\t" + md.getDriverVersion() + "\n" +
				"Extra Characters\t=\t" + md.getExtraNameCharacters() + "\n" +
				"Identifier Quote\t=\t" + md.getIdentifierQuoteString() + "\n" +
				"JDBC Major Version\t=\t" + md.getJDBCMajorVersion() + "\n" +
				"JDBC Minor Version\t=\t" + md.getJDBCMinorVersion() + "\n" +
				"Max Bi Literal Length\t=\t" + md.getMaxBinaryLiteralLength() + "\n" +
				"Max Catalog Name Length\t=\t" + md.getMaxCatalogNameLength() + "\n" +
				"Max Char Literal Length\t=\t" + md.getMaxCharLiteralLength() + "\n" +
				"Max Column Name Length\t=\t" + md.getMaxColumnNameLength() + "\n" +
				"Max Columns In GroupBy\t=\t" + md.getMaxColumnsInGroupBy() + "\n" +
				"Max Columns In Index\t=\t" + md.getMaxColumnsInIndex() + "\n" +
				"Max Columns In OrderBy\t=\t" + md.getMaxColumnsInOrderBy() + "\n" +
				"Max Columns In Select\t=\t" + md.getMaxColumnsInSelect() + "\n" +
				"Max Columns In Table\t=\t" + md.getMaxColumnsInTable() + "\n" +
				"Max Connections\t\t=\t" + md.getMaxConnections() + "\n" +
				"Max Cursor Name Length\t=\t" + md.getMaxCursorNameLength() + "\n" +
				"Max Index Length\t=\t" + md.getMaxIndexLength() + "\n" +
				"Max Procedure Length\t=\t" + md.getMaxProcedureNameLength() + "\n" +
				"Max Row Size\t\t=\t" + md.getMaxRowSize() + "\n" +
				"Max Schema Name Length\t=\t" + md.getMaxSchemaNameLength() + "\n" +
				"Max Statement Length\t=\t" + md.getMaxStatementLength() + "\n" +
				"Max Statements\t\t=\t" + md.getMaxStatements() + "\n" +
				"Max Table Name Length\t=\t" + md.getMaxTableNameLength() + "\n" +
				"Max Tables In Select\t=\t" + md.getMaxTablesInSelect() + "\n" +
				"Max User Name Length\t=\t" + md.getMaxUserNameLength() + "\n" +
				"Numeric Functions\t=\t" + md.getNumericFunctions() + "\n" +
				"Procedure Term\t\t=\t" + md.getProcedureTerm() + "\n" +
				"ResultSet Holdability\t=\t" + md.getResultSetHoldability() + "\n" +
				"Schema Term\t\t=\t" + md.getSchemaTerm() + "\n" +
				"Search String Excape\t=\t" + md.getSearchStringEscape() + "\n" +
				"SQL Keywords\t\t=\t" + md.getSQLKeywords() + "\n" +
				"SQL StateType\t\t=\t" + md.getSQLStateType() + "\n" +
				"String Functions\t=\t" + md.getStringFunctions() + "\n" +
				"System Functions\t=\t" + md.getSystemFunctions() + "\n" +
				"Schemas\t\t\t=\t" + md.getSchemas() + "\n" +
				"TimeDate Functions\t=\t" + md.getTimeDateFunctions() + "\n" +
				"URL\t\t\t=\t" + md.getURL() + "\n" +
				"UserName\t\t=\t" + md.getUserName() + "\n" +
				"hashCode\t\t=\t" + md.hashCode() + "\n" +
				"toString\t\t=\t" + md.toString() +"\n";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}
}