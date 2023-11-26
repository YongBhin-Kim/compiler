/*
	E -> E + T | T
	T -> T * F | F
	F -> ( E ) | digit
*/
%{
#include <stdio.h>
#include <ctype.h>
int yylex();
void yyerror();
%}
%token DIGIT
%%
line : expr						{ printf("%d\n", $1); }
       ;
expr : expr '+' term	{ $$ = $1 + $3; }
       | term					{ $$ = $1; }
       ;
term : term '*' factor { $$ = $1 * $3; }
       | factor				{ $$ = $1; }
       ;
factor : '(' expr ')'	{ $$ = $2; }
       | DIGIT				{ $$ = $1; }
       ;
%%
void yyerror(char *s)	{ printf("%s\n", s); }

int yylex()
{
    int c;
    c = getchar();
    if ( isdigit( c ) ) {
        yylval = c - '0';
        return DIGIT;
    }
    if (c == '\n' || c == '\r') return 0;
    return c;
}

int main()
{
	yyparse();
	return 0;
}