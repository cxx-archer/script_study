#!/usr/bin/python
# filename: for.py

# 1,2,3,4, not inclue 5
for i in range(1, 5):
	print i
else:
	print 'The for loop is over'

# step is 2, so now output 1, 3
for i in range(1, 5, 2):
	print i
else:
	print 'The for loop is over'
