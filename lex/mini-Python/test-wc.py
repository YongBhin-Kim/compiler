# -*- coding: cp949 -*-
#====================================================
# �ؽ�Ʈ ������ ����/�ܾ�/���� count�ϴ� ���α׷�
#
def charcount(filename):
	f = open(filename)
	text = f.read()
	f.close()
	return len(text)        # string length
# <����> �����ڵ� ��Ʈ�� -- len("�����ٶ�")=8, len(u"�����ٶ�")=4

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
