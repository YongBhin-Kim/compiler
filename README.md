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



