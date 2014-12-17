package com.n2n;

import java.util.*;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class Graph {

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
        addToGraph(relatedMemberList);
    }

    private void addToGraph(List<Member<Node, Relationship>> relatedMemberList) {
        relatedMemberList.stream().forEach((members) -> {
            members.getRel().addNodes(members.getFrom(), members.getTo());
            relationships.add(members.getRel());
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

    /**
     * An operation for finding nodes based on an inverse, loose relationship equality.
     *
     * Loose equality is defined as a match on the 'type' of the relationship.
     *
     * Example:
     * + Find movies in which Keanu acted_in
     *      matrix_actors: List<Node> = find_many(acted_in matrix)
     *
     *   Will search the graph for actor nodes that point to node 'matrix' through an 'acted_in' relationship
     *
     * @param node The source node from which relationships start.
     * @param relationshipType The relationship type (its name) that joins source node and potential target nodes.
     * @return The set of target nodes, or an empty set if no nodes are found.
     */
    public Set<Node> findMany(String relationshipType, Node node) {
        return findManyHelper(r -> r.looselyEquals(relationshipType), r -> r.getNodesTo(node).stream());
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

    /**
     * Finds all relationships that join leftNode and RightNode.
     * TODO: Ugly and inefficient. Fix me.
     *
     * @param leftNode Left side of the relationship.
     * @param rightNode Right side of the relationship.
     * @return A set that contains relationships between the two nodes.
     */
    public Set<Relationship> findMany(Node leftNode, Node rightNode) {
        Set<Relationship> result = new HashSet<>();
        result.addAll(relationshipFinder(leftNode, rightNode));
        result.addAll(relationshipFinder(rightNode, leftNode));
        return result;
    }

    public Set<Node> findMany(Node target) {
        Set<Node> nodes = new HashSet<>();
        for (Relationship relationship : relationships) {
            nodes.addAll(relationship
                    .getAll()
                    .stream()
                    .filter(node -> node.looselyEquals(target)).collect(Collectors.toList()));
        }
        return nodes;
    }

    public Set<Node> neighbors(Node target) {
        return relationships.stream().flatMap((r -> r.getNodesFrom(target).stream())).collect(Collectors.toSet());
    }

    private Set<Relationship> relationshipFinder(Node left, Node right) {
        Set<Relationship> result = new HashSet<>();
        for (Relationship relationship : relationships) {
            Set<Node> nodesFromLeft = relationship.getNodesFrom(left);
            Set<Node> nodesToRight = relationship.getNodesTo(right);
            if (!nodesToRight.isEmpty()) {
                boolean modified = nodesFromLeft.retainAll(nodesToRight);
                if (modified) {
                    result.add(relationship);
                }
            }
        }
        return result;
    }

    private Set<Node> findManyHelper(Predicate<Relationship> predicate, Function<Relationship, Stream<? extends Node>> mapper) {
        return relationships.stream()
                .filter(predicate)
                .flatMap(mapper)
                .collect(Collectors.toSet());
    }

    public void insert(List<Member<Node, Relationship>> relatedMemberList) {
        addToGraph(relatedMemberList);
    }

    @Override
    public String toString() {
        return "Graph{" +
                "relationships=" + relationships +
                '}';
    }
}
