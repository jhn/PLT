package com.n2n;

import java.util.*;

public class Relationship {

    private String type;
    private Map<String, Object> data;
    private Map<Node, Set<Node>> fromTo = new HashMap<>();
    private Map<Node, Set<Node>> toFrom = new HashMap<>();

    public Relationship(String type, Map<String, Object> data) {
        this.type = type;
        this.data = data;
    }

    public Relationship(String type) {
        this(type, Collections.emptyMap());
    }

    public Object getValueFor(String field) {
        return this.data.get(field);
    }

    public Set<Node> getAll() {
        Set<Node> nodes = new HashSet<>();
        nodes.addAll(fromTo.keySet());
        nodes.addAll(toFrom.keySet());
        return nodes;
    }

    public Map<Node, Set<Node>> getAllFromTo() {
        return new HashMap<>(fromTo);
    }

    public void addNodes(Node from, Node to) {
        if (fromTo.containsKey(from)) {
            fromTo.get(from).add(to);
        } else {
            fromTo.put(from, new HashSet<>(Arrays.asList(to)));
        }
        if (toFrom.containsKey(to)) {
            toFrom.get(to).add(from);
        } else {
            toFrom.put(to, new HashSet<>(Arrays.asList(from)));
        }
    }

    public Set<Node> getNodesFrom(Node from) {
        return fromTo.containsKey(from) ? new HashSet<>(fromTo.get(from)) : Collections.emptySet();
    }

    public Set<Node> getNodesTo(Node to) {
        return toFrom.containsKey(to) ? new HashSet<>(toFrom.get(to)) : Collections.emptySet();
    }

    public boolean looselyEquals(String type) {
        return this.type.equals(type);
    }

    public boolean strictlyEquals(Relationship relationship) {
        return this.equals(relationship);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Relationship that = (Relationship) o;

        return type.equals(that.type) && data.equals(that.data);
    }

    @Override
    public int hashCode() {
        int result = type.hashCode();
        result = 31 * result + data.hashCode();
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        int count = this.data.size();
        int i = 0;
        sb.append(type).append("{ ");
        for (Map.Entry<String, Object> data : this.data.entrySet()) {
            sb.append(data.getKey()).append(" = ").append(data.getValue());
            if (i < count-1)
                sb.append(", ");
            i++;
        }
        sb.append(" }");
        return sb.toString();
    }
}
