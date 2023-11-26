%{
	#include <stdio.h>
%}
DIGIT	[0-9]
LETTER	[A-Za-z]
%%
[0-9]+	{ printf("����\n"); }
[+|-]{DIGIT}+	{ printf("��ȣ�ִ� ����\n"); }
[0-9]+\.[0-9]*	{ printf("�Ǽ�\n"); }
int	{ printf("INT\n"); }
char	{ printf("CHAR\n"); }
float	{ printf("FLOAT\n"); }
[a-z]+	{ printf("�ҹ��� ��Ʈ��\n"); }
[A-Z]+	{ printf("�빮�� ��Ʈ��\n"); }
{LETTER}+	{ printf("��ҹ��� ȥ�� ��Ʈ��\n"); }
[{LETTER} | {DIGIT}]+	{ printf("������/���� ȥ�� ��Ʈ��\n"); }
.*	{ printf("��Ÿ ������ ��Ʈ��\n"); }
%%
int yywrap()
{
}

main()
{
	yylex();
}