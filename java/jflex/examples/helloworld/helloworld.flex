// Copyright (C) 1998-2018
// All rights reserved.
// License: BSD

package jflex.examples.helloworld;

/**
 * This is the "Hello world" for a simple example of a standalone text substitution scanner.
 *
 * <p>The scanner reads a name after the keyword "{@code name}" and substitutes all occurrences
 *  of "{@code hello}" with "{@code hello <name>!}".
 *
 * @author Gerwin Klein lsf@jflex.de
 * @author Régis Décamps regisd@google.com
 */


%%


%public
%class HelloWorld
%standalone

%unicode

// A name is a non-empty sequence of letters. :letter: is a predefined macro that corresponds to any
// Unicode letter.
NAME=[:letter:]([:letter:]|[ ])*

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
    // A more advanced technique to do this would be to start a lexer state.
    name= name.trim();
}

// Output the last name.
[Hh] "ello" {
    System.out.print(String.format("Hello %s!", name));
}
