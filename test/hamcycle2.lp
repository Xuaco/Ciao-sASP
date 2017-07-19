% it's possible for chosen/2 and other/2 to succeed via left recursion if given
% the query ?- chosen(1,2).

% fact for each vertex(N).
vertex(0).
vertex(1).
vertex(2).
vertex(3).
vertex(4).

% fact for each edge edge(U, V).
edge(0, 1).
edge(1, 2).
edge(2, 3).
edge(3, 4).
edge(4, 0).
edge(4, 1).
edge(4, 2).
edge(4, 3).

reachable(V) :- chosen(U, V), reachable(U).
reachable(0) :- chosen(V, 0).

% Every vertex must be reachable.
:- vertex(U), not reachable(U).

% Choose exactly one edge from each vertex.
other(U, V) :-
    vertex(U), vertex(V), vertex(W),
    V \= W, chosen(U, W).
chosen(U, V) :-
    vertex(U), vertex(V),
    edge(U, V), not other(U, V).

% You cannot choose two edges to the same vertex
:- chosen(U, W), chosen(V, W), U \= V.