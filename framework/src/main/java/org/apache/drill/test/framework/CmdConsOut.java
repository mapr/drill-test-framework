package org.apache.drill.test.framework;

public class CmdConsOut{
  public int exitCode;
  public String consoleOut;
  public String consoleErr;
  public String cmd;


  @Override
  public String toString() {
    return "\"CmdConsOut\":{\n" +
            "\"command\":\"" + (cmd != null ? cmd : "") + "\",\n" +
            "\"exitCode\":" + exitCode + ",\n" +
            "\"output\":\"" + (consoleOut != null ? consoleOut : "") + "\",\n" +
            "\"error\":\"" + (consoleErr != null ? consoleErr : "") + "\"\n" +
            "}\n";
  }
}