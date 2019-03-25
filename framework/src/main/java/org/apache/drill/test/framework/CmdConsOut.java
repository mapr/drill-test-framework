package org.apache.drill.test.framework;

public class CmdConsOut{
  public int exitCode;
  public String consoleOut;
  public String consoleErr;
  public String cmd;


  @Override
  public String toString() {
    return "\"CmdConsOut\":{\n" +
            "\t\"command\":\"" + (cmd != null ? cmd : "") + "\",\n" +
            "\t\"exitCode\":" + exitCode + ",\n" +
            "\t\"output\":\"" + (consoleOut != null ? consoleOut : "") + "\",\n" +
            "\t\"error\":\"" + (consoleErr != null ? consoleErr : "") + "\"\n" +
            "}\n";
  }
}