/* Lex 입력 예제 -- <주의사항> 규칙부의 '정규표현'과 '액션코드' 사이는 "탭 문자" */
%{
    #include <stdio.h>
%}
DIGIT   [0-9]
LETTER  [A-Za-z]
%%
"hello world"    printf("GOOD BYE\n");
[0-9]+   { printf("INTEGER\n"); }
{LETTER}+   { printf("ALPHABET STRING\n"); }
{LETTER}+({LETTER}|{DIGIT})*   { printf("IDENTIFIER\n"); }
.   ;
%%

int yywrap() { return 1; }

int main() {
    yylex();
    return 0;
}
