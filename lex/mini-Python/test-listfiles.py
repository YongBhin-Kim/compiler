# -*- coding: cp949 -*-
#==================================================
# �Ʒ��� ���� ������ �� "C:\Temp" ������ �ִ� ���� �� �������� ���
#    C> python test.py C:\Temp\*
import sys
a = sys.argv
print(a)
if len(sys.argv) == 1:
	print("Error -- C> test.py folder-name/*")
	print("Example: C> test.py C:\Temp\*")
	sys.exit()

import glob
b = glob.glob(a[1])
for file in b:
	if file[-4:] == '.txt':
		print(file, '\t--> text file')
	else:
		print(file, '\t--> NOT a text file')
