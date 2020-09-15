This repository contains SageMath code relating to the paper entitled ``The chromatic index 
of strongly regular graphs'' by Sebastian M. Cioaba, Krystal Guo, Willem H. Haemers. A 
preprint can be found at https://arxiv.org/abs/1810.06660

srgedgecol.sage contains a function which randomly attempts find a k-edge-coloring of a 
k-regular graph on an even number of vertices, within a given number of attempts. If it 
is successful, the algorithm returns True and the coloring. Otherwise, it outputs 
False and the number of attempts. This file can be run within a SageMath terminal session
as follows:

sage: runfile srgedgecol.sage
sage: G = graphs.CoxeterGraph()
sage: class1test(G, 10)

A sample file containing graph6 strings of all 32,548 strongly regular graphs with 
parameters (36,15,6,6), originally obtained (with different formatting) from Ted 
Spence (http://www.maths.gla.ac.uk/~es/srgraphs.php). To check all graphs in a list of
k-regular graphs on an even number of vertices to see if they are k-edge-colorable, do 
something like the following:

sage: f = file("36sg6.txt", "r")
sage: aa  = f.readlines()
sage: f.close()
sage: grs = [Graph(it.strip("\n")) for it in aa]
sage: from sage.graphs.graph_coloring import edge_coloring
sage: results = []
sage: for it in range(now, len(grs)):
sage: 	results.append(edge_coloring(grs[it], value_only = true))

To do the same, but with the faster, greedy heuristic (does not always succeed even
when the graph is class 1), do the following:

sage: results = []
sage: for it in range(now, len(grs)):
sage: 	results.append(class1test(it,100))

For larger graphs, computing the edge chromatic number is time-consuming. For these 
graphs, class1test can confirm those which are class 1