/*
	Calculator program: +, -, *, /, and parenthesis.
	Variable 'a'-'z' is allowed.
*/
%{
#include <stdio.h>
#include <ctype.h>
void yyerror();
int yylex();

double mem[26];	/* memory for var a-z */
%}
%union {	/* stack type */
	double val;	/* value */
	int index;	/* index of mem[] */
}
%token	<val>	NUMBER	/* NUMBER --> element of 'val' of union */
%token	<index>	VAR
%type	<val>	expr
%right	'='
%left	'+' '-'	/* left assoc. -- same priority */
%left	'*' '/'	/* left assoc. -- same priority */
%nonassoc	UNARYMINUS
%%
list:	/* empty */
	| list '\n'
	| list expr '\n'	{
		printf("\t= %.8g\n", $2);	/* result of calculation */
		mem['p'-'a'] = $2; }	/* result is saved at var. 'p' */
	;
expr: NUMBER	{ $$ = $1; }
	| VAR			{ $$ = mem[$1]; }
	| VAR '=' expr	{ $$ = mem[$1] = $3; }
	| '-' expr %prec UNARYMINUS	{ $$ = -$2; }
	| expr '+' expr	{ $$ = $1 + $3; }
	| expr '-' expr	{ $$ = $1 - $3; }
	| expr '*' expr	{ $$ = $1 * $3; }
	| expr '/' expr	{
		if ($3 == 0.0) fprintf(stderr, "Error: division by zero\n");
		$$ = $1 / $3; }
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
		scanf("%lf", &yylval.val);
		return NUMBER;
	}
	if (islower(c)) {
		yylval.index = c - 'a';
		return VAR;
	}
	if (c == '\n') lineno++;

	return c;
}

int main()
{
	yyparse();
	return 0;
}
