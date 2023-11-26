# -*- coding: cp949 -*-
#==================================================
# 아래와 같이 실행할 때 "C:\Temp" 폴더에 있는 파일 및 폴더명을 출력
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
