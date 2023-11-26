%{
	/* 주석 인식 */
	#include <stdio.h>
%}
C [^\n\*]
STAR [\*]
BEGIN1 "//"
BEGIN2 "/\*"
END "\*/"
%%
{BEGIN1}{C}* {printf("\t%s -> // 주석\n", yytext);}
{BEGIN2}{C}*{END} {printf("\t%s -> /**/주석\n", yytext);}
. ; //skip
%%
int yywrap() { return 1; }

int main()
{
	yylex();
	return 0;
}