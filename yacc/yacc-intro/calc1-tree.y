/*--------------------------------------------------------------------------
	File-name	: calc1-tree.y
	Description	: Example of printing parse tree
	Written-by	: Kang, Seung-Shik, 2021/11/27
----------------------------------------------------------------------------*/
/*
	E -> E + T | T
	T -> T * F | F
	F -> ( E ) | digit
*/
%{
#include <stdio.h>
#include <ctype.h>

typedef struct node {	// binary tree
	int data;

	int nchild;	// number of children
	struct node *down;	// first child
	struct node *right;	// rest children
} NODE;

int yylex();
void yyerror();

int N_nodes=0;

NODE *get_node();
void set_node(NODE *node, int value, int nch, NODE *d, NODE *r);

void put_tree(NODE *node, int depth);	// depth=0 -- root node
void put_tree_paren(NODE *node, int depth);	// depth=0 -- root node
void del_tree(NODE *node);
%}

%start lines

%union {
	int ival;
	double dval;
	NODE *node;
}

%token <ival> DIGIT
%type <node> term
%type <node> expr
%type <node> factor
%%
lines :	/* empty */
       | lines line
       ;
line : expr	'\n' {
              put_tree_paren($1, 0); del_tree($1); }
              //put_tree($1, 0); del_tree($1); }
       | error '\n'	{ yyerrok; }	// resets the parser to its normal mode
              // The token name 'error' is reserved for error handling
       ;
expr : expr '+' term {
              $$ = get_node(); set_node($$, -1, 3, $1, NULL);
              $1->right = get_node(); set_node($1->right, '+', 0, NULL, $3);
              puts("expr 1");}
       | term {
              $$ = get_node(); set_node($$, -1, 1, $1, NULL);
              puts("expr 2");}
       ;
term : term '*' factor {
              $$ = get_node(); set_node($$, -1, 3, $1, NULL);
              $1->right = get_node(); set_node($1->right, '*', -1, NULL, $3);
              puts("term 1");}
       | factor	{
              $$ = get_node(); set_node($$, -1, 1, $1, NULL);
              puts("term 2");}
       ;
factor : '(' expr ')' {
              $$ = get_node(); set_node($$, -1, 3, NULL, NULL);
              $$->down = get_node(); set_node($$->down, '(', 0, NULL, $2);
              $2->right = get_node(); set_node($2->right, ')', 0, NULL, NULL);
              puts("fact 1");}
       | DIGIT {
              $$ = get_node(); set_node($$, -1, 1, NULL, NULL);
              $$->down = get_node(); set_node($$->down, $1, 0, NULL, NULL);
              printf("fact 2 -- %d\n", $1);}
       ;
%%
void yyerror(char *s)	{ printf("%s\n", s); }

int yylex(){
    int c;

    //c = getchar();
    while ((c=getchar()) == ' ') { /* skip over blanks */ }

    if ( isdigit( c ) ) {
        yylval.ival = c - '0';
        return DIGIT;
    }
    //if (c == '\r') return 0;
    return c;
}

// node ���� -- memory �Ҵ�
NODE *get_node(){
	NODE *node;

	node = (NODE *) malloc(sizeof(NODE));

	node->data = 0;
	node->nchild = 0;
	node->down = NULL;
	node->right= NULL;

	N_nodes++;
	return node;
}

void set_node(NODE *node, int value, int nch, NODE *d, NODE *r){
	node->data = value;
	node->nchild = nch;
	node->down = d;
	node->right= r;
	return;
}

// parse tree ���
void put_tree(NODE *node, int depth){
	int i, j;
	NODE *p;

	if (node == NULL) return;

	for (j = 0; j < depth; j++) printf("    ");	// indentation
	//printf("|- %d [%d]\n", node->data, node->nchild);
	if (node->data == -1)	// no value
		printf("|-\n");
	else printf("|- %d\n", node->data);

	if (node->nchild > 0) {	// daughters
		p = node->down;
		for (i = node->nchild-1; i >= 0; i--) {
			put_tree(p, depth+1);
			if (p == NULL) return;
			p = p->right;
		}
	}
}

// parse tree ��� -- ��ȣ ���·�
void put_tree_paren(NODE *node, int depth)
{
	int i, j;
	NODE *p;

	if (node == NULL) return;

	for (j = 0; j < depth; j++) printf("    ");	// indentation
	//printf("(%d [%d]", node->data, node->nchild);
	if (node->data == -1)	// no value
		printf("(");
	else printf("(%d", node->data);

	if (node->nchild > 0) {	// daughters
		printf("\n");
		p = node->down;
		for (i = node->nchild-1; i >= 0; i--) {
			put_tree_paren(p, depth+1);
			if (p == NULL) return;
			p = p->right;
		}

		for (j = 0; j < depth; j++)
			printf("    ");	// indentation
	}

	printf(")\n");
}

// ��� node�� ���� memory release
void del_tree(NODE *node){
	int i, j;
	NODE *p;

	if (node == NULL) return;

	if (node->down) del_tree(node->down);
	if (node->right) del_tree(node->right);

	free(node);
	N_nodes--;
	return;
}

int main(){
	printf("2*(3+4)\n");
	yyparse();
	return 0;
}
