%{
	#include <stdio.h>
%}
%%
. | \n { printf(%s\n, yytext); }
%%
int yywrap() { return 1; }

int main()
{
	yylex();
	return 0;
}
