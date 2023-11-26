# Search all files with an extension '.py' or '.txt'
import os

def searchFiles(dirname):
	flist = os.listdir(dirname)
	for f in flist:
		next = os.path.join(dirname, f)
		if os.path.isdir(next):
			searchFiles(next)
		else:
			doFileWork(next)

def doFileWork(filename):
	tokens = os.path.splitext(filename)
	ext = tokens[-1]
	if ext == '.py':
		print('.py  :\t', os.path.basename(filename))
		print('\t', filename)
	if ext == '.txt':
		print('.txt :\t', os.path.basename(filename))
		print('\t', filename)

searchFiles("C:\Temp")
