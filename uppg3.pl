append([], L, L).
append([H|T], L, [H|R]) :- append(T,L,R).
my_length([], 0).
my_length([_|T], N) :- my_length(T, N1), N is N1 + 1.


partstring([], 0, []).

partstring([H|T], L, F) :- 
    append(F, _, [H|R]),
    F \= [],
    my_length(R, L).