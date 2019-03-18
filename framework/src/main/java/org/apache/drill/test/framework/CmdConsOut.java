package org.apache.drill.test.framework;

public class CmdConsOut{
  public int exitCode;
  public String consoleOut;
  public String consoleErr;
  public String cmd;


  @Override
  public String toString() {
    return "\"CmdConsOut\":{\n" +
            "\t\"cmd\":\"" + (cmd != null ? cmd : " ") + "\",\n" +
            "\t\"exitCode\":" + exitCode + ",\n" +
            "\t\"consoleOut\":\"" + (consoleOut != null ? consoleOut : " ") + "\",\n" +
            "\t\"consoleErr\":\"" + (consoleErr != null ? consoleErr : " ") + "\"\n" +
            "}\n";
  }
}