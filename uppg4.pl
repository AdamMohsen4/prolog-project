
% Hjälppredikat
append([], L, L).
append([H|T], L, [H|R]) :- append(T, L, R).
select(X, [X|T], T).
select(X, [Y|T], [Y|R]) :- select(X, T, R).
member(X, L) :- select(X, L, _).

% Graf definition
edge(a, b).
edge(a, c).
edge(b, d).
edge(c, d).
edge(b, e).
edge(d, f).
edge(a, f).

% Huvudpredikat
path(Start, End, Path) :-
    path_helper(Start, End, [Start], Path).

% fall: om nuvarande nod är slutnoden, är vi klara (och returnerar sökvägen)
path_helper(Current, End, Visited, Path) :-
     Current = End,
     Path = Visited.

% rekursivt fall: utforska grannar (liknande DFS)
path_helper(Current, End, Visited, Path) :-
      edge(Current, Next),
      \+ member(Next, Visited), % om nästa nod inte har besökts
      append(Visited, [Next], NewVisited),
      path_helper(Next, End, NewVisited, Path).