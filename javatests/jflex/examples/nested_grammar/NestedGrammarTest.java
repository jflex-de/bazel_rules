package jflex.examples.nested_grammar;

import static com.google.common.truth.Truth.assertThat;

import com.google.common.io.CharSource;
import java.io.IOException;
import org.junit.After;
import org.junit.Test;

public class NestedGrammarTest {

  private NestedRulesScanner scanner;

  @After
  public void eof() throws Exception {
    assertThat(scanner.yylex()).isEqualTo(Token.EOF);
  }

  @Test
  public void foo() throws Exception {
    scanner = createScanner("foo");
    assertThat(scanner.yylex()).isEqualTo(Token.FOO);
  }

  @Test
  public void bar() throws Exception {
    scanner = createScanner("bar");
    assertThat(scanner.yylex()).isEqualTo(Token.BAR);
  }

  @Test
  public void hello() throws Exception {
    scanner = createScanner("hello");
    assertThat(scanner.yylex()).isEqualTo(Token.HELLO);
  }

  @Test
  public void sentence() throws Exception {
    scanner = createScanner("foo bar hello world");
    assertThat(scanner.yylex()).isEqualTo(Token.FOO);
    assertThat(scanner.yylex()).isEqualTo(Token.BAR);
    assertThat(scanner.yylex()).isEqualTo(Token.HELLO);
  }

  private NestedRulesScanner createScanner(String content) throws IOException {
    return new NestedRulesScanner(CharSource.wrap(content).openStream());
  }
}
