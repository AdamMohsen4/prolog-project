
append([], L, L).
append([H|T], L, [H|R]) :- append(T, L, R).

select(X, [X|T], T).
select(X, [Y|T], [Y|R]) :- select(X, T, R).
member(X, L) :- select(X, L, _).

edge(a, b).
edge(a, c).
edge(b, d).
edge(c, d).
edge(b, e).
edge(d, f).
edge(a,f).

path(Start, End, Path) :-
    path_helper(Start, End, [Start], Path).


path_helper(Current, End, Visited, Path) :-
     Current = End,
     Path = Visited.

path_helper(Current, End, Visited, Path) :-
      edge(Current, Next),
      \+ member(Next, Visited),
      append(Visited, [Next], NewVisited),
      path_helper(Next, End, NewVisited, Path).