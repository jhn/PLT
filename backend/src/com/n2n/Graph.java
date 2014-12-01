package com.n2n;

import java.util.Set;
import java.util.function.Predicate;
import java.util.stream.Collectors;

public class Graph {

    private Set<Node> nodes;
    private Set<Relationship> relationships;

    // TODO: constructor syntax -> Graph(Node, Rel, Node)
    // TODO: adding nodes and relationships to the fields
    public Graph(Set<Node> nodes) {
        this.nodes = nodes;
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
        return findManyHelper(n -> n.equals(node) && n.hasRelationshipLooselyEquals(relationshipType));
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
        return findManyHelper(n -> n.equals(node) && n.hasRelationshipStrictlyEquals(relationship));
    }

    private Set<Node> findManyHelper(Predicate<Node> predicate) {
        return nodes.stream()
                    .filter(predicate)
                    .collect(Collectors.toSet());
    }

    // find one actor that was in the matrix named “Neo”
    // keanu:             Node       = find_one(acted_in(“Neo”) matrix) ;
    public Set<Node> findMany(Relationship relationship, Node node) {
        return null;
    }

    private Set<Node> findHelper(Relationship relationship, Node node) {
        return null;
    }

    // find relationships between keanu and matrix
    // keanu_matrix_relationships: List<Rel> = find_many(keanu matrix) ;
    public Set<Relationship> findMany(Node leftNode, Node rightNode) {
        return null;
    }

}
