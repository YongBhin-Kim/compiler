#define ID_LENGTH	12
#define NUMKEYWORD	15

enum tsymbol {
     tnull,    tident,     tnumber,   tplus,     tminus,   ttimes,
     tcomma,   tsemicolon, tcolon,    tassign,   tdot,     tddot,
     tlparen,  trparen,    tlbracket, trbracket, tequal,   tnequal,
     tless,    tlesse,     tgreat,    tgreate,   teof,
     arraysym, beginsym,   constsym,  divsym,    dosym,    endsym,
     ifsym,    intsym,     modsym,    ofsym,     procsym,  progsym,
     thensym,  varsym,     whilesym
};

struct tokentype {
     int number;	/* token number */
     union {
     	char id[ID_LENGTH];
     	int num;
     } value;	/* token value */
};

char *keyword[] = {	/* keyword table */
     "array",     "begin",   "const",   "div",  "do",
     "end",       "if",      "integer", "mod",  "of",
     "procedure", "program", "then",    "var",  "while"
};

enum tsymbol tnum[] = {
     arraysym,    beginsym, constsym,   divsym,  dosym,
     endsym,      ifsym,    intsym,     modsym,  ofsym,
     procsym,     progsym,  thensym,    varsym,  whilesym
};
