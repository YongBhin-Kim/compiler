%{
	unsigned char_count=0, word_count=0, line_count=0;
%}
WORD [^ \t\n]+
EOL \n
%%
{WORD}	{ word_count++; char_count += yyleng; }
{EOL}	{ line_count++; char_count++; }
.	char_count++;
%%
int yywrap() { return 1; }

int main(int argc, char *argv[])
{
	if (argc > 1) {
		FILE *file;
		file = fopen(argv[1], "r");
		if (!file) {
			fprintf(stderr, "could not open %s\n", argv[1]);
			exit(1);
		}
		yyin = file;
	}
	yylex();
	fprintf(yyout, "%d %d %d\n", line_count, word_count, char_count);
	fclose(yyin);
	return 0;
}
