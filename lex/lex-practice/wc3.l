%{
/* The word counter example for multiple files */

unsigned long charCount = 0, wordCount = 0, lineCount = 0;
#undef yywrap 
%}
word [^ \t\n]+
eol \n
%%
{word}	{ wordCount++; charCount += yyleng; }
{eol}	{ charCount++; lineCount++; }
.	charCount++;
%%
char **fileList;
unsigned currentFile = 0;
int nFiles;

unsigned long totalCC = 0;
unsigned long totalWC = 0;
unsigned long totalLC = 0;

int main(int argc, char *argv[])
{
	FILE *file;

	fileList = argv+1;
	nFiles = argc-1;

	if (argc >= 2) {
		currentFile = 1;
		if (!(file = fopen(argv[1], "r"))) {
			fprintf(stderr, "can not open <%s>.\n", argv[1]);
			exit(1);
		}
		yyin = file;	/* yyin -- 입력 파일이 assign되는 변수 */
	}

	yylex();

	return 0;
}

/*
	yylex()는 입력 파일의 끝에 도달할 때 yylex는 yywrap() 함수를 호출한다.

	yywrap()함수의 return 값이
		- 1이면, 프로그램을 끝마치고,
		- 0이면, yywrap()는 읽기 위해서 다른 파일을 open한다.

	yyin을 통해서 계속 입력을 받는다.
*/
int yywrap()
{     
	FILE *file;

	fclose(yyin);
	
	if (nFiles <= 1) {
		printf("%8lu %8lu %8lu\n", lineCount, wordCount, charCount);
		return 1;
	} else if (currentFile == nFiles) {
		printf("%8lu %8lu %8lu %s\n", lineCount, wordCount, charCount, fileList[currentFile-1]);
		totalCC += charCount;
		totalWC += wordCount;
		totalLC += lineCount;;
		printf("%8lu %8lu %8lu total\n", totalLC, totalWC, totalCC);
		return 1;
	} else if (currentFile < nFiles) {
		printf("%8lu %8lu %8lu %s\n", lineCount, wordCount, charCount, fileList[currentFile-1]);
		totalCC += charCount;
		totalWC += wordCount;
		totalLC += lineCount;
		charCount = wordCount = lineCount = 0;
	}

	while (fileList[currentFile] != NULL) {
		file = fopen(fileList[currentFile++], "r");
		if (file != NULL) {
			yyin = file;
			break;
		}
		fprintf(stderr, "can not open <%s>.\n", fileList[currentFile-1]);
	}

	return(file ? 0 : 1);
}
