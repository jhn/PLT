package com.n2n;

import java.util.*;

class Main {

	String relation = "relation";
String member = "member";
;
public static void main(String[] args) {

		Node John = new Node("member", new HashMap<String, Object>() {{
	put("Name", "John Hamilton");
put("Age", 49);
put("visited", false);

}}
);;
	Node Mary = new Node("member", new HashMap<String, Object>() {{
	put("Name", "Mary Lance");
put("Age", 47);
put("visited", false);

}}
);;
	Node Johan = new Node("member", new HashMap<String, Object>() {{
	put("Name", "Johan Hamilton");
put("Age", 21);
put("visited", false);

}}
);;
	Node Sara = new Node("member", new HashMap<String, Object>() {{
	put("Name", "Sara Hamilton");
put("Age", 20);
put("visited", false);

}}
);;
	Relationship Mother = new Relationship("relation", new HashMap<String, Object>() {{
	put("Relation", "Mother of");

}}
);;
	Relationship Father = new Relationship("relation", new HashMap<String, Object>() {{
	put("Relation", "Father of");

}}
);;
	Relationship Child = new Relationship("relation", new HashMap<String, Object>() {{
	put("Relation", "Child of");

}}
);;
	Relationship Brother = new Relationship("relation", new HashMap<String, Object>() {{
	put("Relation", "Brother of");

}}
);;
	Relationship Sister = new Relationship("relation", new HashMap<String, Object>() {{
	put("Relation", "Sister of");

}}
);;
	Graph Family = new Graph(Arrays.asList(new Graph.Member<>(John, Father, Johan), new Graph.Member<>(John, Father, Sara), new Graph.Member<>(Mary, Mother, Johan), new Graph.Member<>(Mary, Mother, Sara), new Graph.Member<>(Johan, Brother, Sara), new Graph.Member<>(Johan, Child, John), new Graph.Member<>(Johan, Child, Mary), new Graph.Member<>(Sara, Sister, Johan), new Graph.Member<>(Sara, Child, John), new Graph.Member<>(Sara, Child, Mary)));;
	DFS(Johan, Family);
	}
public static int DFS(Node N, Graph M) {
if(N.getValueFor("visited").equals(false)) {
		System.out.print(N);
	System.out.print("\n");
	Set<Node> Neighbor = M.neighbors(N);
	N.getData().put("visited", true);
	for( Node node : Neighbor ){
DFS(node, M);
	}

	}
	else {
	}

return 0;
	}

}
