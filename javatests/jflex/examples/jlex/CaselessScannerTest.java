package jflex.examples.jlex;

import static com.google.common.truth.Truth.assertThat;

import com.google.common.io.CharSource;
import java.io.IOException;
import org.junit.After;
import org.junit.Test;

public class CaselessScannerTest {

  /** The moder JFlex scanner. */
  private CaselessJflexScanner jflexScanner;
  /** The scanner with JLex compatibility. */
  private CaselessLexScanner lexScanner;

  @Test
  public void singleChar_lower() throws Exception {
    initScanners("a");
    assertThat(jflexScanner.yylex()).isEqualTo(Token.A);
    assertThat(lexScanner.yylex()).isEqualTo(Token.A);
  }

  @Test
  public void singleChar_upper() throws Exception {
    initScanners("A");
    assertThat(jflexScanner.yylex()).isEqualTo(Token.A);
    assertThat(lexScanner.yylex()).isEqualTo(Token.A);
  }

  @Test
  public void singleWord_lower() throws Exception {
    initScanners("hello");
    assertThat(jflexScanner.yylex()).isEqualTo(Token.HELLO);
    assertThat(lexScanner.yylex()).isEqualTo(Token.HELLO);
  }

  @Test
  public void singleWord_upper() throws Exception {
    initScanners("HELLO");
    assertThat(jflexScanner.yylex()).isEqualTo(Token.HELLO);
    assertThat(lexScanner.yylex()).isEqualTo(Token.HELLO);
  }

  @Test
  public void singleWord_mixed() throws Exception {
    initScanners("HelLo");
    assertThat(jflexScanner.yylex()).isEqualTo(Token.HELLO);
    assertThat(lexScanner.yylex()).isEqualTo(Token.HELLO);
  }

  @Test
  public void wordInSentence() throws Exception {
    initScanners("x hello x");

    assertThat(jflexScanner.yylex()).isEqualTo(Token.WORD);
    assertThat(jflexScanner.yylex()).isEqualTo(Token.HELLO);
    assertThat(jflexScanner.yylex()).isEqualTo(Token.WORD);

    assertThat(lexScanner.yylex()).isEqualTo(Token.WORD);
    assertThat(lexScanner.yylex()).isEqualTo(Token.HELLO);
    assertThat(lexScanner.yylex()).isEqualTo(Token.WORD);
  }

  /** JFlex and Jlex compatibility behaviors differ when "hello" is withing a large string. */
  @Test
  public void helloWithinWord() throws Exception {
    initScanners("blubHELLObla");

    assertThat(jflexScanner.yylex()).isEqualTo(Token.WORD);
    assertThat(jflexScanner.yylex()).isEqualTo(Token.HELLO);
    assertThat(jflexScanner.yylex()).isEqualTo(Token.WORD);

    assertThat(lexScanner.yylex()).isEqualTo(Token.WORD);
  }

  @Test
  public void helloWithinWord_mixedCase() throws Exception {
    initScanners("sdfahelLobla");

    assertThat(jflexScanner.yylex()).isEqualTo(Token.WORD);
    assertThat(jflexScanner.yylex()).isEqualTo(Token.OTHER);
    assertThat(jflexScanner.yylex()).isEqualTo(Token.WORD);

    assertThat(lexScanner.yylex()).isEqualTo(Token.WORD);
  }

  @Test
  public void other() throws Exception {
    initScanners("xhellox");
    assertThat(jflexScanner.yylex()).isEqualTo(Token.WORD);
    assertThat(lexScanner.yylex()).isEqualTo(Token.WORD);
  }

  @After
  public void resetJflexScanner() throws Exception {
    assertThat(jflexScanner.yylex()).isNull();
    assertThat(lexScanner.yylex()).isNull();
    jflexScanner = null;
    lexScanner = null;
  }

  private void initScanners(String content) throws IOException {
    jflexScanner = new CaselessJflexScanner(CharSource.wrap(content).openStream());
    lexScanner = new CaselessLexScanner(CharSource.wrap(content).openStream());
  }
}
