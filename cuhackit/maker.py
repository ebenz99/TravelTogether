import os
import pickle

a = os.getcwd()
idx = 0
l = []
with open(a+'/CUhackit 2019 Application.csv','r') as f:
	for line in f:
		if idx==0 or idx == 1:
			idx+=1
			continue
			pass
		b = line.split(',')
		idx+=1
		try:
			l.append(b[5].lower()+b[6].lower())
		except IndexError:
			continue
s = ",".join(l)


dbfile = open('examplePickle', 'ab') 
      
# source, destination 
pickle.dump(s, dbfile)                      
dbfile.close() 


print(idx)
