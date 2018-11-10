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

package jflex.examples.jacc_calculator;

import jflex.examples.calculator.CalculatorParserException;

/**
 * A simple lexer/parser for basic arithmetic expressions.
 *
 * @author Régis Décamps
 */

%%


%public
%class CalculatorLexer
%int

%unicode

%{
    private int     token;
    private IntExpr yylval;

    /**
     * Returns the token code for the current lexeme.
     */
    int getToken() {
      return token;
    }

    /**
     * Returns the semantic value for the current lexeme.
     */
    IntExpr getSemantic() {
      return yylval;
    }
%}

// A (integer) number is a sequence of digits.
Number         = [0-9]+

// A line terminator is a \r (carriage return), \n (line feed), or \r\n. */
LineTerminator = \r|\n|\r\n

/* White space is a line terminator, space, tab, or line feed. */
WhiteSpace     = {LineTerminator} | [ \t\f]


%%

// This section contains regular expressions and actions, i.e. Java code, that will be executed when
// the scanner matches the associated regular expression.


// YYINITIAL is the initial state at which the lexer begins scanning.
<YYINITIAL> {

    /* Create a new parser symbol for the lexem. */
    "+"                { return token = '+'; }
    "*"                { return token = '*'; }
    "("                { return token = '('; }
    ")"                { return token = ')'; }

    // If an integer is found, return the token NUMBER that represents an integer and the value of
    // the integer that is held in the string yytext
    {Number}           { yylval = new IntExpr(Integer.valueOf(yytext())); return token = INTEGER; }

    /* Don't do anything if whitespace is found */
    {WhiteSpace}       { /* do nothing with space */ }
}


/* Catch-all the rest, i.e. unknow character. */
[^]  { throw new CalculatorParserException("Illegal character <" + yytext() + ">"); }
