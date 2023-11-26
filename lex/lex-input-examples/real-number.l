%{
	/* C 언어의 실수 인식 */
%}
DIGIT [0-9]
EXPONENT [eE]
SIGN [\+-]
%%
“이 부분을 완성하시오.” { printf("\t%s -> 실수 상수\n", yytext); }
. ; //skip
%%
main()
{
	yylex();
}
