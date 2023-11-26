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
word:	NUMBER {printf("number : %d\n", $1);}  // 수정된 부분
 	| STRING {printf("string : %s\n", $1);}  // 수정된 부분
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
		scanf("%s", str);  
		yylval = strdup(str); 
		return STRING;
	}
}

int main() {
	yyparse();
	return 0;
}
