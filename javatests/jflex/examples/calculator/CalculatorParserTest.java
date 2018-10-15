package jflex.examples.calculator;

import static com.google.common.truth.Truth.assertThat;
import static org.junit.Assert.fail;

import java.io.StringReader;
import java_cup.runtime.Symbol;
import org.junit.Test;

public class CalculatorParserTest {
  @Test
  public void test() throws Exception {
    CalculatorParser parser = createParser("1 + 2 + (3 + 4) * 5 + 6");
    Symbol symbol = parser.parse();
    assertThat(symbol.value).isEqualTo(1 + 2 + (3 + 4) * 5 + 6);
  }

  /** The lexer is happy producing tokens for this input, but this is invalid for the grammar. */
  @Test
  public void test_invalidSyntax() throws Exception {
    final String input = "1 + (3";
    CalculatorLexer lexer = createLexer(input);
    lexer.next_token(); // 1
    lexer.next_token(); // +
    lexer.next_token(); // (
    lexer.next_token(); // 3
    lexer.next_token(); // EOF
    CalculatorParser parser = createParser(input);
    try {
      parser.parse();
      fail("The parser should not accept input: " + input);
    } catch (Exception expected) {
      // The default report_fatal_error throws a generic Exception.
    }
  }

  private CalculatorLexer createLexer(String input) {
    return new CalculatorLexer(new StringReader(input));
  }

  private CalculatorParser createParser(String input) {
    return new CalculatorParser(createLexer(input));
  }
}
