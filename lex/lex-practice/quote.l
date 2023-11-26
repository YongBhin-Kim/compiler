%{
	/*
		Check if number of qoutes are even or odd.
	*/

	int state = 0;
%}
%%
"\""	{ state = state ? 0 : 1; }
\n	{ if (state) puts("Quote error"); }
.
%%
int yywrap() { return 1; }

int main()
{
	yylex();
	return 0;
}
