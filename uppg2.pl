% Hjälppredikat
select(X, [X|T], T).
select(X, [Y|T], [Y|R]) :- select(X, T, R).
member(X, L) :- select(X, L, _).

% Huvudpredikat - använder en ackumulator för att hålla koll på vad vi redan sett
remove_duplicates(L, E) :-
    remove_helper(L, [], E).

% Basfall: tom lista
remove_helper([], _, []).

% Fall 1: H finns redan i Seen (ackumulatorn) → hoppa över H
remove_helper([H|T], Seen, E) :-
    member(H, Seen),
    remove_helper(T, Seen, E).

% Fall 2: H finns INTE i Seen → behåll H och lägg till i Seen
remove_helper([H|T], Seen, [H|E]) :-
    \+ member(H, Seen),
    remove_helper(T, [H|Seen], E).