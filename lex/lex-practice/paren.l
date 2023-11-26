%{
/*
	Check if parenthesis matches or not.
*/
#include <stdio.h>

int angle = 0, brace = 0, bracket = 0, paren = 0;
%}
%%
"("	paren++;
")"	paren--;
"<"	angle++;
">"	angle--;
"{"	brace++;
"}"	brace--;
"["	bracket++;
"]"	bracket--;
.	;
%%
int yywrap() { return 1; }

int main()
{
	yylex();

	if (!angle && !brace && !bracket && !paren) {
		puts("OK");
		return 0;
	}

	if (angle)
		puts("ERROR: <>");
	if (brace)
		puts("ERROR: {}");
	if (bracket)
		puts("ERROR: []");
	if (paren)
		puts("ERROR: ()");

	return 0;
}
