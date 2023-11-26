%{
	/*
		Replace space to a blank and comments are replaced to <comment>.
	*/
	int state = 0;
%}
%%
[ \t]+	{ if (!state) putchar(' '); }
^[ \t]*\n		;
"//".*	{ printf("<comment>"); }
"/*"	{ state = 1; }
"*/"	{ state = 0; printf("<comment>"); }
\n		{ if (!state) ECHO; }
.		{ if (!state) ECHO; }
%%
int yywrap() { return 1; }

int main()
{
	yylex();
	return 0;
}
