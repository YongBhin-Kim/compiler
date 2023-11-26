#include <stdio.h>
#include "scanner2.h"

extern struct tokentype scanner();

int main()
{
	struct tokentype t;

	while (1) {
		t = scanner();
		if (t.number == teof)
			break;
		else if (t.number == tident)
			printf("<%2d, %s>\n", t.number, t.value.id);
		else if (t.number == tnumber)
			printf("<%2d, %d>\n", t.number, t.value.num);
		else printf("<%2d, %d>\n", t.number, 0);
	}

	return 0;
}
