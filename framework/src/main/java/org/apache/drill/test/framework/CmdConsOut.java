package org.apache.drill.test.framework;

public class CmdConsOut{
  public int exitCode;
  public String consoleOut;
  public String consoleErr;
  public String cmd;


  @Override
  public String toString() {
    StringBuilder builder = new StringBuilder("\"CmdConsOut\":{\n");
    builder
            .append("\"command\":\"")
            .append((cmd != null ? cmd : ""))
            .append("\",\n")
            .append("\"exitCode\":")
            .append(exitCode)
            .append(",\n");

    if(consoleOut != null && !consoleOut.isEmpty()) {
      builder
              .append("\"output\":\"")
              .append(consoleOut)
              .append("\",\n");
    }

    if(consoleErr != null && !consoleErr.isEmpty()) {
      builder
              .append("\"error\":\"")
              .append(consoleErr)
              .append("\",\n");
    }
    builder
            .deleteCharAt(builder.length()-1)
            .deleteCharAt(builder.length()-1)
            .append("}\n");
    
    return builder.toString();
  }
}