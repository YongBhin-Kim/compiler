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
%nonassoc	UNARYMINUS
%%
list:	/* empty */
	| list '\n'
	| list expr '\n'	{ printf("\t= %.8g\n", $2); }
	;
expr: NUMBER	{ $$ = $1; }
	| '-' expr %prec UNARYMINUS	{ $$ = -$2; }
	| expr '+' expr	{ $$ = $1 + $3; }
	| expr '-' expr	{ $$ = $1 - $3; }
	| expr '*' expr	{ $$ = $1 * $3; }
	| expr '/' expr	{ $$ = $1 / $3; }
	| '(' expr ')'	{ $$ = $2; }
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
