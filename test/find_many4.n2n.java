package com.n2n;

import java.util.*;

class Main {

	String movie = "movie";
String actedIn = "actedIn";
String actor = "actor";
;
public static void main(String[] args) {

		Node Keanu = new Node("actor", new HashMap<String, Object>() {{
	put("name", "Keanu");
put("age", 35);

}}
);;
	Node Leo = new Node("actor", new HashMap<String, Object>() {{
	put("name", "Leo");
put("age", 20);

}}
);;
	Relationship neo = new Relationship("actedIn", new HashMap<String, Object>() {{
	put("role", "Neo");

}}
);;
	Relationship jordan = new Relationship("actedIn", new HashMap<String, Object>() {{
	put("role", "Jordan");

}}
);;
	Relationship nelson = new Relationship("actedIn", new HashMap<String, Object>() {{
	put("role", "Nelson");

}}
);;
	Node matrix = new Node("movie", new HashMap<String, Object>() {{
	put("title", "Matrix");
put("year", 1999);

}}
);;
	Node wolf = new Node("movie", new HashMap<String, Object>() {{
	put("title", "Wolf");
put("year", 1994);

}}
);;
	Node sweet_nov = new Node("movie", new HashMap<String, Object>() {{
	put("title", "Sweet November");
put("year", 2000);

}}
);;
	Graph Cast = new Graph(Arrays.asList(new Graph.Member<>(Keanu, neo, matrix), new Graph.Member<>(Leo, jordan, wolf), new Graph.Member<>(Keanu, nelson, sweet_nov)));;
	Set<Node> node_lit;
	node_lit = Cast.findMany("actor", new HashMap<String, Object>() {{
	put("name", "Keanu");
put("age", "Any");

}}
);
	System.out.print(node_lit);
	System.out.print("\n");
	}

}
