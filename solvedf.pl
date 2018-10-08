solvedf:-
	initial(InitialState),
	solvedf(InitialState, [InitialState], Solution),
        write(Solution).
solvedf(State, _, []):-
	final(State),!.
solvedf(State, History, [Move|Solution]):-
	transition(State, Move, State1),
	\+ member(State1, History),
	solvedf(State1, [State1|History], Solution).
