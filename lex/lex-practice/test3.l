%{
	#include <stdio.h>
	enum { UNUSED, INT, SINT, FLOAT, INT_TYPE, CHAR_TYPE, FLOAT_TYPE,
		LOW_STR, UPP_STR, LOWUPP_STR, ALPHANUM_STR, ETC };
%}
DIGIT	[0-9]
LETTER	[A-Za-z]
%%
[0-9]+	{ return INT; }
[+|-]{DIGIT}+	{ return SINT; }
[0-9]+\.[0-9]*	{ return FLOAT; }
int	{ return INT_TYPE; }
char	{ return CHAR_TYPE; }
float	{ return FLOAT_TYPE; }
[a-z]+	{ return LOW_STR; }
[A-Z]+	{ return UPP_STR; }
{LETTER}+	{ return LOW_UPP_STR; }
[{LETTER} | {DIGIT}]+	{ return ALPHANUM_STR; }
.*	{ return ETC; }
%%
int yywrap()
{
}

main()
{
	enum n;

	n = yylex();
	printf("Token number = %d\n", i);
}
