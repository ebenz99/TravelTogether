import numpy as np
import sklearn.cluster
import distance
import pickle

dbfile = open('examplePickle', 'rb')      
db = pickle.load(dbfile)
print(db)
words = db.split(",")
dic  = {}

for word in words:
    if word not in dic:
        dic[word]=1
    else:
        dic[word]+=1

a = sorted(dic.items(), reverse=True, key=lambda kv:kv[1])
print(a)

s = ""
for pair in a:
    if 'strong' not in pair[0]:
        s+='{0: <90}'.format(pair[0])+str(pair[1])+"\n"

with open("output.csv",'w') as f:
    f.write(s)






"""
words = np.asarray(words) #So that indexing with a list will work
lev_similarity = -1*np.array([[distance.levenshtein(w1,w2) for w1 in words] for w2 in words])

print(lev_similarity)


affprop = sklearn.cluster.AffinityPropagation(affinity="precomputed")
affprop.fit(lev_similarity)
for cluster_id in np.unique(affprop.labels_):
    exemplar = words[affprop.cluster_centers_indices_[cluster_id]]
    cluster = np.unique(words[np.nonzero(affprop.labels_==cluster_id)])
    cluster_str = ", ".join(cluster)
    print(" - *%s:* %s" % (exemplar, cluster_str))
"""
