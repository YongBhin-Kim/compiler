%{
#include <stdio.h>
%}

DIGIT [0-9]
SIGN [+-]?

%%
{SIGN}{DIGIT}+       { printf("정수: %s\n", yytext); }
{SIGN}              { printf("부호: %s\n", yytext); }
[-+*/\(\)]          { printf("연산자 또는 괄호: %s\n", yytext); }
[ \t\n]             ; // 공백 문자는 무시
.                   { printf("올바르지 않은 문자: %s\n", yytext); }

%%
int yywrap(){ return 1; }
int main() {
    yylex();
    return 0;
}
