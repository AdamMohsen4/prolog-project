

edge(a, b).
edge(a, c).
edge(b, d).
edge(c, d).
edge(b, e).
edge(d, f).
edge(a,f).

path(Start, End, Path) 
  % something here


path_helper(Current, End, Visited, Path) :-
     Current = End,
     Path = Visited.

path_helper(Current, End, Visited, Path) :-