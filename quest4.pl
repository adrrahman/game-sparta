/*quest hari terakhir*/
quest4 :-
	iscommand(no),
	asserta(poin(100)),
	asserta(quest(empat,active)),
	asserta(location_now(vib)),
	asserta(location_quest(vib)),
	asserta(inven(bukang)),
	asserta(inven(nametag)),
	asserta(wear(slayer)),
	write('Kamu telah sampai di VIB!'), nl,
	write('"Perhatian ada pada saya! Menurut kalian apa yang akan kita lakukan disini?"'), nl,
	read(L),nl,
	pendapat(L).
quest4 :-
	iscommand(yes),
	nl,write('Kamu tidak bisa menggunakan command ini').

pendapat(dilantik) :-
	write('"Kamu memang sudah merasa layak dilantik? Memang sudah kenal 100% angkatan kalian?"'),nl,
	lanjutan,!.

pendapat(L) :-
	write('"Hmm.. '),
	write(L),
	write(' yaa.. Mungkin saja"'), nl,
	lanjutan.

lanjutan :-	
	write('Kontribusi kalian di SPARTA akan dipertanyakan disini'), nl,
	nl,write('"Pertanyaan pertama untuk kalian semua.."'),nl,
	tanya2.

tanya2 :-
	write('"..berapa jumlah departemen di HMIF?"'),nl,
	read(X), nl,
	cektanya2(X).

cektanya2(6):- 
	poin(P),
	Y is P+2,
	retract(poin(P)),
	asserta(poin(Y)),
	write('"Ya, jawabanmu benar"'),nl,
	write('Poinmu bertambah!'),nl,!,
	quest42.

cektanya2(_):-
	write('"Seperti itu kamu merasa layak dilantik? Jawaban kamu salah."'),nl,
	write('"Cobalah sekali lagi.."'),nl,
	tanya2.

quest42 :-
	tanya3.

tanya3 :-
	nl, write('"Siapa nama ketang kalian?"'),nl,
	read(X), nl,
	cektanya3(X).

cektanya3(rahman):- 
	poin(X),
	Y is X+2,
	retract(poin(X)),
	asserta(poin(Y)),
	write('"Bagus, kalian harus mengenal ketang kalian."'),nl,
	write('Poinmu bertambah!'),nl,
	quest43,!.

cektanya3(_) :-
	write('"..jawaban kamu salah. Jangan harap dilantik"'),nl,
	quest42,!.

quest43 :-
	poin(X),X>=100,
	nl,write('"Selamat poin lantik kamu sudah mencukupi."'),nl,
	write('"Silahkan cari pinjaman jahim dan status anggota biasa HMIF akan ada di genggamanmu. '),
	write('Cari seorang kakak tingkat untuk dipinjam jahimnya!"'),nl,
	asserta(npc_at(korlap,vib)),
	asserta(npc_at(danlap_agitasi,vib)),
	asserta(npc_at(mamet,vib)),
	asserta(npc_at(msdm,vib)),
	asserta(npc_at(daemon,vib)),
	write('Ada korlap, danlap agitasi, mamet, msdm, dan daemon di sini..'),nl,
	write('..mungkin salah satu dari mereka ada yang mau meminjamkan').

quest43 :-
	nl,write('Tapi sayang sekali kamu belum cukup layak untuk dilantik.'),nl,!.

talkjahim(X) :-
	location_now(vib),
	quest(empat,active),
	npc_at(X,vib),
	write('"Halo, saya '),
	write(X), 
	write('"'),nl,
	write('"Dengar-dengar poinmu sudah mencukupi untuk dilantik ya? Apa yang kamu inginkan dari saya?"'),nl,
	read(M),nl,
	cektalk(M).
talkjahim(_).

cektalk(jahim) :-
	write('"Baik, ini jahim saya."'),nl,
	asserta(inven(jahim)),
	write('"Jaga baik-baik jahim ya!"'),nl,
	write('Kamu mendapatkan pinjaman jahim! Silahkan gunakan.'),!.

cektalk(_) :-
	write('"Maaf, saya tidak punya."').

cekquest4 :- /*ditaroh di use*/
	location_now(vib),
	location_quest(vib),
	inven(bukang),
	inven(nametag),
	wear(jahim),
	wear(slayer),
	retract(quest(dilantik,undone)),
	asserta(quest(dilantik,done)),
	nl,write('Selamat kalian sudah dilantik! Kami tunggu kontribusi kalian di HMIF.'),nl,
	write('Jaga kekompakan kalian! Jangan lupa sering-sering main ke Sekre ya!'), !.
cekquest4.
/*end quest hari terakhir*/