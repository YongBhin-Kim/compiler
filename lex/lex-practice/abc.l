/*
 * An example lex input file to show the effects of quotes,
 * apostrophes, and upper and lower case letters.
 */

c  [C]

%{
int main()
{
        int token_number;
        while(token_number = yylex())
                printf("yylex returns %d\n\n", token_number);
        printf("\nyylex returns NULL\n");
        return 0;
}
%}

%%
'a'         {printf("yylex: a\n"); return(1);}
'A'         {printf("yylex: A\n"); return(2);}
"b"         {printf("yylex: b\n"); return(3);}
"B"         {printf("yylex: B\n"); return(4);}
c           {printf("yylex: c\n"); return(5);}
{c}         {printf("yylex: C\n"); return(6);}
[\n\r\t ]   {printf("yylex: white space\n");}
%%
int yywrap() { return 1; }

