package com.n2n;

import java.util.List;
import java.util.Map;
import java.util.function.Predicate;

public class Node {

    private String type;
    private Map<String, Object> data;
    private List<Relationship> relationships;

    public Node(String type, Map<String, Object> data) {
        this.type = type;
        this.data = data;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Map<String, Object> getData() {
        return data;
    }

    public void setData(Map<String, Object> data) {
        this.data = data;
    }

    public List<Relationship> getRelationships() {
        return relationships;
    }

    public void setRelationships(List<Relationship> relationships) {
        this.relationships = relationships;
    }

    public boolean hasRelationshipLooselyEquals(String relationshipType) {
        return hasRelationship(r -> r.looselyEquals(relationshipType));
    }

    public boolean hasRelationshipStrictlyEquals(Relationship relationship) {
        return hasRelationship(r -> r.strictlyEquals(relationship));
    }

    private boolean hasRelationship(Predicate<Relationship> predicate) {
        return relationships.stream().anyMatch(predicate);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Node node = (Node) o;

        return data.equals(node.data) && type.equals(node.type);
    }

    @Override
    public int hashCode() {
        int result = type.hashCode();
        result = 31 * result + data.hashCode();
        return result;
    }

    @Override
    public String toString() {
        return "Node{" +
                "type='" + type + '\'' +
                ", data=" + data +
                '}';
    }
}
