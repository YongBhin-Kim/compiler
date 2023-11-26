%{
	#include <stdio.h>
%}
%%
a*b	{ printf("a...b\n"); }
b*a	{ printf("b...a\n"); }
c*	{ printf("c...\n"); }
ab*	{ printf("ab...\n"); }
.*	{ printf("none of above\n"); }
%%
int yywrap()
{
	return 1;
}

int main()
{
	yylex();
	return 0;
}
