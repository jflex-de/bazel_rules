package jflex.examples.jlex;

import static com.google.common.truth.Truth.assertThat;

import com.google.common.io.CharSource;
import java.io.IOException;
import org.junit.After;
import org.junit.Test;

class CaselessScannerTest {

  private CaselessJflexScanner jflexScanner;

  @Test
  public void singleChar_lower() throws Exception {
    String content = "a";
    jflexScanner = createJflexScanner(content);
    assertThat(jflexScanner.yylex()).isEqualTo(Token.A);
  }

  @Test
  public void singleChar_upper() throws Exception {
    String content = "A";
    jflexScanner = createJflexScanner(content);
    assertThat(jflexScanner.yylex()).isEqualTo(Token.A);
  }

  @Test
  public void singleWord_lower() throws Exception {
    String content = "hello";
    jflexScanner = createJflexScanner(content);
    assertThat(jflexScanner.yylex()).isEqualTo(Token.HELLO);
  }

  @Test
  public void singleWord_upper() throws Exception {
    String content = "HELLO";
    jflexScanner = createJflexScanner(content);
    assertThat(jflexScanner.yylex()).isEqualTo(Token.HELLO);
  }

  @Test
  public void singleWord_mixed() throws Exception {
    String content = "HelLo";
    jflexScanner = createJflexScanner(content);
    assertThat(jflexScanner.yylex()).isEqualTo(Token.HELLO);
  }

  @Test
  public void wordInSentence() throws Exception {
    String content = "x hello x";
    jflexScanner = createJflexScanner(content);
    for (int i = 0; i < 6; i++) {
      assertThat(jflexScanner.yylex()).isEqualTo(Token.OTHER);
    }
  }

  @Test
  public void other() throws Exception {
    String content = "xhellox";
    jflexScanner = createJflexScanner(content);
    for (int i = 0; i < 6; i++) {
      assertThat(jflexScanner.yylex()).isEqualTo(Token.OTHER);
    }
  }

  @After
  public void resetJflexScanner() throws Exception {
    assertThat(jflexScanner.yylex()).isEqualTo(null);
    jflexScanner = null;
  }

  static CaselessJflexScanner createJflexScanner(String content) throws IOException {
    return new CaselessJflexScanner(CharSource.wrap(content).openStream());
  }
}
