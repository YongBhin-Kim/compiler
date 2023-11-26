%%
[0-9]+ { printf("int\n"); }
[0-9]*\.[0-9]+ { printf("float\n"); }
(-|\+)[0-9]+ { printf("signed int\n"); }
(-|\+)[0-9]*\.[0-9]+ { printf("signed float\n"); }
%%
int yywrap() { return 1; }

int main()
{
	yylex();
	return 0;
}
