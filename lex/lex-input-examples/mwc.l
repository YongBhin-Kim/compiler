%{
	char **file_list;
	int file_max_num;
	int file_current_num;
	unsigned char_count=0, word_count=0, line_count=0;
	unsigned total_char_count=0, total_word_count=0, total_line_count=0;
%}
WORD [^ \t\n]+
EOL \n
%%
{WORD}	{ word_count++; char_count+=yyleng; }
{EOL}	{ line_count++; char_count++; }
.	char_count++;
%%
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
		file_list = argv+1;
		file_max_num = argc-1;
		file_current_num = 0;
	}
	yylex();
	fprintf(yyout, "total\t %d %d %d\n", total_line_count, 
		total_word_count, total_char_count);

	fclose(yyin);
	return 0;
}

int yywrap()
{
	FILE *file;
	fclose(yyin); //이전 파일처리를 종료한다.
	printCount(); //현재 파일에 결과 출력, total 변수값 업데이트, 기본 변수 초기화.

	file_current_num++;
	if(file_current_num < file_max_num){
		file = fopen(file_list[file_current_num], "r");
		if (!file) {
			fprintf(stderr, "could not open %s\n", file_list[file_current_num]);
			exit(1);
		}
		yyin = file;
		return 0; //계속해서 읽을 새로운 입력이 존재함.
	}
	return 1; //더 이상 읽을 파일이 없음.
}

void printCount()
{
	fprintf(yyout, "%s\t", file_list[file_current_num]);
	fprintf(yyout, "%d %d %d\n", line_count, word_count, char_count);
	total_char_count += char_count;
	total_word_count += word_count;
	total_line_count += line_count;
	line_count=word_count=char_count=0;
}
