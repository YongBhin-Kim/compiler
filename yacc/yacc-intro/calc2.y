%{
	#include <stdio.h>
	#include <ctype.h>
	int yylex();
	void yyerror();
%}
%token NUMBER
%%
stmt: expression {printf("= %d\n", $1);}
	;
expression: expression '+' NUMBER {$$ = $1 + $3;}
	| expression '*' NUMBER {$$ = $1 * $3;}
	| '(' expression ')' {$$ = $2;}
	| NUMBER {$$ = $1;}
	;
%%
int yylex()
{
	int ch;

	while ((ch=getchar())==' ' || ch=='\t')
		;	//skip
	if (ch=='\n') return 0;
	if (isdigit(ch)) {
		ungetc(ch, stdin);
		fscanf(stdin, "%d", &yylval);
		return NUMBER;
	}
	return ch;
}

void yyerror(char *s)
{
	printf("%s\n", s);
}

int main()
{
	return yyparse();
}
