package jflex.examples.helloworld;

import org.junit.Test;

/**
 * Test for {@link HelloWorld} lexer.
 */
public class HelloWorldTest {

  /**
   * Integration test for the lexer.
   */
  @Test
  public void testLexer() {
    HelloWorld.main(new String[]{"jflex/examples/helloworld/testdata.txt"});
  }
}
