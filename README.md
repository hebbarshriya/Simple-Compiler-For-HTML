## Compiler Design Project

# SIMPLE COMPILER FOR HTML

#### Project Overview
The project involves creating a simple compiler that can parse a subset of HTML documents using Flex and Bison. The compiler can recognize the structure of HTML documents and provide output based on the parsing results.

#### Grammar
The grammar defines the structure of the HTML documents that can be parsed by this compiler. Below is the grammar used in this project:

HTML_DOC → DOCTYPE HTML_BODY
DOCTYPE → <!DOCTYPE html> | E
HTML_BODY → <html> HEAD BODY </html>
HEAD → <head> HEAD_CONTENT </head> | E
HEAD_CONTENT → HEAD_ELEMENT HEAD_CONTENT | E
HEAD_ELEMENT → <title> STRING </title>| <meta ATTRIBUTES/>
BODY → <body> BODY_CONTENT </body>
BODY_CONTENT → <TEXT> CONTENT </TEXT> BODY_CONTENT | E
CONTENT → <TEXT> CONTENT </TEXT>| STRING
ATTRIBUTES → ATTRIBUTE ATTRIBUTES | E
ATTRIBUTE → ATTR_NAME = ATTR_VALUE
ATTR_NAME → TEXT
ATTR_VALUE → QUOTED_STRING | UNQUOTED_STRING
QUOTED_STRING → 'TEXT'
UNQUOTED_STRING → TEXT
STRING → TEXT STRING| DIGIT STRING | E
TEXT → [a-zA-Z][a-zA-Z0-9_]+
DIGIT → [0-9]+

#### Implementation
##### Flex Code
The Flex code is used for lexical analysis. It identifies tokens in the input HTML document and returns them to the parser.
##### Bison Code
The Bison code is used for syntax analysis. It defines the grammar rules and actions to be taken when the rules are matched.

#### Prerequisites
- Flex
- Bison
- GCC
