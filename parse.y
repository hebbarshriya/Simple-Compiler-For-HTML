%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
extern FILE* yyin;
%}

%token DOCTYPE HTML_BODY_OPEN HTML_BODY_CLOSE HEAD_OPEN HEAD_CLOSE TITLE_OPEN TITLE_CLOSE BODY_OPEN BODY_CLOSE META OPEN_TAG 
CLOSE_TAG CLOSE TEXT DIGIT EQUAL 
QUOTED_STRING

%%

html_doc: DOCTYPE html_body { printf("HTML Document recognized!\n"); } 
        | html_body
        ;

html_body: HTML_BODY_OPEN head body HTML_BODY_CLOSE { printf("HTML Body recognized!\n"); }
        ;

head: HEAD_OPEN head_content HEAD_CLOSE { printf("Head recognized!\n"); }
        | /* ε */ {printf("No head\n");}
        ;

head_content:  head_element head_content{ printf("Head content recognized!\n"); }
            | /* ε */ 
            ;

head_element: TITLE_OPEN string TITLE_CLOSE { printf("Title recognized!\n"); }
            | META attributes CLOSE{ printf("Meta recognized!\n"); }
            ;

string : TEXT string | DIGIT string | ;

body: BODY_OPEN body_content BODY_CLOSE { printf("Body recognized!\n"); }
        ;

body_content: open content close body_content { printf("Body content recognized!\n"); }
            | /* ε */ 
            ;


open: OPEN_TAG TEXT CLOSE;
close: CLOSE_TAG TEXT CLOSE;

content: open content close
        | string 
        ;


attributes: attribute attributes { printf("Attributes recognized!\n"); }
        | /* ε */ 
        ;

attribute: attr_name EQUAL attr_value 
        ;

attr_name: TEXT { printf("Attribute"); }
        ;

attr_value: QUOTED_STRING 
          | unquoted_string 
        ;

unquoted_string: TEXT 
        ;


%%

void yyerror(const char *s) {
    fprintf(stderr, "Error!!\n");
}

int main() {
    char name[100];
    printf("Enter file name: ");
    scanf("%s", name);
    yyin = fopen(name, "r");
    do {
        if (yyparse()) {
            printf("Failure\n");
            exit(0);
        }
    } while (!feof(yyin));
    printf("SUCCESS\n");
    return 0;
}
