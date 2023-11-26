# C> ngram.py 1/2/3 "test.txt"
import os
import sys

def unigram(filename):
	f = open(filename, 'r', encoding='UTF8')
#	text = f.read()
#	print(text)
	
	lines = f.readlines()
	n = 0
	for line in lines:
		wlist = line.split()
#		if wlist:
#			print(wlist)

#		for word in wlist:
#			print(word)
		for i in range(0, len(wlist)):
			print(wlist[i])
		n = n+1
	f.close()

def bigram(filename):
	f = open(filename, 'r', encoding='UTF8')
	
	lines = f.readlines()
	for line in lines:
		wlist = line.split()
		for i in range(0, len(wlist)-1):
			print(wlist[i]+"_"+wlist[i+1])
	f.close()

def trigram(filename):
	f = open(filename, 'r', encoding='UTF8')
	
	lines = f.readlines()
	for line in lines:
		wlist = line.split()
		for i in range(0, len(wlist)-2):
			print(wlist[i]+"_"+wlist[i+1]+"_"+wlist[i+2])
	f.close()
	
if len(sys.argv) < 3:
	print("C> ngram.py 1/2/3 test.txt")

n = sys.argv[1]
print(n)
if n == '1':
	unigram(sys.argv[2])
elif n == '2':
	bigram(sys.argv[2])
elif n == '3':
	trigram(sys.argv[2])
