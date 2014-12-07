package com.n2n;

import org.junit.After;
import org.junit.BeforeClass;
import org.junit.Test;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Set;

import static org.hamcrest.Matchers.contains;
import static org.hamcrest.Matchers.containsInAnyOrder;
import static org.hamcrest.Matchers.hasItem;
import static org.junit.Assert.assertThat;

public class GraphTest {

    public static Graph graph;

    // Reeves
    public static Node keanu;

    public static Relationship neoRole;
    public static Node theMatrix;
    public static Node theMatrixReloaded;

    public static Relationship johnRole;
    public static Node constantine;

    public static Relationship nelsonRole;
    public static Node sweetNovember;

    // DiCaprio
    public static Node leo;

    public static Relationship jordanRole;
    public static Node wolfOfWallSt;

    public static Relationship jackRole;
    public static Node titanic;

    @BeforeClass
    public static void setUp() throws Exception {

        final String actorNode = "actor";
        final String actedInRelationship = "actedIn";
        final String movieNode = "movie";

        keanu = new Node(actorNode, new HashMap<String, Object>() {{
            put("name", "Keanu");
        }});

        neoRole = new Relationship(actedInRelationship, new HashMap<String, Object>() {{
            put("role", "Neo");
        }});

        theMatrix = new Node(movieNode, new HashMap<String, Object>() {{
            put("title", "The Matrix");
            put("year", 1999);
        }});

        theMatrixReloaded = new Node(movieNode, new HashMap<String, Object>() {{
            put("title", "The Matrix Reloaded");
            put("year", 2003);
        }});

        johnRole = new Relationship(actedInRelationship, new HashMap<String, Object>() {{
            put("role", "John Constantine");
        }});

        constantine = new Node(movieNode, new HashMap<String, Object>() {{
            put("title", "Constantine");
            put("year", 2005);
        }});

        nelsonRole= new Relationship(actedInRelationship, new HashMap<String, Object>() {{
            put("role", "Nelson Moss");
        }});

        sweetNovember = new Node(movieNode, new HashMap<String, Object>() {{
            put("title", "Sweet November");
            put("year", 2001);
        }});

        leo = new Node(actorNode, new HashMap<String, Object>() {{
            put("name", "Leo DiCaprio");
        }});

        jordanRole = new Relationship(actedInRelationship, new HashMap<String, Object>() {{
            put("role", "Jordan Belfort");
        }});

        wolfOfWallSt = new Node(movieNode, new HashMap<String, Object>() {{
            put("title", "Wolf Of Wall Street");
            put("year", 2013);
        }});

        jackRole = new Relationship(actedInRelationship, new HashMap<String, Object>() {{
            put("role", "Jack Dawson");
        }});

        titanic = new Node(movieNode, new HashMap<String, Object>() {{
            put("title", "Titanic");
            put("year", 1997);
        }});

        graph = new Graph(Arrays.asList(
                    new Graph.Member<>(keanu, neoRole,    theMatrix),
                    new Graph.Member<>(keanu, neoRole,    theMatrixReloaded),
                    new Graph.Member<>(keanu, johnRole,   constantine),
                    new Graph.Member<>(leo,   jordanRole, wolfOfWallSt),
                    new Graph.Member<>(leo,   jackRole,   titanic)
                ));
    }

    @After
    public void tearDown() throws Exception {

    }

    @Test
    public void testFindManyRelationshipNode() throws Exception {
        Set<Node> moviesKeanuActedIn = graph.findMany(keanu, "actedIn");
        assertThat(moviesKeanuActedIn, containsInAnyOrder(theMatrix, theMatrixReloaded, constantine));
    }

    @Test
    public void testFindManyNodeRelationship() throws Exception {

    }

    @Test
    public void testFindManyNodeNode() throws Exception {

    }
}