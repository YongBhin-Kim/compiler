%{
	#include <stdio.h>
%}
DIGIT	[0-9]
LETTER	[A-Za-z]
%%
[0-9]+	{ printf("정수\n"); }
[+|-]{DIGIT}+	{ printf("부호있는 정수\n"); }
[0-9]+\.[0-9]*	{ printf("실수\n"); }
int	{ printf("INT\n"); }
char	{ printf("CHAR\n"); }
float	{ printf("FLOAT\n"); }
[a-z]+	{ printf("소문자 스트링\n"); }
[A-Z]+	{ printf("대문자 스트링\n"); }
{LETTER}+	{ printf("대소문자 혼합 스트링\n"); }
[{LETTER} | {DIGIT}]+	{ printf("영문자/숫자 혼합 스트링\n"); }
.*	{ printf("기타 나머지 스트링\n"); }
%%
int yywrap()
{
}

main()
{
	yylex();
}
