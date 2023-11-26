%{
	/* 스트링 상수 인식 */
	#include <stdio.h>
%}
LETTER [a-zA-Z]
QUOTE \"
ESCAPE_QUOTE \\\"
%%
{QUOTE}[LETTER]+{QUOTE} { printf("\t%s -> 문자열 상수\n", yytext); }
{QUOTE}[^{QUOTE}]+{QUOTE} { printf("\t%s -> 문자열 상수\n", yytext); }
{ESCAPE_QUOTE} { printf("\t%s -> 이스케이프된 큰따옴표\n", yytext); }
. ; //skip
%%
int yywrap(){ return 1; }

int main()
{
	yylex();
	return 0;
}
