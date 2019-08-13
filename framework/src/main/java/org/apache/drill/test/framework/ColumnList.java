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

import org.apache.drill.test.framework.TestCaseModeler.TestMatrix;

import java.math.BigDecimal;
import java.sql.Types;
import java.util.List;

/**
 * Class modeling a row in a ResultSet. It also stores a values of types of each
 * cell shared by all rows in a given ResultSet.
 * 
 * 
 */
public class ColumnList {
  private final List<Object> values;
  private final List<Integer> types;
  private final TestMatrix matrix;
  private final boolean Simba;
  public static final String SIMBA_JDBC = "sjdbc";

  public ColumnList(List<Integer> types, List<Object> values) {
    this(types, values, null);
  }

  public ColumnList(List<Integer> types, List<Object> values, TestMatrix matrix) {
    this.values = values;
    this.types = types;
    this.matrix = matrix;
    if (TestDriver.cmdParam.driverExt != null &&
        TestDriver.cmdParam.driverExt.equals(ColumnList.SIMBA_JDBC)) {
      this.Simba = true;
    }
    else {
      this.Simba = false;
    }
  }

  public List<Object> getValues() {
    return values;
  }

  /**
   * Overrides the equals() method in Object that compares two objects using the
   * "loosened" logic to handle float, double and decimal types. The algorithm
   * used for the comparison follows:
   * 
   * Floats: f1 equals f2 iff |((f1-f2)/(average(f1,f2)))| < 0.000001
   * 
   * Doubles: d1 equals d2 iff |((d1-d2)/(average(d1,d2)))| < 0.000000000001
   * 
   * Decimals: dec1 equals dec2 iff value(dec1) == value(dec2) and scale(dec1)
   * == scale(dec2)
   */
  @Override
  public boolean equals(Object object) {
    return compare(this, (ColumnList) object);
  }

  @Override
  public int hashCode() {
    if (values == null || types == null) {
      return 0;
    }
    int hash = 3;
    for (int i = 0; i < types.size(); i++) {
      if (values.get(i) == null) {
        continue;
      }
      int type = (Integer) (types.get(i));
      switch (type) {
      case Types.FLOAT:
      case Types.DOUBLE:
      case Types.DECIMAL:
      case Types.REAL:
        break;
      default:
        hash += values.get(i).hashCode();
        break;
      }
    }
    return hash;
  }

  /**
   * String representation of the ColumnList object
   */
  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    for (int i = 0; i < values.size() - 1; i++) {
      int type = (Integer) (types.get(i));
      if (Simba && (type == Types.VARCHAR)) {
        String s1 = String.valueOf(values.get(i));
        // if the field has a JSON string or list, then remove newlines so that
        // each record fits on a single line in the actual output file.
        // sometimes Drill returns records in different orders, and by
        // ensuring each reoord is on a single line, they can be matched in any
        // order
        if ((s1.length() > 0) &&
           ((s1.charAt(0) == '{') || (s1.charAt(0) == '[')) ) {
          s1 = Utils.removeNewLines(s1);
          values.set(i, s1);
        }
      }
      sb.append(values.get(i) + "\t");
    }
    int type = (Integer) (types.get(values.size()-1));
    if (Simba && (type == Types.VARCHAR)) {
      String s1 = String.valueOf(values.get(values.size()-1));
      // if the field has a JSON string or list, then remove newlines so that
      // each record fits on a single line in the actual output file.
      // sometimes Drill returns records in different orders, and by
      // ensuring each reoord is on a single line, they can be matched in any
      // order
      if ((s1.length() > 0) &&
         ((s1.charAt(0) == '{') || (s1.charAt(0) == '[')) ) {
        s1 = Utils.removeNewLines(s1);
        values.set(values.size()-1, s1);
      }
    }
    sb.append(values.get(values.size() - 1));
    return sb.toString();
  }

  private boolean compare(ColumnList o1, ColumnList o2) {
    List<Object> list1 = o1.values;
    List<Object> list2 = o2.values;
    if (list1.size() != list2.size()) return false;
    for (int i = 0; i < list1.size(); i++) {
      if (types == null || types.size() == 0) {
        if (!list1.get(i).equals(list2.get(i))) return false;
        continue;
      }
      if (bothNull(list1.get(i), list2.get(i))) {
        continue;
      }
      if (oneNull(list1.get(i), list2.get(i))) {
        return false;
      }
      int type = (Integer) (types.get(i));
      try {
        switch (type) {
        case Types.FLOAT:
        case Types.REAL:
          float f1 = (Float) list1.get(i);
          float f2 = (Float) list2.get(i);
          if ((f1 + f2) / 2 != 0) {
            return (Math.abs((f1 - f2) / ((f1 + f2) / 2)) < matrix.floatPrecision);
          } else if (f1 != 0) {
            return false;
          }
          break;
        case Types.DOUBLE:
          Double d1 = (Double) list1.get(i);
          Double d2 = (Double) list2.get(i);
          // first we check strictly if two Doubles are equal,
          // especially for the cases when doubles are NaN / POSITIVE_INFINITY / NEGATIVE_INFINITY
          // otherwise proceed with "loosened" logic
          if (!d1.equals(d2)) {
            if ((d1 + d2) / 2 != 0) {
              return (Math.abs((d1 - d2) / ((d1 + d2) / 2)) < matrix.doublePrecision);
            } else if (d1 != 0) {
              return false;
            }
          }
          break;
        case Types.DECIMAL:
          BigDecimal bd1 = (BigDecimal) list1.get(i);
          BigDecimal bd2 = (BigDecimal) list2.get(i);
          if (!(bd1.compareTo(bd2) == 0)) return false;
          break;
        default:
          if (!(list1.get(i).equals(list2.get(i)))) return false;
          break;
        }
      } catch (Exception e) {
        if (!(list1.get(i).equals(list2.get(i)))) return false;
      }
    }
    return true;
  }

  public static boolean bothNull(Object obj1, Object obj2) {
    return (obj1 == null && obj2 == null);
  }

  public static boolean oneNull(Object obj1, Object obj2) {
    return ((obj1 == null && obj2 != null) || (obj1 != null && obj2 == null));
  }
}
