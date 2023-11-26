# -*- coding: cp949 -*-
#===============================================
# ���ڿ��� ����ó�� ���� readlines() --> word list�� ��ȯ
text = """
We are learning Python.
Python is very easy and powerful.
First of all, It's very fun!
"""

from io import StringIO
likeFile = StringIO(text)
 
def word_list(fp): 
	fileLines = fp.readlines()
	word = []
	for line in fileLines:
		word += line.split()
	return word

print(word_list(likeFile))
