#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include "scanner.h"

struct tokentype scanner()
{
	struct tokentype token;
	int i, j, k, num;
	char ch, id[ID_LENGTH];

	token.number = tnull;
	do {
		while ((ch = getchar()) == ' ');	/* skip blanks */
		if (isalpha(ch)) {	/* identifier or keyword */
			i = 0;
			do {
				if (i < ID_LENGTH) id[i++] = ch;
				ch = getchar();
			} while (isalnum(ch));
			id[i] = '\0';
			ungetc(ch, stdin);
			/* find the identifier in th ekeyword table */
			i = 0; j = NUMKEYWORD-1;
			do {	/* binary search */
				k = (i + j) / 2;
				if (strcmp(id, keyword[k]) >= 0) i = k + 1;
				if (strcmp(id, keyword[k]) <= 0) j = k - 1;
			} while (i <= j);
			if ((i-1) > j)	/* found: keyword exit */
				token.number = tnum[k];
			else {	/* not found: identifier exit */
				token.number = tident;
				strcpy(token.value.id, id);
			}
		} else if (isdigit(ch)) {	/* number */
			num = 0;
			do {
				num = 10 * num + (int)(ch - '0');
				ch = getchar();
			} while (isdigit(ch));
			ungetc(ch, stdin);	/* retract */
			token.number = tnumber;
			token.value.num = num;
		} else switch (ch) {	/* special characters */
			case '(':	/* state 7 */
				ch = getchar();
				if (ch == '*') {	/* comment */
					do {
						while (ch != '*') ch = getchar();
						ch = getchar();
					} while (ch != ')');
				} else {
					token.number = tlparen;
					ungetc(ch, stdin);	/* retract */
				}
				break;
			case '<':	/* state 11 */
				ch = getchar();
				if (ch == '>') token.number = tnequal;
				else if (ch == '=') token.number = tlesse;
				else {
					token.number = tless;
					ungetc(ch, stdin);	/* retract */
				}
				break;
			case '>':	/* state 15 */
				ch = getchar();
				if (ch == '=') token.number = tgreate;
				else {
					token.number = tgreat;
					ungetc(ch, stdin);	/* retract */
				}
				break;
			case ':':	/* state 18 */
				ch = getchar();
				if (ch == '=') token.number = tassign;
				else {
					token.number = tcolon;
					ungetc(ch, stdin);	/* retract */
				}
				break;
			case '.':	/* state 21 */
				ch = getchar();
				if (ch == '.') token.number = tddot;
				else {
					token.number = tdot;
					ungetc(ch, stdin);	/* retract */
				}
				break;
			case '=': token.number = tequal; break;
			case ')': token.number = trparen; break;
			case '+': token.number = tplus; break;
			case '-': token.number = tminus; break;
			case '*': token.number = ttimes; break;
			case ';': token.number = tsemicolon; break;
			case ',': token.number = tcomma; break;
			case '[': token.number = tlbracket; break;
			case ']': token.number = trbracket; break;
			case EOF: token.number = teof; break;
		}	/* switch end */
	} while (token.number == tnull);
	return token;
}	/* end of scanner */
