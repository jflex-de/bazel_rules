package jflex.examples.nested_grammar;

%%

%unicode
%public
%class NestedRulesScanner
%type Token

%%

"foo" { return Token.FOO; }
%include extra-jflex-rules.inc.jflex
"bar" { return Token.BAR; }

[^] { }

<<EOF>> { return Token.EOF; }
