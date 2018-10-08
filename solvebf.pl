% Breadth-first Search
solvebf:- initial(InitialState),
	  solvebf([(InitialState, [])|Xs]-Xs, [], Solution),
	  write(Solution).

solvebf([(State, Vs)|_]-_, _, Rs) :- final(State),!,reverse(Vs, Rs).
solvebf([(State, _)|Xs]-Ys, History, Solution):- member(State, History),!,
						  solvebf(Xs-Ys, History, Solution).
solvebf([(State, Vs)|Xs]-Ys, History, Solution):- setof((Move, State1), transition(State, Move, State1), Ls),
				   		  update(Ls, Vs, [State|History], Ys-Zs),
						  solvebf(Xs-Zs, [State|History], Solution).

update([], _, _, X-X).
update([(_, State)|Ls], Vs, History, Xs-Ys) :- member(State, History),!,
					       update(Ls, Vs, History, Xs-Ys).
update([(Move, State)|Ls], Vs, History, [(State, [Move|Vs])|Xs]-Ys) :- update(Ls, Vs, History, Xs-Ys).
