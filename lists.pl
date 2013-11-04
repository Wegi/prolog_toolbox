%% is_a_list(L) - true, if L of type list
is_a_list(L) :- is_of_type(list, L).

%Alternative to is_a_list without is_of_type
 %%lists2([_|_]).
 %%lists2([]).

%% prefix(P, L) - true if P prefix of L
prefix([], L) :- is_a_list(L).
prefix([HP|TP], [HL|TL]) :- 
	HP = HL, prefix(TP, TL).


%% suffix(S, L) - true if S suffix of L
suffix([], L) :- is_a_list(L), !.
suffix(S, L) :- 
	reverse(S, RS), reverse(L, RL),
	prefix(RS, RL).

%% infix(I, L) - true if I infix of L
infix([], L) :- is_a_list(L), !.
infix(L, L) :- is_a_list(L), !.
infix(I, L) :- prefix(I, L), !.
infix(I, [_|T]) :- 
	prefix(I, T), !; 
	infix(I, T).

%% element_of(E, L) - true if L has an element E
element_of(E, [H|T]) :-
	E = H, !;
	element_of(E,T).

%% del_element(E, L, R) - R is the list L without all occurences of E
del_element(E, [], []).
del_element(E, [E|T], R) :- !, del_element(E, T, R).
del_element(E, [H|T], [H|R]) :- del_element(E, T, R). 