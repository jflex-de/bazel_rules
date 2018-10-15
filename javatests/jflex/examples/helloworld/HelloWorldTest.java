/*
 * Copyright (C) 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
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

/**
 * Test for {@link HelloWorld} lexer.
 *
 * @author Régis Décamps
 */
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
