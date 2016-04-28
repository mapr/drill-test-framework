package org.apache.drill.test.framework;

/**
 * Created by rchallapalli on 4/20/16.
 */
public class ClonedDrillTestCase implements TestCase {
  private final DrillTestCase testCase;
  private final int cloneIndex;

  public ClonedDrillTestCase(DrillTestCase testCase, int cloneIndex) {
    this.testCase = testCase;
    this.cloneIndex = cloneIndex;
  }

  public String getQueryFilename() {
    return testCase.getQueryFilename();
  }

  public String getOutputFileName() {
    if (cloneIndex == 1) {
      return getQueryFilename();
    } else {
      String inputFilename = getQueryFilename();
      int index = inputFilename.lastIndexOf('/');
      String queryName = inputFilename.substring(index + 1);
      String[] queryInfo = queryName.split("\\.");
      return inputFilename.substring(0, index+1) + queryInfo[0] + "_" + cloneIndex + "." + queryInfo[1];
    }
  }

  public String getExpectedFilename() {
    return testCase.getExpectedFilename();
  }

  public TestCaseModeler getTestCaseModeler() {
    return testCase.getTestCaseModeler();
  }
}
