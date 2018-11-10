// Copyright 2018 Google LLC.
// SPDX-License-Identifier: Apache-2.0

package jflex.examples.cup_calculator;

/** An exception from the lexer/parser. */
public class CalculatorParserException extends RuntimeException {
  CalculatorParserException(String message) {
    super(message);
  }
}
