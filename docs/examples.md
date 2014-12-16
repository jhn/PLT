Examples:

    actor:   Node = { name: String }
    movie:   Node = { title: String, year: Int }
    actedIn: Rel  = { role: String }

    keanu:   Node = actor[“Keanu”]
    matrix:  Node = movie[“Matrix”, 1999]
    neo:     Rel  = acted_in[“Neo”]

    leo:     Node = actor[“Leo”]
    wolf:    Node = movie[“Wolf”, 1994]
    jordan:  Rel  = acted_in[“Jordan”]

    titanic: Node = movie[“Titanic”, 1998]
    jack:    Rel  = acted_in[“Jack”]

    spg: Graph = (
     keanu neo matrix,
     leo jordan wolf,
     leo jack titanic
          )

    ; Node and Rel literal syntax is much easier to parse, so we can even inline Graph to
    spg: Graph = (
    		 keanu		acted_in(“John”)   movie(“Constantine, 2003),
    		 actor(“Keanu”) acted_in(“Neo”)    movie(“Matrix”, 1999),
    		 actor(“Leo”)   acted_in(“Jordan”) movie(“Wolf”, 1999),
    		 actor(“Leo”)   acted_in(“Jack”)   movie(“Titanic”, 1999),
          )

    ; inserting more actedIn movie relationships for keanu
    spg ^+ keanu acted_in(“Nelson”) movie(“Sweet November”, 2000)
    spg ^+ keanu acted_in(“Neo”)    movie(“Matrix Reloaded”, 2002)
    spg ^+ keanu acted_in(“Const”)  movie(“John Constantine”, 2004)

    ; find all movies in which keanu acted_in
    many_keanu_movies: List<Node> = find_many(keanu acted_in) ;
    ; find one actor that was in the matrix named “Neo”
    keanu:             Node       = find_one(acted_in(“Neo”) matrix) ;
    ; find all movies in which keanu acted in where he was named “Neo”
    many_neo_movies:   List<Node> = find_many(keanu acted_in(“Neo”))
    ; find one movie in which keanu acted in where he was named “Neo”
    one_neo_movie:     Node       = find_one(keanu acted_in(“Neo”))



    ; find one relationship between keanu and matrix
    keanu_matrix_relationship:                Rel = find_one(keanu matrix) ;
    ; find all relationships between keanu and matrix
    list_of_keanu_matrix_relationships: List<Rel> = find_many(keanu matrix) ;
