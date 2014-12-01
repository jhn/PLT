package com.n2n;

import java.util.Map;

public class Relationship<From, To> {

    private String type;
    private Map<String, Object> data;
    // TODO: idea: use a Multimap and hold Node->Set<Nodes> for easy querying

    public Relationship(String type, Map<String, Object> data) {
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
        return "Relationship{" +
                "type='" + type + '\'' +
                ", data=" + data +
                '}';
    }
}
