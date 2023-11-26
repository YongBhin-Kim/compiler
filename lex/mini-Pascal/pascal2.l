/*
	Mini-pascal LEX input file
*/
%{
#include <stdio.h>
#include <stdlib.h>

enum tnumber {
	TEOF, TIDENT, TNUMBER, TPLUS, TMINUS, TTIMES,
	TCOMMA, TSEMICOLON, TCOLON, TASSIGN, TDOT, TDDOT,
	TLPAREN, TRPAREN, TLBRACKET, TRBRACKET, TEQUAL, TNEQUAL,
	TLESS, TLESSE, TGREAT, TGREATE,
	ARRAYSYM, BEGINSYM, CONSTSYM, DIVSYM, DOSYM, ENDSYM,
	IFSYM, INTSYM, MODSYM, OFSYM, PROCSYM, PROGSYM,
	THENSYM, VARSYM, WHILESYM, TERROR
};

int LineNumber = 0;

#undef yywrap
%}
letter	[a-zA-Z_]
digit	[0-9]
%%
"+"	return(TPLUS);
"-"	return(TMINUS);
"*"	return(TTIMES);
","	return(TCOMMA);
";"	return(TSEMICOLON);
":"	return(TCOLON);
":="	return(TASSIGN);
".."	return(TDDOT);
"("	return(TLPAREN);
")"	return(TRPAREN);
"["	return(TLBRACKET);
"]"	return(TRBRACKET);
"="	return(TEQUAL);
"<>"	return(TNEQUAL);
"<"	return(TLESS);
"<="	return(TLESSE);
">"	return(TGREAT);
">="	return(TGREATE);
\.	return(TDOT);

array	return(ARRAYSYM);
begin	return(BEGINSYM);
const	return(CONSTSYM);
div	return(DIVSYM);
do	return(DOSYM);
end	return(ENDSYM);
if	return(IFSYM);
integer	return(INTSYM);
mod	return(MODSYM);
of	return(OFSYM);
procedure	return(PROCSYM);
program	return(PROGSYM);
then	return(THENSYM);
var	return(VARSYM);
while	return(WHILESYM);

{letter}({letter}|{digit})*	return(TIDENT);
{digit}+	return(TNUMBER);

[ \t]	;
\n	LineNumber++;
.	return(TERROR);
%%
int main()
{
	enum tnumber tn;

	printf("Start of lex\n");
	while ((tn = yylex()) != TEOF) {
		switch (tn) {
		case TIDENT:
		case TNUMBER:
			printf("\t(%2i, %s)\n", tn, yytext); break;
		case TERROR:
			printf("ERROR -- line %d : [%c]\n", LineNumber, yytext[0]); break;
		default:
			printf("\t(%2i, 0)\n", tn);
		}
	}
	return 0;
}

int yywrap() { printf("End of Lex\n"); return 1; }
