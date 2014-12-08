package com.n2n;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class Graph {

    private Set<Node> nodes = new HashSet<>();
    private Set<Relationship> relationships = new HashSet<>();

    /**
     * A class that encapsulates {Node, Relationship, Node} triplets. Used
     * when constructing graphs to enforce this type union.
     *
     * @param <N> A node.
     * @param <R> A relationship.
     */
    public static class Member<N, R> {
        private N from;
        private R rel;
        private N to;

        public Member(N from, R rel, N to) {
            this.from = from;
            this.rel  = rel;
            this.to   = to;
        }

        public N getFrom() { return from; }
        public R getRel()  { return rel; }
        public N getTo()   { return to; }
    }

    public Graph(List<Member<Node, Relationship>> relatedMemberList) {
        relatedMemberList.stream()
                .forEach((members) -> {
                    // Connects nodes and relationships
                    members.getFrom().addRelationship(members.getRel());
                    members.getRel().addNodes(members.getFrom(), members.getTo());
                    // Adds all the information to the graph
                    nodes.add(members.getFrom());
                    relationships.add(members.getRel());
                    nodes.add(members.getTo());
                });
    }

    /**
     * An operation for finding nodes based on loose relationship equality.
     *
     * Loose equality is defined as a match on the 'type' of the relationship.
     *
     * Example:
     * + Find movies in which Keanu acted_in
     *      keanu_movies: List<Node> = find_many(keanu acted_in)
     *
     *   Will search the graph for matches on a 'keanu' node that has a relationship of type 'acted_in'
     *
     * @param node The source node from which relationships start.
     * @param relationshipType The relationship type (its name) that joins source node and potential target nodes.
     * @return The set of target nodes, or an empty set if no nodes are found.
     */
    public Set<Node> findMany(Node node, String relationshipType) {
        return findManyHelper(r -> r.looselyEquals(relationshipType), r -> r.getNodesFrom(node).stream());
    }

    /**
     * An operation for finding nodes based on strict relationship equality.
     *
     * Strict equality is defined as a match on the 'type' of the relationship and all the fields provided in the
     * relationship.
     *
     * Example:
     * + Find movies in which Keanu acted_in as Neo
     *      keanu_movies: List<Node> = find_many(keanu acted_in[“Neo”])
     *
     *   Will search the graph for matches on a 'keanu' node that has a relationship of type 'acted_in' with
     *   first field of the relationship as "Neo"
     *
     * @param node The source node.
     * @param relationship A relationship that joins source node and target nodes.
     * @return The set of target nodes, or an empty set if no nodes are found.
     */
    public Set<Node> findMany(Node node, Relationship relationship) {
        return findManyHelper(r -> r.strictlyEquals(relationship), r -> r.getNodesFrom(node).stream());
    }

    private Set<Node> findManyHelper(Node sourceNode, Predicate<Relationship> predicate) {
        return relationships.stream()
                .filter(predicate)
                .flatMap(r -> r.getNodesFrom(sourceNode).stream())
                .collect(Collectors.toSet());
    }

    /**
     * An operation for finding nodes based on an inverse, strict relationship equality.
     *
     * Strict equality is defined as a match on the 'type' of the relationship and all the fields provided in the
     * relationship.
     *
     * Example:
     * + Find actors that acted_in as 'Neo' in 'matrix'
     *
     *      neo_actors: List<Node> = find_many(acted_in(“Neo”) matrix)
     *
     *   Will search the graph for actor nodes that point to node 'matrix' through an 'acted_in' relationship with
     *   first field as 'Neo'
     *
     * @param node The destination node at which the relationship ends.
     * @param relationship A relationship that joins source node and target nodes.
     * @return The set of target nodes, or an empty set if no nodes are found.
     */
    public Set<Node> findMany(Relationship relationship, Node node) {
        return findManyHelper(r -> r.strictlyEquals(relationship), r -> r.getNodesTo(node).stream());
    }

    // find relationships between keanu and matrix
    // keanu_matrix_relationships: List<Rel> = find_many(keanu matrix) ;
    public Set<Relationship> findMany(Node leftNode, Node rightNode) {
        return null;
    }

    private Set<Node> findManyHelper(Predicate<Relationship> predicate, Function<Relationship, Stream<? extends Node>> mapper) {
        return relationships.stream()
                .filter(predicate)
                .flatMap(mapper)
                .collect(Collectors.toSet());
    }

}
