#=== test-glob.py
# Get filenames and sub-folder names in a directory
import glob

# Current directory
fileList = glob.glob("*")
print(fileList)

# Another directory..
fileList = glob.glob("c:/temp/*")
print(fileList)
#========================================

# only filename
import os

for fullFile in fileList:
	if os.path.isdir(fullFile): # is directory?
		print('Dir. : ', os.path.basename(fullFile))
	else:
		print('File : ', os.path.basename(fullFile))
