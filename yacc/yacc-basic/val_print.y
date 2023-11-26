%{
	#include <stdio.h>
	#include <ctype.h>
	void yyerror(char const *s);
	int yylex();
%}
%token NUMBER STRING
%%
print: print word
	| word
	;
word:	NUMBER {printf("number : %d\n", yylval);}
 	| STRING {printf("string : %s\n", yylval);}
	;
%%
void yyerror(char const *s) {
	puts(s);
}

int yylex()
{
	char ch, str[256];

	while ((ch=getchar())==' ' || ch=='\t')
		; 	//skip
	if (ch == '\n')
		return 0;
	else if (isdigit(ch)) {
		ungetc(ch, stdin);
		fscanf(stdin, "%d", &yylval);
		return NUMBER;
	} else if (isalpha(ch)) {
		ungetc(ch, stdin);
		yylval = gets(str);	//fscanf(stdin, "%s", yylval); --> Error!
		return STRING;
	}
}

int main() {
	yyparse();
	return 0;
}
