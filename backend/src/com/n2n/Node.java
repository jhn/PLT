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

    public Map<String, Object> getData() {
        return this.data;
    }

    public boolean looselyEquals(Object other) {
        if (this == other) return true;
        if (other == null || getClass() != other.getClass()) return false;

        Node otherNode = (Node) other;

        return type.equals(otherNode.type) && dataLooselyEquals(otherNode.getData());
    }

    private boolean dataLooselyEquals(Map<String, Object> other) {
        for (Map.Entry<String, Object> entry : other.entrySet()) {
            if (!entry.getValue().equals("Any") && !this.data.get(entry.getKey()).equals(entry.getValue())) {
                return false;
            }
        }
        return true;
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
        StringBuilder sb = new StringBuilder();
        int count = this.data.size();
        int i=0;
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
