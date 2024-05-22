%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parse.tab.h" 
%}

%%

"<!DOCTYPE html>" { return DOCTYPE; }
"<html>" { return HTML_BODY_OPEN; }
"</html>" { return HTML_BODY_CLOSE; }
"<head>" { return HEAD_OPEN; }
"</head>" { return HEAD_CLOSE; }
"<title>" { return TITLE_OPEN; }
"</title>" { return TITLE_CLOSE; }
"<body>" { return BODY_OPEN; }
"</body>" { return BODY_CLOSE; }
"<meta" { return META; }
"<" { return OPEN_TAG; }
"</" { return CLOSE_TAG; }
">" { return CLOSE; }
[a-zA-Z][a-zA-Z0-9_]* { printf("Returned TEXT: %s\n", yytext); return TEXT; }
[0-9]+ { printf("Returned DIGIT: %s\n", yytext); return DIGIT; }
"=" { return EQUAL; }
\"[^\"]*\" { printf("Returned QUOTED_STRING: %s\n", yytext); return QUOTED_STRING; }
[ \t\n]+ ; // ignore whitespaces

%%

int yywrap() {
    return 1;
}
