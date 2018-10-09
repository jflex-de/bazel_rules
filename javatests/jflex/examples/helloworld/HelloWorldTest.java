package jflex.examples.helloworld;

import static com.google.common.base.Preconditions.checkNotNull;
import static org.junit.Assert.assertEquals;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;
import java.io.UnsupportedEncodingException;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

/** Test for {@link HelloWorld} lexer. */
public class HelloWorldTest {

  private OutputStream out;

  @Before
  public void redirectSystemOut() {
    // JFlex doesn't have a clean API yet, but it's WIP :-)
    out = new ByteArrayOutputStream();
    try {
      System.setOut(new PrintStream(out, /*autoflush=*/ true, "UTF-8"));
    } catch (UnsupportedEncodingException impossible) {
      // UTF-8 must be supported by all Java implementations.
      throw new RuntimeException(impossible);
    }
  }

  @After
  public void closeSystemOut() throws IOException {
    checkNotNull(out).close();
  }

  /** Integration test for the lexer. */
  @Test
  public void testLexer() {
    HelloWorld.main(
        new String[] {"--encoding", "UTF-8", "javatests/jflex/examples/helloworld/testdata.txt"});
    assertEquals("Hello World!\nHello John Doe!\n", out.toString());
  }
}
