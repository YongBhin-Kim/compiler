%{
/*
	A simple lexical analyzer for English sentence.
*/
%}
%%

[\t ]+		/* ignore white spaces: tabs or blanks */;
is |
am |
are |
were |
was |
be |
being |
been		{ printf(" %s(be-verb)", yytext); }

go |
goes |
went |
do |
study		{ printf(" %s(verb)", yytext); }

good |
bad |
rich |
poor |
pretty |
beautiful	{ printf(" %s(adj)", yytext); }

very |
much |
too		{ printf(" %s(adj)", yytext); }

to |
by |
in |
on |
at		{ printf(" %s(prep)", yytext); }

the |
a		{ printf(" %s(det)", yytext); }

he |
she |
I |
you |
they		{ printf(" %s(pronoun)", yytext); }

boy |
girl |
man |
men |
woman |
women |
student |
teacher |
school |
lunch		{ printf(" %s(noun)", yytext); }

[a-zA-Z]+	{ printf(" %s(undefined)", yytext); }

\n	{ ECHO;	/* default */ }
%%
int yywrap() { return 1; }

int main()
{
	printf("Input English setence : ");
	yylex();
	return 0;
}
