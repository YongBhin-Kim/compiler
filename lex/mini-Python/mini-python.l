%{
#include <stdio.h>
#include <stdlib.h>

enum tnumber {
    TEOF, TIDENT, TNUMBER, TPLUS, TMINUS, TTIMES,
    TCOMMA, TSEMICOLON, TCOLON, TASSIGN, TDOT,
    TLPAREN, TRPAREN, TLBRACKET, TRBRACKET,
    TIF, TELSE, TWHILE, TGT, TLT, TNOT, THASH, TDQUOTE, TSAPO,
    TPERCENT, TSLASH, TBACKSLASH, TERROR
};

int LineNumber = 1;

#undef yywrap
%}

letter   [a-zA-Z_]
digit    [0-9]

%%
"+"       return(TPLUS);
"-"       return(TMINUS);
"*"       return(TTIMES);
","       return(TCOMMA);
";"       return(TSEMICOLON);
":"       return(TCOLON);
"("       return(TLPAREN);
")"       return(TRPAREN);
"["       return(TLBRACKET);
"]"       return(TRBRACKET);
"="       return(TASSIGN);
"\."      return(TDOT);
">"       return(TGT);
"<"       return(TLT);
"!"       return(TNOT);
"#"       return(THASH);
"\""      return(TDQUOTE);
"\'"      return(TSAPO);
"%"       return(TPERCENT);
"/"       return(TSLASH);
"\\"      return(TBACKSLASH);

"if"      return(TIF);
"else"    return(TELSE);
"while"   return(TWHILE);

{letter}({letter}|{digit})*    return(TIDENT);
{digit}+                     return(TNUMBER);

[ \t\r]   ;
\n        LineNumber++;
.         return(TERROR);
%%

int main() {
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
