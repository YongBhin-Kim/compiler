/*
	E -> ( L ) | a
	L -> L, E | E
*/
%{
#include <stdio.h>
int yylex();
void yyerror();
%}
%start  S
%%
S : E        { printf("Accept!\n"); return 0;  }
  ;
E : '(' L ')'
  | 'a'
  ;
L : L ',' E
  | E
  ;
%%
void yyerror(char *s) { printf("%s\n", s); }

int yylex() {
  /* every token is a single character */
  return getchar();
}

int main()
{
	yyparse();
}