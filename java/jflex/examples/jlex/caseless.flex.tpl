package jflex.examples.jlex;

%%

%public
%class {className}
%type Token

%unicode

%ignorecase

SP = \r|\n|\r\n|\s

%%

a          { return Token.A; }
"hello"    { return Token.HELLO; }
[a-z]+     { return Token.WORD; }

{SP}       { /* skip */ }
.          { return Token.OTHER; }
