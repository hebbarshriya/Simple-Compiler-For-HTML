%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parse.tab.h" // This includes the Bison generated header.
%}

%%

"<!DOCTYPE html>"    { printf("Returned DOCTYPE\n"); return DOCTYPE; }
"<html>"             { printf("Returned HTML_BODY_OPEN\n"); return HTML_BODY_OPEN; }
"</html>"            { printf("Returned HTML_BODY_CLOSE\n"); return HTML_BODY_CLOSE; }
"<head>"             { printf("Returned HEAD_OPEN\n"); return HEAD_OPEN; }
"</head>"            { printf("Returned HEAD_CLOSE\n"); return HEAD_CLOSE; }
"<title>"            { printf("Returned TITLE_OPEN\n"); return TITLE_OPEN; }
"</title>"           { printf("Returned TITLE_CLOSE\n"); return TITLE_CLOSE; }
"<body>"             { printf("Returned BODY_OPEN\n"); return BODY_OPEN; }
"</body>"            { printf("Returned BODY_CLOSE\n"); return BODY_CLOSE; }
"<meta"              { printf("Returned META\n"); return META; }
"<"                  { printf("Returned OPEN_TAG\n"); return OPEN_TAG; }
"</"                 { printf("Returned CLOSE_TAG\n"); return CLOSE_TAG; }
">"                  { printf("Returned '>'\n"); return '>'; }
[a-zA-Z][a-zA-Z0-9_]* { printf("Returned TEXT: %s\n", yytext); return TEXT; }
[0-9]+               { printf("Returned DIGIT: %s\n", yytext); return DIGIT; }
"="                  { printf("Returned EQUAL\n"); return EQUAL; }
\"[^\"]*\"           { printf("Returned QUOTED_STRING: %s\n", yytext); return QUOTED_STRING; }
[ \t\n]+             ; // ignore whitespaces

%%

int yywrap() {
    return 1;
}
