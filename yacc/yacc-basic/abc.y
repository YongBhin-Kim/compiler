%{
	#include <stdio.h>
	#include <ctype.h>
	void yyerror(char const *s);
	int yylex();
%}
%%
start: a { printf("sequential \"ABC\""); };
a: 	'a'b { printf("<a> -> a<b>\n"); }
	| 'A'b { printf("<a> -> A<b>\n"); }
	;
b: 	'b'c { printf("<b> -> b<c>\n"); }
	| 'B'c { printf("<b> -> B<c>\n"); }
	;
c: 	'c'  { printf("<c> -> c\n"); }
	| 'C'  { printf("<c> -> C\n"); }
	;
%%
void yyerror(char const *s) {
	puts(s);
}

int yylex() {
	char ch;

	ch = getchar();
	if (isalpha(ch)) return ch;

	return 0;
}

int main() {
	yyparse();
	return 0;
}
