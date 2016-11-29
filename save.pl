tut(File):-
	write(File,'.').

save :-
	open('data.txt',write,File),

	nama_player(X),
	write(File,nama_player(X)), tut(File), nl(File),
	retract(nama_player(X)),

	poin(P),
	write(File,poin(P)), tut(File),nl(File),
	retract(poin(P)),

	money(M),
	write(File,money(M)), tut(File),nl(File),
	retract(money(M)),

	isjalan(I),
	write(File,isjalan(I)), tut(File),nl(File),
	retract(isjalan(I)),

	location_now(Ln),
	write(File,location_now(Ln)),tut(File), nl(File),
	retract(location_now(Ln)),

	location_quest(Lq),
	write(File,location_quest(Lq)),tut(File), nl(File),
	retract(location_quest(Lq)),
	
	findall(W,wear(W),Wl),
	length(Wl,Nwl),
	write(File,Nwl), tut(File),nl(File),
	savewear(File),

	findall(In,inven(In),Inl),
	length(Inl,Nin),
	write(File,Nin), tut(File),nl(File),
	saveinven(File),

	findall(O, object_at(O,At), Ol),
	length(Ol,Nol),
	write(File,Nol), tut(File),nl(File),
	saveobjectat(File),

	findall(N, npc_at(N,Pl), Nl),
	length(Nl, Nnl),
	write(File,Nnl), tut(File),nl(File),
	savenpcat(File),

	findall(Q, quest(Q,St), Ql),
	length(Ql, Nql),
	write(File, Nql), tut(File),nl(File),
	savequest(File),

	close(File),
	load.
	
saveinven(File):-
	inven(I),
	retract(inven(I)),
	write(File,inven(I)), tut(File),nl(File),
	saveinven(File),!.
saveinven(File).

savenpcat(File):-
	npc_at(A,B),
	retract(npc_at(A,B)),
	write(File,npc_at(A,B)),tut(File),nl(File),
	savenpcat(File),!.
savenpcat(File).

saveobjectat(File):-
	object_at(A,B),
	retract(object_at(A,B)),
	write(File,object_at(A,B)),tut(File),nl(File),
	saveobjectat(File),!.
saveobjectat(File).

savequest(File):-
	quest(A,B),
	retract(quest(A,B)),
	write(File,quest(A,B)),tut(File),nl(File),
	savequest(File),!.
savequest(File).

savewear(File):-
	wear(A),
	retract(wear(A)),
	write(File,wear(A)), tut(File),nl(File),
	savewear(File),!.
savewear(File).