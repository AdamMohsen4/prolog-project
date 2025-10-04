append([], L, L).
append([H|T], L, [H|R]) :- append(T,L,R).
my_length([], 0).
my_length([_|T], N) :- my_length(T, N1), N is N1 + 1.


% base case
partstring([], 0, []).

% if the head of the list is part of substring, we include
partstring([H|T], L, F) :- 
    append(F, _, [H|R]),
    F \= [],
    my_length(R, L).


% if the heaed of the list is not part of the substring, we skip 
partstring([_|T], L, F) :-
    partstring(T, L, F).