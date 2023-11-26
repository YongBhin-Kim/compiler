%{
	unsigned charcount = 0, wordcount = 0, linecount = 0;
%}
word [^ \t\n]+
eol \n
%%
{word} { wordcount++; charcount += yyleng; }
{eol} { charcount++; linecount++; }
.	charcount++;
%%
int yywrap(){ return 1; }

int main()
{
	yylex();
	printf("%d %d %d\n", linecount, wordcount, charcount);
	return 0;
}
