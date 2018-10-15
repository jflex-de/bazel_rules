package jflex.examples.calculator;

import  com.google.common.truth.ThrowableSubject;
;
import static com.google.common.truth.Truth.assertThat;
import static com.google.common.truth.Truth.assertWithMessage;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;
import java_cup.runtime.Symbol;
import org.junit.After;
import org.junit.Test;

/**
 * Test for the generated {@link CalculatorLexer}.
 */
public class CalculatorLexerTest {

  private CalculatorLexer lexer;

  @After
  public void destroyLexer() {
    lexer = null;
  }

  @Test
  public void test() throws IOException {
    lexer = createLexer("1 + 2 - * (3)");
    assertThatNextTokenIsEqualTo(Calc.NUMBER, 1);
    assertThatNextTokenIsEqualTo(Calc.PLUS);
    assertThatNextTokenIsEqualTo(Calc.NUMBER, 2);
    assertThatNextTokenIsEqualTo(Calc.MINUS);
    assertThatNextTokenIsEqualTo(Calc.MULTIPLY);
    assertThatNextTokenIsEqualTo(Calc.LPAR);
    assertThatNextTokenIsEqualTo(Calc.NUMBER, 3);
    assertThatNextTokenIsEqualTo(Calc.RPAR);
    assertThatNextTokenIsEqualTo(Calc.EOF);
  }

  @Test
  public void test_emptyInput() throws IOException {
    lexer = createLexer("");
    assertThatNextTokenIsEqualTo(Calc.EOF);
  }

  /**
   * Tests that the action {@code [^]} from the grammar handles unknown tokens.
   */
  @Test
  public void test_illegalInput() throws IOException {
    lexer = createLexer("aze");
    try {
      lexer.next_token();
      fail("The lexer should throw a " + CalculatorParserException.class);
    } catch (CalculatorParserException e) {
      assertThat(e).hasMessageThat().isEqualTo("Illegal character <a>");
    }}

  private void assertThatNextTokenIsEqualTo(int symbol, Object value) throws IOException {
    Symbol token = lexer.next_token();
    assertWithMessage("The symbol should be of type " + symbol).that(token.sym).isEqualTo(symbol);
    assertWithMessage(String.format("The symbol should have value %s",value)).that(token.value)
        .isEqualTo(value);
  }

  private void assertThatNextTokenIsEqualTo(int symbol) throws IOException {
    Symbol token = lexer.next_token();
    assertWithMessage("The symbol should be of type " + symbol).that(token.sym).isEqualTo(symbol);
  }

  private CalculatorLexer createLexer(String input) {
    Reader in = new StringReader(input);
    return new CalculatorLexer(in);
  }
}
