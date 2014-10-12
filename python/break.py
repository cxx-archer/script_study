#!/usr/bin/python
# filename: break.py

while True:
	s = raw_input('Enter something: ')
	if s == 'quit':
		break
	print 'Length is', len(s)

print 'Done'

