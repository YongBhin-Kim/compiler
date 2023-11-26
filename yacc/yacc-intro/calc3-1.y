/*
	Calculator program: +, -, *, /, and parenthesis.
*/
%{
#include <stdio.h>
#include <ctype.h>
void yyerror();
int yylex();

#define YYSTYPE double	/* data-type for yacc stack */
%}
%token	NUMBER
%left	'+' '-'	/* left assoc. -- same priority */
%left	'*' '/'	/* left assoc. -- same priority */
%left	UNARYMINUS
%%
list:	/* empty */
	| list '\n'
	| list expr '\n'	{ printf("\t= %.8g\n", $2); }
	;
expr: NUMBER	{ $$ = $1;
		printf("Rule 1. E -> a (%.2lf)\n", yylval); }
	| '-' expr %prec UNARYMINUS	{ $$ = -$2;
		printf("Rule 1. E -> - E\n"); }
	| expr '+' expr	{ $$ = $1 + $3;
		printf("Rule 1. E -> E + E\n"); }
	| expr '-' expr	{ $$ = $1 - $3;
		printf("Rule 1. E -> E - E\n"); }
	| expr '*' expr	{ $$ = $1 * $3;
		printf("Rule 1. E -> E * E\n"); }
	| expr '/' expr	{ $$ = $1 / $3;
		printf("Rule 1. E -> E / E\n"); }
	| '(' expr ')'	{ $$ = $2;
		printf("Rule 1. E -> ( E )\n"); }
	;
%%
int lineno = 1;

void yyerror()
{
	fprintf(stderr, "Syntax error: line %d\n", lineno);
}

int yylex()
{
	int c;

	while ((c=getchar()) == ' ' || c == '\t')
		;
	if (c == EOF) return 0;

	if (c == '.' || isdigit(c)) {
		ungetc(c, stdin);
		scanf("%lf", &yylval);
		return NUMBER;
	}
	if (c == '\n') lineno++;

	return c;
}

int main()
{
	yyparse();
	return 0;
}
