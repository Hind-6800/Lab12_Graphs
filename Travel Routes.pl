% Task 1: Travel Routes

% Facts
edge('Makkah', 'Madinah').
edge('Makkah', 'Riyadh').

edge('Madinah', 'Makkah').
edge('Madinah', 'Taif').
edge('Madinah', 'Tabuk').

edge('Taif', 'Tabuk').
edge('Taif', 'Dammam').

edge('Tabuk', 'Taif').

edge('Riyadh', 'Dammam').

edge('Dammam', 'Riyadh').
edge('Dammam', 'Al-Qatif').

edge('Al-Qatif', 'Madinah').
edge('Al-Qatif', 'Dammam').

% Rules
travel(Start, Finish, Path) :-
    path(Start, Finish, [Start], P),
    reverse(P, Path).

% Base case
path(X, X, P, P).

% Recursive case
path(From, To, Visited, Path) :-
    edge(From, Next),
    \+ member(Next, Visited),
    path(Next, To, [Next | Visited], Path).