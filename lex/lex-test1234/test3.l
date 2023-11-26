%{
	#include <stdio.h>
	enum tokens { UNUSED, INT, SINT, FLOAT, INT_TYPE, CHAR_TYPE, FLOAT_TYPE,
		LOW_STR, UPP_STR, LOWUPP_STR, ALPHANUM_STR, ETC };
%}
DIGIT	[0-9]
LETTER	[A-Za-z]
%%
[0-9]+	{ return INT; }
[+-]{DIGIT}+	{ return SINT; }
[0-9]+\.[0-9]*	{ return FLOAT; }
int	{ return INT_TYPE; }
char	{ return CHAR_TYPE; }
float	{ return FLOAT_TYPE; }
[a-z]+	{ return LOW_STR; }
[A-Z]+	{ return UPP_STR; }
{LETTER}+	{ return LOWUPP_STR; }
({LETTER}|{DIGIT})+	{ return ALPHANUM_STR; }
.*	{ return ETC; }
%%
int yywrap(){ return 1; }

int main()
{
	enum tokens n;

	n = yylex();
	printf("Token number = %d\n", n);

	return 0;
}
