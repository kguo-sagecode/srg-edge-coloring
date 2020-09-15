#helper method for class1test
def randRelabel(vxs):
	n = len(vxs)
	inds = list(range(n))
	lab = {}
	for it in vxs:
		now = randint(0, len(inds) -1)
		lab[it] = inds.pop(now)
	return lab
	
# input: G a graph on even number of vertices, k-regular. runs is a number >0 
#tries to find if the graph is class 1 (i.e. k-edge-colorable) using a naive
#greedy algorithm, given runs chances. 
def class1test(G, runs):
	k = G.degree()[0]
	msize = int(G.num_verts()/2)
	for it in range(runs):
		H = G.copy()
		vs = H.vertices()
		bb = randRelabel(vs)
		H.relabel(bb)
		found = true
		cocl = []
		for it in range(k):
			aa = H.matching()
			if len(aa) == msize:
				cocl.append(aa)
				H.delete_edges(aa)
			else:
				found = false
				break
		if found:
			return [True, cocl]
	return [False, "false after " + str(runs) + " tests" ]