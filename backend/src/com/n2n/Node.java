package com.n2n;

import java.util.Map;

public class Node {

    private String type;
    private Map<String, Object> data;

    public Node(String type, Map<String, Object> data) {
        this.type = type;
        this.data = data;
    }

    public Object getValueFor(String field) {
        return this.data.get(field);
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
