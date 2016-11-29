start:-
	read(A),
	iscommand(A),!.

iscommand(start):-
	start1, nl,
	retract(started(no)), asserta(started(yes)),
	read(A),iscommand(A),!.

iscommand(check(A)):-
	started(yes),
	check(A), nl,
	read(B),iscommand(B),!.
iscommand(check(A)):-
	nl,write('Tolong mulai game dengan fungsi start.'),nl,nl,
	read(B),iscommand(B),!.
	
iscommand(look):-
	started(yes),
	look, nl, read(A), iscommand(A), !.
iscommand(look):-
	nl,write('Tolong mulai game dengan fungsi start.'),nl,nl,
	read(B),iscommand(B),!.

iscommand(instructions):-
	started(yes),
	instructions, nl, read(A), iscommand(A), !.
iscommand(instructions):-
	nl,write('Tolong mulai game dengan fungsi start.'),nl,nl,
	read(B),iscommand(B),!.

iscommand(take(A)):-
	started(yes),
	take(A), nl, read(B), iscommand(B), !.
iscommand(take(A)):-
	nl,write('Tolong mulai game dengan fungsi start.'),nl,nl,
	read(B),iscommand(B),!.

iscommand(right):-
	started(yes),
	right, nl, read(A), iscommand(A), !.
iscommand(right):-
	nl,write('Tolong mulai game dengan fungsi start.'),nl,nl,
	read(B),iscommand(B),!.

iscommand(left):-
	started(yes),
	left, nl, read(A), iscommand(A), !.
iscommand(left):-
	nl,write('Tolong mulai game dengan fungsi start.'),nl,nl,
	read(B),iscommand(B),!.

iscommand(down):-
	started(yes),
	down, nl, read(A), iscommand(A), !.
iscommand(down):-
	nl,write('Tolong mulai game dengan fungsi start.'),nl,nl,
	read(B),iscommand(B),!.

iscommand(up):-
	started(yes),
	up, nl, read(A), iscommand(A), !.
iscommand(up):-
	nl,write('Tolong mulai game dengan fungsi start.'),nl,nl,
	read(B),iscommand(B),!.

iscommand(talk(A)):-
	started(yes),
	talk(A), nl, read(B), iscommand(B), !.
iscommand(talk(A)):-
	nl,write('Tolong mulai game dengan fungsi start.'),nl,nl,
	read(B),iscommand(B),!.

iscommand(use(A)):-
	started(yes),
	use(A), nl, read(B), iscommand(B), !.
iscommand(use(A)):-
	nl,write('Tolong mulai game dengan fungsi start.'),nl,nl,
	read(B),iscommand(B),!.

iscommand(save):-
	started(yes),
	save, nl, read(A), iscommand(A), !.
iscommand(save):-
	nl,write('Tolong mulai game dengan fungsi start.'),nl,nl,
	read(B),iscommand(B),!.

iscommand(load):-
	started(yes),
	load, nl, read(A), iscommand(A), !.
iscommand(load):-
	nl,write('Tolong mulai game dengan fungsi start.'),nl,nl,
	read(B),iscommand(B),!.

iscommand(quit):-
	started(yes),
	quit, nl, read(A), iscommand(A), !.
iscommand(quit):-
	nl,write('Tolong mulai game dengan fungsi start.'),nl,nl,
	read(B),iscommand(B),!.

/*temporary*/
iscommand(quest3):-
	quest3, nl, read(A), iscommand(A), !.

iscommand(_):-
	nl,write('Ini bukan command yang valid'),nl,nl,
	read(A),iscommand(A).

