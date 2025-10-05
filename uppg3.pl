append([], L, L).
append([H|T], L, [H|R]) :- append(T,L,R).
my_length([], 0).
my_length([_|T], N) :- my_length(T, N1), N is N1 + 1.


% basfall: tom lista har en tom delsträng
partstring([], 0, []).

% om huvudet på listan är en del av delsträngen => lägg till i delsträngen 
partstring([H|T], L, F) :- 
    append(F, _, [H|R]), 
    F \= [], 
    my_length(F, L).


% om huvudet på listan inte är en del av delsträngen => fortsätt med resten av listan
partstring([_|T], L, F) :-
    partstring(T, L, F).