% ---------------------------
% FAMILY TREE PROGRAM
% ---------------------------

% Basic family facts
parent(john, mary).
parent(john, mike).
parent(mary, alice).
parent(mike, emma).
parent(susan, mary).
parent(susan, mike).

male(john).
male(mike).
female(mary).
female(alice).
female(emma).
female(susan).

% ---------------------------
% Derived Rules
% ---------------------------

% Grandparent rule
grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

% Sibling rule
sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

% Cousin rule
cousin(X, Y) :-
    parent(A, X),
    parent(B, Y),
    sibling(A, B),
    X \= Y.

% Descendant rule (recursive)
descendant(X, Y) :- 
    parent(Y, X).
descendant(X, Y) :- 
    parent(Y, Z), 
    descendant(X, Z).

% ---------------------------
% Main Procedure (OneCompiler Friendly)
% ---------------------------

main :-
    write('--- Children of john ---'), nl,
    findall(Child, parent(john, Child), Children),
    write(Children), nl,

    write('--- Siblings of mary ---'), nl,
    findall(Sib, sibling(mary, Sib), Siblings),
    write(Siblings), nl,

    write('--- Grandchildren of john ---'), nl,
    findall(GC, grandparent(john, GC), Grandkids),
    write(Grandkids), nl,

    write('--- Cousins of alice ---'), nl,
    findall(Cous, cousin(alice, Cous), Cousins),
    write(Cousins), nl,

    write('--- Descendants of john ---'), nl,
    findall(D, descendant(D, john), Descendants),
    write(Descendants), nl.

:- initialization(main).
