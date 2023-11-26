# -*- coding: cp949 -*-
#====================================================
# 텍스트 파일의 문자/단어/라인 count하는 프로그램
#
def charcount(filename):
	f = open(filename)
	text = f.read()
	f.close()
	return len(text)        # string length
# <참고> 유니코드 스트링 -- len("가나다라")=8, len(u"가나다라")=4

def wordcount(filename):
	f = open(filename)
	text = f.read()
	f.close()
	a = text.split()
	return len(a)

def linecount(filename):
	f = open(filename)
	lines = f.readlines()
	n = 0
	for line in lines:
		n = n+1
	f.close()
	return n

import sys
if len(sys.argv) == 1:
	fileName = 'test-wc.py'
else: fileName = sys.argv[1]
		
print(fileName)
print(linecount(fileName), wordcount(fileName), charcount(fileName))
