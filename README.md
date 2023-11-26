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
  - 문제점 1. Left recursive grammar can cause an infinite loop.(좌순환 규칙)
  - - 해결 방안: 좌순환 규칙 -> 우순환 규칙으로 변환
  - 문제점 2. The speed of parsing is much slower
  - 개선: Backtracking 없이 deterministic parsing 방법: FIRST, FOLLOW 함수 이용
  - Left factoring: common prefix
  - - 같은 심벌들을 prefix로 가진 두 개 이상의 생성규칙이 있을 때, 구문 분석기가 어떤 생성 규칙을 선택해야 하는 지 결정할 수 없으므로(backtracking이 필수적임) 구문 분석 결정 과정을 다음 심벌을 보기 전까지 최대한 미루는 방법으로 인수 분해함.
```
          A -> aB | aC

          (Left factoring)
          A -> aA'
          A' -> B | C
```
