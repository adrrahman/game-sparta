/*quest hari pertama*/
questday1:-
	nl,
	write('Kamu terbangun di kosan dan ingat bahwa pagi ini adalah hari pertama '),
	write('Sparta. Kamu harus segera ke dingdong agar tidak terlambat.'),nl,
	write('Jangan lupa untuk memakai sepatu sebelum berangkat.'), nl,
	retract(location_quest(A)),
	asserta(location_quest(dingdong)),
	asserta(quest(satu,active)).

quest11done:- /*ditaroh di up*/
	location_now(dingdong),
	location_quest(dingdong),
	quest(satu,active),
	write('Sudah ada danlap yang menunggu di sini. Interupsi dan masuklah ke dalam barisan.'), nl,
	asserta(npc_at(danlap,dingdong)),
	retract(isjalan(yes)),
	asserta(isjalan(no)).

q1talk(danlap):-
	quest(satu,active),
	wear(sepatu),
	nama_player(X),
	write('"INTERUPSI. Nama '), write(X), write(' NIM 13515000 ijin memasuki barisan."'),nl,
	quest12,!.
q1talk(danlap):-
	quest(satu,active),
	nama_player(X),
	write('"INTERUPSI. Nama '), write(X), write(' NIM 13515000 ijin memasuki barisan."'),nl,
	quest11.
q1talk(_).

quest11:-
	write('"Kamu kenapa ga pake sepatu??"'),nl,
	write('a. Lupa'),nl,
	write('b. Sepatu saya rusak'),nl,
	write('..bagaimana kamu akan menjawabnya (a/b): '),
	read(X),q111(X).

q111(a):-
	write('"..emm maaf saya lupa danlap."'),nl,nl,
	write('"Ok, untuk hari ini saya maafkan."'),
	quest12,!.
q111(b):-
	write('"Sepatu saya rusak."'),nl,
	write("Kamu bohong ya?"),nl,
	write('"...."'),nl,
	write('"Tolong untuk jujur satu sama lain, ingat itu"'),quest12,!.
q111(_):-
	write('/*kamu memilih untuk diam*/'),nl,
	write('"Ya sudah."'), quest12.


quest12:-
	retract(npc_at(danlap,dingdong)),
	nama_player(X),
	nl,
	write('"Silahkan masuk ke barisan."'), nl,nl,
	write('"Sebelum kita mulai kegiatan pada hari ini. Mari cek jumlah kalian."'), nl,
	write('"Berhitung... MULAI"'), nl,
	write('"SATU"'), nl, nl,
	write('"DUA"'), nl, nl,
	write('"TIGA"'), nl, nl,
	write('"EMPAT"'), nl, nl,
	write('"LIMA"'), nl, nl,
	write('"SIAP, kurang DUA"'), nl, nl,
	write('/*tiba tiba kamu ditunjuk oleh danlap*/'), nl,
	write('"KAMU, Jadi berapa jumlah kalian sekarang?"'), nl, nl,
	write('/*kamu ingat bahwa sekarang kalian berbaris sepanjang 10 banjar*/'), nl,
	write('Jawaban kamu: '), read(A), nl,
	quest12done(A),!.

quest12done(48):-
	write('Teman-teman kagum melihatmu. Kamu berhasil menjawab dengan benar.'), nl,
	write('Poinmu bertambah!'),nl,
	poin(X),
	Y is X+5,
	retract(poin(X)),
	asserta(poin(Y)),
	quest13,!.

quest12done(_):-
	write('Danlap terlihat sebal menatapmu. Jawaban kamu sepertinya salah.'), nl,
	quest13,!.

quest13:-
	nl, write('"Sekarang kalian akan dimobilisasi menuju lapangan cinta"'), nl,
	write('"Harap jaga fokus kalian"'), nl,
	write('...'), nl,nl,
	write('Kamu sekarang berada di lapangan cinta'),nl,nl,
	retract(location_now(dingdong)),
	asserta(location_now(lapangan_cinta)),
	write('"Halo para anggota muda HMIF. Sekarang akan dibagikan slayer yang harus kalian jaga dengan bangga."'),nl,
	write('"Silahkan terima slayer yang diberikan panitia"'),nl,
	asserta(object_at(slayer,lapangan_cinta)).

quest14:-
	nl, write('Slayer didapatkan!'), nl,
	write('Sparta hari pertama telah selesai'),nl,
	write('Kamu kembali ke dingdong. Karena merasa capek, kamu ingin balik ke kosan.'),nl,
	retract(location_now(lapangan_cinta)),
	asserta(location_now(dingdong)),
	retract(location_quest(dingdong)),
	asserta(location_quest(kosan)),
	retract(quest(satu,active)),
	retract(isjalan(no)),
	asserta(isjalan(yes)).

quest14done:-
	location_now(kosan),
	location_quest(kosan),
	write('Kamu kelelahan dan segera ke kasur untuk tidur'),nl,
	retract(isjalan(yes)),
	asserta(isjalan(no)).

/*end quest hari pertama*/