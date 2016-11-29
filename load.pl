load:-
	open('data.txt',read,File),
	read(File,A),
	asserta(A),
	read(File,A1),
	asserta(A1),
	read(File,A2),
	asserta(A2),
	read(File,A3),
	asserta(A3),
	read(File,A4),
	asserta(A4),
	read(File,A5),
	asserta(A5),

	read(File,Nbw),
	loada(File,Nbw),

	read(File,Nin),
	loada(File,Nin),

	read(File,Nol),
	loada(File,Nol),

	read(File,Nl),
	loada(File,Nl),

	read(File,Nql),
	loada(File,Nql),

	close(File).

loada(File,N):-
	N>0,
	read(File,B),
	asserta(B),
	N1 is N-1,
	loada(File,N1),!.
loada(File,0).