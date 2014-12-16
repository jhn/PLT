package com.n2n;

import org.junit.BeforeClass;
import org.junit.Test;

import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

import static org.hamcrest.Matchers.*;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertThat;

public class GraphTest {

    public static Graph graph;

    // Reeves
    public static Node keanu;
    public static Node laurence;
    public static Node carrie;

    public static Relationship neoRole;
    public static Relationship morpheusRole;
    public static Relationship trinityRole;

    public static Node theMatrix;
    public static Node theMatrixReloaded;

    public static Relationship johnRole;
    public static Node constantine;

    public static Relationship nelsonRole;
    public static Node sweetNovember;

    public static Relationship produced;
    public static Node sideBySide;

    // DiCaprio
    public static Node leo;

    public static Relationship jordanRole;
    public static Node wolfOfWallSt;

    public static Relationship jackRole;
    public static Node titanic;

    public static Node theAviator;

    public final static String ACTOR = "actor";
    public final static String ACTED_IN = "actedIn";
    public final static String PRODUCED = "produced";
    public final static String MOVIE = "movie";

    @BeforeClass
    public static void setUp() throws Exception {

        keanu = new Node(ACTOR, new HashMap<String, Object>() {{
            put("name", "Keanu");
        }});

        laurence = new Node(ACTOR, new HashMap<String, Object>() {{
            put("name", "Laurence");
        }});

        carrie = new Node(ACTOR, new HashMap<String, Object>() {{
            put("name", "Carrie");
        }});

        neoRole = new Relationship(ACTED_IN, new HashMap<String, Object>() {{
            put("role", "Neo");
        }});

        morpheusRole = new Relationship(ACTED_IN, new HashMap<String, Object>() {{
            put("role", "Morpheus");
        }});

        trinityRole = new Relationship(ACTED_IN, new HashMap<String, Object>() {{
            put("role", "Trinity");
        }});

        theMatrix = new Node(MOVIE, new HashMap<String, Object>() {{
            put("title", "The Matrix");
            put("year", 1999);
        }});

        theMatrixReloaded = new Node(MOVIE, new HashMap<String, Object>() {{
            put("title", "The Matrix Reloaded");
            put("year", 2003);
        }});

        johnRole = new Relationship(ACTED_IN, new HashMap<String, Object>() {{
            put("role", "John Constantine");
        }});

        constantine = new Node(MOVIE, new HashMap<String, Object>() {{
            put("title", "Constantine");
            put("year", 2005);
        }});

        nelsonRole= new Relationship(ACTED_IN, new HashMap<String, Object>() {{
            put("role", "Nelson Moss");
        }});

        sweetNovember = new Node(MOVIE, new HashMap<String, Object>() {{
            put("title", "Sweet November");
            put("year", 2001);
        }});

        leo = new Node(ACTOR, new HashMap<String, Object>() {{
            put("name", "Leo DiCaprio");
        }});

        jordanRole = new Relationship(ACTED_IN, new HashMap<String, Object>() {{
            put("role", "Jordan Belfort");
        }});

        wolfOfWallSt = new Node(MOVIE, new HashMap<String, Object>() {{
            put("title", "Wolf Of Wall Street");
            put("year", 2013);
        }});

        jackRole = new Relationship(ACTED_IN, new HashMap<String, Object>() {{
            put("role", "Jack Dawson");
        }});

        titanic = new Node(MOVIE, new HashMap<String, Object>() {{
            put("title", "Titanic");
            put("year", 1997);
        }});

        produced = new Relationship(PRODUCED);

        sideBySide = new Node(MOVIE, new HashMap<String, Object>() {{
            put("title", "Side By Side");
            put("year", 2012);
        }});

        theAviator = new Node(MOVIE, new HashMap<String, Object>() {{
            put("title", "The Aviator");
            put("year", 2004);
        }});

        graph = new Graph(Arrays.asList(
                    new Graph.Member<>(keanu,    neoRole,      theMatrix),
                    new Graph.Member<>(laurence, morpheusRole, theMatrix),
                    new Graph.Member<>(carrie,   trinityRole,  theMatrix),
                    new Graph.Member<>(keanu,    neoRole,      theMatrixReloaded),
                    new Graph.Member<>(keanu,    johnRole,     constantine),
                    new Graph.Member<>(keanu,    produced,     sideBySide),
                    new Graph.Member<>(leo,      jordanRole,   wolfOfWallSt),
                    new Graph.Member<>(leo,      jackRole,     titanic),
                    new Graph.Member<>(leo,      produced,     wolfOfWallSt),
                    new Graph.Member<>(leo,      produced,     theAviator)
                ));
    }

    @Test
    public void testFindManyNodeRelationshipWithLooseEquality() throws Exception {
        Set<Node> moviesKeanuActedIn = graph.findMany(keanu, ACTED_IN);
        assertThat(moviesKeanuActedIn, hasSize(3));
        assertThat(moviesKeanuActedIn, containsInAnyOrder(theMatrix, theMatrixReloaded, constantine));

        Set<Node> moviesLeoActedIn = graph.findMany(leo, ACTED_IN);
        assertThat(moviesLeoActedIn, hasSize(2));
        assertThat(moviesLeoActedIn, containsInAnyOrder(wolfOfWallSt, titanic));

        Set<Node> moviesKeanuProduced = graph.findMany(keanu, PRODUCED);
        assertThat(moviesKeanuProduced, hasSize(1));
        assertThat(moviesKeanuProduced, contains(sideBySide));

        Set<Node> moviesLeoProduced = graph.findMany(leo, PRODUCED);
        assertThat(moviesLeoProduced, hasSize(2));
        assertThat(moviesLeoProduced, containsInAnyOrder(wolfOfWallSt, theAviator));
    }

    @Test
    public void testFindManyNodeRelationshipWithStrictEquality() throws Exception {
        Set<Node> moviesKeanuActedInAsNeo = graph.findMany(keanu, neoRole);
        assertThat(moviesKeanuActedInAsNeo, hasSize(2));
        assertThat(moviesKeanuActedInAsNeo, containsInAnyOrder(theMatrix, theMatrixReloaded));

        Set<Node> moviesLeoActedInAsJack = graph.findMany(leo, jackRole);
        assertThat(moviesLeoActedInAsJack, hasSize(1));
        assertThat(moviesLeoActedInAsJack, contains(titanic));
    }

    @Test
    public void testFindManyRelationshipNodeWithStrictEquality() throws Exception {
        Set<Node> actorsWithNeoRoleInTheMatrix = graph.findMany(neoRole, theMatrix);
        assertThat(actorsWithNeoRoleInTheMatrix, hasSize(1));
        assertThat(actorsWithNeoRoleInTheMatrix, contains(keanu));

        Set<Node> actorsWithNeoRoleInTitanic = graph.findMany(neoRole, titanic);
        assertThat(actorsWithNeoRoleInTitanic, hasSize(0));
    }

    @Test
    public void testFindManyRelationshipNodeWithLooseEquality() throws Exception {
        Set<Node> actorsInTheMatrix = graph.findMany(ACTED_IN, theMatrix);
        assertThat(actorsInTheMatrix, hasSize(3));
        assertThat(actorsInTheMatrix, containsInAnyOrder(keanu, laurence, carrie));

        Set<Node> producedTheAviator = graph.findMany(PRODUCED, theAviator);
        assertThat(producedTheAviator, hasSize(1));
        assertThat(producedTheAviator, contains(leo));

        Set<Node> actorsInWolfOfWallSt = graph.findMany(ACTED_IN, wolfOfWallSt);
        Set<Node> actorsInTitanic = graph.findMany(ACTED_IN, titanic);
        Set<Node> actorsInWolfOfWallStAndTitanic = new HashSet<Node>(){{
            addAll(actorsInWolfOfWallSt);
            addAll(actorsInTitanic);
        }};
        assertThat(actorsInWolfOfWallStAndTitanic, hasSize(1));
        assertThat(actorsInWolfOfWallStAndTitanic, contains(leo));
    }

    @Test
    public void testFindManyNodeNode() throws Exception {
        Set<Relationship> keanuMatrixRelationship = graph.findMany(keanu, theMatrix);
        assertThat(keanuMatrixRelationship, hasSize(1));
        assertThat(keanuMatrixRelationship, contains(neoRole));

        Set<Relationship> matrixKeanuRelationship = graph.findMany(theMatrix, keanu);
        assertEquals(keanuMatrixRelationship, matrixKeanuRelationship);

        Set<Relationship> leoWolfRelationships = graph.findMany(leo, wolfOfWallSt);
        assertThat(leoWolfRelationships, hasSize(2));
        assertThat(leoWolfRelationships, containsInAnyOrder(jordanRole, produced));

        Set<Relationship> leoKeanuRelationships = graph.findMany(leo, keanu);
        assertThat(leoKeanuRelationships, hasSize(0));
    }
}
