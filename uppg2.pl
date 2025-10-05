% Hjälppredikat
select (X ,[ X | T ] , T ) .
select (X ,[ Y | T ] ,[ Y | R ]) : - select (X ,T , R ) .
member (X , L ) : - select (X ,L , _ ) .

% Fall 1: Listan är tom
remove_duplicates([], []).

% Fall 2: Om huvudet (H) finns i resten av listan (T), 
% är det en dubblett - skippa H och fortsätt med resten
remove_duplicates([H|T], E) :- member(H, T), remove_duplicates(T,E).

% Fall 3: Om huvudet (H) INTE finns i resten av listan (T),
% behåll H i resultatet och fortsätt med resten
remove_duplicates([H|T], [H|E]) :- \+ member(H, T), remove_duplicates(T,E).
