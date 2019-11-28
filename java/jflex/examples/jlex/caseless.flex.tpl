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
[a-z]+     { return Token.WORD; }
"hello"    { return Token.HELLO; }

{SP}       { return Token.SP; }
.          { return Token.OTHER; }
