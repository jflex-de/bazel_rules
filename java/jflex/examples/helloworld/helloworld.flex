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

/**
 * This is the "Hello world" for a lexer.
 *
 * <p>The lexer reads an input of the following simple syntax:
 * <ul>
 *   <li>if the line starts by "{@code name}", then the name is saved in memory
 *   <li>if the line is "{@code hello}" or "{@code hello}", then it prints on the standard output
 *       "{@code hello <name>!}".
 * </ul>
 * @author Gerwin Klein lsf@jflex.de
 * @author Régis Décamps regisd@google.com
 */


%%


%public
%class HelloWorld
%standalone

%unicode

// A name is a non-empty sequence of letters.
// Note: `:letter:` is a predefined macro that corresponds to any Unicode letter.
NAME = [:letter:]([:letter:]|[ ])*

NL = \r | \n | \r\n

%{
  private String name = "World";
%}


%%

// Save the name in the private `name` field.
"name " {NAME} {NL} {
    // Remove the "name " prefix
    name = yytext().substring("name ".length());
    // Also remove the leading {NL} that was matched.
    // A more advanced technique would be to start a lexer state.
    name= name.trim();
}

// Output the last name.
[Hh] "ello" {
    System.out.print(String.format("Hello %s!", name));
}
