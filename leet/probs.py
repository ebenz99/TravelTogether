"""
import matplotlib.pyplot as plt 
from random import randint

a = randint(0,7)
"""
from random import randint
def rand7():
	return (randint(1, 7))


def rand10():
	arr = [[0,8,9],[1,2,3,4,5,6,7]]
	a = rand7()
	if a < 3:
		which = 0
	else:
		which = 1
	b = rand7()
	if which == 0:
		while b >3:
			b = rand7()
	return arr[which][b-1], which

dic = {}
dic2 = {0:0, 1:0}
x = 1000000
for i in range(0,x):
	a = rand10()
	b = a[1]
	dic2[b]+=1
	if a[0] not in dic:
		dic[a[0]] = 0
	dic[a[0]] +=1
print(dic)
print(dic2)