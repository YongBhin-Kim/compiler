%{
	/* C 언어의 변수 인식 */
	#include <stdio.h>
%}

LETTER [a-zA-Z]
DIGIT [0-9]
UNDERBAR _
%%
“이 부분을 완성하시오.” { printf("\t%s -> variable\n", yytext); }
. ; //skip
%%
int yywrap() { return 1; }

int main()
{
	yylex();
}
