/*
	Ultra-mini pascal LEX input file
*/
%{
#include <stdio.h>
#include <stdlib.h>

enum tnumber {
	TEOF, TIDEN, TNUM, TASSIGN, TADD,
	TSEMI, TDOT, TBEGIN, TEND, TERROR
};

#undef yywrap
%}
letter	[a-zA-Z_]
digit	[0-9]
%%
begin	return(TBEGIN);
end	return(TEND);
{letter}({letter}|{digit})*	return(TIDEN);
":="	return(TASSIGN);
"+"	return(TADD);
{digit}+	return(TNUM);
";"	return(TSEMI);
\.	return(TDOT);
[ \t\n]	;
.	return(TERROR);
%%
int main()
{
	enum tnumber tn;

	printf("Start of lex\n");
	while ((tn = yylex()) != TEOF) {
		switch (tn) {
		case TBEGIN:	printf("\tBegin\n"); break;
		case TEND:	printf("\tEnd\n"); break;
		case TIDEN:	printf("\tIdentifier : %s\n", yytext); break;
		case TASSIGN:	printf("\tAssign op.\n"); break;
		case TADD:	printf("\tAdd op.\n"); break;
		case TNUM:	printf("\tNumber : %s\n", yytext); break;
		case TSEMI:	printf("\tSemicolon\n"); break;
		case TDOT:	printf("\tDot\n"); break;
		case TERROR:	printf("\tError : %c\n", yytext[0]); break;
		}
	}
	return 0;
}

int yywrap() { printf("End of Lex\n"); return 1; }
