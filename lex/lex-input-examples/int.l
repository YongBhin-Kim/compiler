%{
	/* 렉스 패턴 매치 우선순위 예제 */ 
%}
%%
in { printf("IN\n"); }		// R1
in. { printf("IN+CHAR\n"); }	// R2
int { printf("INT\n"); }		// R3
. { printf("CHAR: %s\n", yytext); }	// R4
%%
int yywrap() { return 1; }

int main()
{
	yylex();
	return 0;
}
