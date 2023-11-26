# Compiler Practice with Lex and Yacc

This is a simple example of practicing lex (lexical analyzer) and yacc (parser generator) in compiler construction.

## Commands

To generate the lexical analyzer code using flex: <br>
`$ flex *.l`


To generate the parser code using yacc: <br>
`$ yacc -d *.y`


To compile the generated code: <br>
`$ gcc y.tab.c`


These commands demonstrate the typical workflow for building a compiler using lex and yacc. The `flex` tool generates a lexical analyzer from the specified lex file (`*.l`), while `yacc` generates a parser from the yacc file (`*.y`). Finally, the `gcc` command compiles the resulting code for execution.

Make sure to replace `*.l` and `*.y` with the actual filenames you are using for your lex and yacc specifications.

## How to Parse?

Parsing 방법
- Top-Down 파싱
- - 방법: backtracking + reducsion
  - 문제점: 1. Left recursive grammar can cause an infinite loop.(좌순환 규칙) 2. The speed of parsing is much slower
  - 개선: Backtracking 없이 deterministic parsing 방법: FIRST, FOLLOW 함수 이용
- 

