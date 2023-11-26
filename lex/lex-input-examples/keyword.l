%{
	/* keyword */
	#include <stdio.h>
%}

%%
int|char|float|double|void { printf("\t%s -> keyword\n", yytext); }
. ; //skip
%%

int yywrap() { return 1; }

int main()
{
	yylex();
	return 0;
}
