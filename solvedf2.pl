% adapted from Ivan Brakto book:
solvedf2(Maxdepth):-
	initial(InitialState),
	solvedf2(InitialState, [InitialState], Solution, Maxdepth),
        write(Solution).
solvedf2(State, _, [], _):-
	final(State),!.
solvedf2(State, History, [Move|Solution], Maxdepth):-
        Maxdepth > 0,
	transition(State, Move, State1),
	\+ member(State1, History),
        Max1 is Maxdepth -1,
	solvedf2(State1, [State1|History], Solution, Max1).
