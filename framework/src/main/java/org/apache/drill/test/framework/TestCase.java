package org.apache.drill.test.framework;

/**
 * Created by rchallapalli on 4/20/16.
 */
public interface TestCase {
  TestCaseModeler getTestCaseModeler();
  String getQueryFilename();
  String getExpectedFilename();
  String getOutputFileName();
}
