% Hjälppredikat
select (X ,[ X | T ] , T ) .
select (X ,[ Y | T ] ,[ Y | R ]) : - select (X ,T , R ) .
member (X , L ) : - select (X ,L , _ ) .

% Fall 1: Listan är tom
remove_duplicates([], []).

% Fall 2: Om H finns i T → dubblett: hoppa över H
remove_duplicates([H|T], E) :- member(H, T), remove_duplicates(T,E).

% Fall 3: Om H inte finns i T → behåll H
remove_duplicates([H|T], [|E]) :- \+ member(H, T), remove_duplicates(T,E). 


% Varför kan man kalla remove_duplicates/2 för en funktion? 
% Svar: Eftersom varje indata (en lista) ger exakt en utdata (en lista utan dubbletter).