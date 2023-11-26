%{
	/* phone_numbers: ex) 02-123-1234 */
	#include <stdio.h>
	#include <ctype.h>
	void yyerror(char const *s);
	int yylex();
%}
%token NUMBER HYPHEN
%%
phone_number: number HYPHEN number HYPHEN number { printf("phone number"); }
	;
number : number NUMBER
	| NUMBER
	;
%%

void yyerror(char const *s) {
	puts(s);
}

int yylex()
{
	int ch;

	ch = getchar();
	if (ch == '\n') 
		return 0;
	else if (isdigit(ch))
		return NUMBER;
	else if (ch == '-')
		return HYPHEN;
	return 0;
}

int main() {
	yyparse();
	return 0;
}
