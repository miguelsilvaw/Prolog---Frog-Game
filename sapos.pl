:-[solvebf].
:-[solvedf].
:-[solvedf2].
:-dynamic(initial/1),
	dynamic(final/1).


%Estado Inicial
initial(sapo(1,2,3,5,6,7)).
%Estado Final
final(sapo(5,6,7,1,2,3)).


% right o sapo 3 uma casa para a direita:
transition(sapo(A1,A2,A3,B1,B2,B3),right31,sapo(A1,A2,NA3,B1,B2,B3)):-
	NA3 is A3 + 1,
	legal(NA3,A2,A1,B1,B2,B3),
	check(NA3),
	check1(NA3).

	% right o sapo 3 duas casas para a direita:
transition(sapo(A1,A2,A3,B1,B2,B3),right32,sapo(A1,A2,NA3,B1,B2,B3)):-
	NA3 is A3 + 2,
	legal(NA3,A2,A1,B1,B2,B3),
	check(NA3),
	check1(NA3).


% right o sapo 2 uma casa para a direita
transition(sapo(A1,A2,A3,B1,B2,B3),right21,sapo(A1,NA2,A3,B1,B2,B3)):-
	NA2 is A2 + 1,
	legal(NA2,A1,A3,B1,B2,B3),
	check(NA2),
	check1(NA2).



% right o sapo 2 duas casas para a direita
transition(sapo(A1,A2,A3,B1,B2,B3),right22,sapo(A1,NA2,A3,B1,B2,B3)):-
	NA2 is A2 + 2,
	legal(NA2,A1,A3,B1,B2,B3),
	check(NA2),
	check1(NA2).


% right o sapo 1 uma casa para a direita
transition(sapo(A1,A2,A3,B1,B2,B3),right11,sapo(NA1,A2,A3,B1,B2,B3)):-
	NA1 is A1 + 1,
	legal(NA1,A2,A3,B1,B2,B3),
	check(NA1),
	check1(NA1).


% right o sapo 1 duas casas para a direita
transition(sapo(A1,A2,A3,B1,B2,B3),right12,sapo(NA1,A2,A3,B1,B2,B3)):-
	NA1 is A1 + 2,
	legal(NA1,A2,A3,B1,B2,B3),
	check(NA1),
	check1(NA1).


%---------------------------------------------------------------------------
% right o sapo 5 uma casas para a esquerda
transition(sapo(A1,A2,A3,B1,B2,B3),left51,sapo(A1,A2,A3,NB1,B2,B3)):-
	NB1 is B1 - 1,
	legal(NB1,A1,A2,A3,B2,B3),
	check(NB1),
	check1(NB1).


% right o sapo 5 duas casas para a esquerda
transition(sapo(A1,A2,A3,B1,B2,B3),left52,sapo(A1,A2,A3,NB1,B2,B3)):-
	NB1 is B1 - 2,
	legal(NB1,A1,A2,A3,B2,B3),
	check(NB1),
	check1(NB1).


% right o sapo 6 uma casas para a esquerda
transition(sapo(A1,A2,A3,B1,B2,B3),left61,sapo(A1,A2,A3,B1,NB2,B3)):-
	NB2 is B2 - 1,
	legal(NB2,A1,A2,A3,B1,B3),
	check(NB2),
	check1(NB2).


% right o sapo 6 duas casas para a esquerda
transition(sapo(A1,A2,A3,B1,B2,B3),left62,sapo(A1,A2,A3,B1,NB2,B3)):-
	NB2 is B2 - 2,
	legal(NB2,A1,A2,A3,B1,B3),
	check(NB2),
	check1(NB2).


% right o sapo 7 uma casa para a esquerda
transition(sapo(A1,A2,A3,B1,B2,B3),left71,sapo(A1,A2,A3,B1,B2,NB3)):-
	NB3 is B3 - 1,
	legal(NB3,A1,A2,A3,B1,B2),
	check(NB3),
	check1(NB3).


% right o sapo 7 duas casas para a esquerda
transition(sapo(A1,A2,A3,B1,B2,B3),left71,sapo(A1,A2,A3,B1,B2,NB3)):-
	NB3 is B3 - 2,
	legal(NB3,A1,A2,A3,B1,B2),
	check(NB3),
	check1(NB3).

legal(X,Q,W,R,D,H):-
	X \== Q,
	X \== W,
	X \== R,
	X \== D,
	X \== H.

check(P):-
	P >= 0.

check1(P):-
	P =< 8.


interface:-
write(' Jogo Carregado! Bem-Vindo!!! '),nl,
write('			    -----------Solução Inicial-----------'),nl,
write('	 ______	   _______   _______   _______    _______   _______   _______	'),nl,				
write('	| SAPO1 | | SAPO2 | | SAPO3 | | PEDRA |  | SAPO5 | | SAPO6 | | SAPO7 |'),nl,
write(' 	|       | |       | |       | |       |  |       | |       | |       |'),nl,
write(' --------- ---------- --------- --------- --------- -------- ---------- ----------'),nl,
write(' 										'),nl,
write(' 										'),nl,
write(' 										'),nl,
write('		            ----------- Solução Final----------- '),nl,
write('	 ______	   _______   _______   _______   _______   _______   _______	'),nl,			
write('	| SAPO5 | | SAPO6 | | SAPO7 | | PEDRA | | SAPO1 | | SAPO2 | | SAPO3 |'),nl,
write(' 	|       | |       | |       | |       | |       | |       | |       |'),nl,
write(' --------- ---------- --------- --------- --------- -------- ---------- ----------'),nl,
write(' 										'),nl,
write(' 										'),nl,
write(' 										'),nl,
write(' 										'),nl,
write('			   ----------- Bem jogado! ----------- '),nl.
sapos:- interface, solvedf.
