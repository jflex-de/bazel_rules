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
NAME=[:letter:]+

%{
  private String name = "World";
%}


%%

// Save the name in the private `name` field.
"name " {NAME}    { name = yytext().substring("name ".length()); }
// Output the last name.
[Hh] "ello"       { System.out.print(String.format("Hello %s", name)); }
