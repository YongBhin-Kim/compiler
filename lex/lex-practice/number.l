%%
[\n\t ] ;
-?(([0-9]+)|([0-9]*\.[0-9]+)([eE][-+]?[0-9]+)?) { printf("number\n"); }
.	ECHO;
%%
int yywrap() { return 1; }

int main()
{
	yylex();
	return 0;
}


