
/*Deklarasi Rules*/

check(inventory) :-
	findall(X,inven(X),Inventory),
	write('Inventory: '),
	write(Inventory),nl,!.
check(location) :-
	location_now(X),
	write('Kamu sekarang berada di: '), write(X), nl,
	cek_location,!.
check(name) :-
	nama_player(X),
	write('Nama player: '), write(X),nl,!.
check(point) :-
	poin(X),
	write('Pointmu sekarang: '), write(X),nl,!.
check(_):-
	write('Tidak ditemukan informasi terkait hal tersebut.'),nl.

cek_location:-
	location_now(sekre),
	quest(dilantik,undone),
	poin(X),
	Y is X-1,
	retract(poin(X)),
	asserta(poin(Y)),
	write('BOOM!!!, kamu telah memasuki area steril. Kakak tingkat telah diberitahu. Terdapat jalan ke kanan untuk menuju 7602'),nl.
cek_location:-
	location_now(dingdong),
	write('Inilah selasar labtek V. Tempat anak informatika biasa mengerjakan tugas. Terdapat jalan lurus menuju basecamp, ke'),
	write(' kanan menuju lapangan sipil, tangga ke kiri menuju 7602, dan belakang adalah jalan '),
	write('ke kosan.'),nl.
cek_location:-
	location_now(7602),
	quest(dilantik,undone),
	poin(X),
	Y is X-1,
	retract(poin(X)),
	asserta(poin(Y)),
	write('Sudah siap mendapatkan materi? Kamu berada di ruangan 7602 yang berada di lantai 3 labtek V. Terdapat jalan ke kanan menuju dingdong dan ke kiri menuju sekre'),nl.
cek_location:-
	location_now(kandang_domba),
	quest(dilantik,undone),
	poin(X),
	Y is X-1,
	retract(poin(X)),
	asserta(poin(Y)),
	write('Sudah siap bertemu swasta? Kamu berada di suatu tempat yang gelap, ternyata kandang domba namanya! Terdapat jalan ke atas menuju dingdong'),nl.	
cek_location:-
	location_now(basecamp),
	quest(dilantik,undone),
	poin(X),
	Y is X-1,
	retract(poin(X)),
	asserta(poin(Y)),
	write('Tugas angkatan? Kamu berada di basecamp ENIGMA. Terdapat jalan ke kanan menuju toko dan ke bawah menuju dingdong'),nl.
cek_location:-
	location_now(toko),
	quest(dilantik,undone),
	poin(X),
	Y is X-1,
	retract(poin(X)),
	asserta(poin(Y)),
	write('Kehabisan spek? Kamu berada di Toko Spek. Terdapat jalan ke kiri menuju basecamp'),nl.
cek_location:-
	location_now(lapangan_sipil),
	quest(dilantik,undone),
	poin(X),
	Y is X-1,
	retract(poin(X)),
	asserta(poin(Y)),
	write('Siap mobilisasi? Kamu berada di Lapangan Sipil. Terdapat jalan ke kiri menuju dingdong'),nl.
	
craft(X) :- 
	syarat_craft(craft(X)),
	making(X).

/*Direction*/
right :-
	isjalan(yes),
	location_now(X),
	jalan(X,kanan,Y),
	retract(location_now(X)),
	asserta(location_now(Y)),
	write('Berjalan ke kanan......'), nl,
	look,!.
right :-
	isjalan(no),
	write('Kamu tidak bisa kemana-mana sekarang.'),nl.
	
left :-
	isjalan(yes),
	location_now(X),
	jalan(X,kiri,Y),
	retract(location_now(X)),
	asserta(location_now(Y)),
	write('Berjalan ke kiri......'), nl,
	look,!.
left :-
	isjalan(no),
	write('Kamu tidak bisa kemana-mana sekarang.'),nl.

up :-
	isjalan(yes),
	location_now(X),
	jalan(X,atas,Y),
	retract(location_now(X)),
	asserta(location_now(Y)),
	write('Berjalan ke atas......'), nl,
	look,
	quest11done,!.
up :-
	isjalan(no),
	write('Kamu tidak bisa kemana-mana sekarang.'),nl.

down :-
	isjalan(yes),
	location_now(X),
	jalan(X,bawah,Y),
	retract(location_now(X)),
	asserta(location_now(Y)),
	write('Berjalan ke bawah......'), nl,
	look,
	quest14done,!.
down :-
	isjalan(no),
	write('Kamu tidak bisa kemana-mana sekarang.'),nl.
/*end of direction*/

drop(X) :- 
	inven(X),
	location_now(Y),
	asserta(object_at(X,Y)),
	write(X),write(' dropped'),nl.


inspect(X):-
	inven(X),
	X=slayer,
	write('Ini menandakan bahwa kamu calon anggota HMIF. Harus selalu dipakai jika berada di itb'), nl.

instructions :-
	write('Berikut adalah command yang dapat kamu masukkan selama bermain'), nl,
	write('check()              		-- digunakan untuk mengecek hal-hal seperti inventory, nama player, dll'),nl,
	write('right,left,up,down		-- jalan ke kanan, kiri, atas, atau bawah'), nl,
	write('use 				-- mengenakan barang yang berada di inventory'), nl,
	write('take				-- mengambil suatu objek'), nl,
	write('talk				-- berbicara dengan npc'), nl,
	write('look				-- mengecek lokasi sekitar'), nl,
	write('Selamat bersenang-senang! Semoga cepat dilantik, ya!'), nl.

intro:-
	nama_player(X),
	write(X),
	write(' adalah seorang Calon Anggota Biasa Himpunan Mahasiswa Informatika'), nl,
	write('Untuk dilantik, kamu harus memenuhi persyaratan kakak tingkat dengan mengumpulkan poin'), nl,
	nl.

look :-
	location_now(X),
	write('Kamu sekarang berada di '), write(X), nl,
	findall(A,object_at(A,X),List),
	tulis(List).

making(bukang) :-
	retract(inven(kertas)),
	retract(inven(lem)),
	retract(inven(foto)),
	asserta(inven(bukang)).

making(nametag) :-
	retract(inven(tali)),
	retract(inven(kertas)),
	asserta(inven(nametag)).

move(wear):-
	wear(X),
	retract(wear(X)),
	asserta(inven(X)),
	move(wear),!.
move(wear).

/*quest coba-coba*/
quest1 :-
	asserta(location_now(kosan)),
	asserta(location_quest(basecamp)),
	write('Kamu telah menerima tugas baru!'), nl,
	write('Pergilah ke beskem untuk hari ini'), nl,
	write('Lokasi sekarang: kosan'), nl.

cekquest1 :-
	location_now(basecamp),
	location_quest(basecamp),
	write('Misi selesai! selamat!'), nl.
/*end quest coba-coba*/

quit :- 
	write('Nama		: '), nl,
	write('Poin		: '), poin(Y), write(Y), nl,
	write('Status Quest'), nl,
	quest(dilantik,A), quest(jadi_ketang,B),
	write('Dilantik	: '), write(A), nl,
	write('Jadi ketang : '), write(B), nl,
	retract(nama_player(X)),
	asserta(nama_player(unnamed)),
	retract(poin(Y)),
	asserta(poin(0)),
	retract(money(Z)),
	asserta(money(50000)),
	write('Terima kasih'), nl.

/*Quiz*/
tanya1 :-
	write('siapa kahim hmif: '),
	read(X), nl,
	cektanya1(X).

cektanya1(bimo):- /*pake cektanya1 gimana?._.*/
	poin(X),
	Y is X+2,
	retract(poin(X)),
	asserta(poin(Y)),
	write('jawaban benar'),nl,!.
cektanya1(_) :-
	write('jawaban kamu salah'),nl.
/*end of quiz*/

start1 :-
	nl,write('Selamat datang di Game Petualangan Sparta'), nl,
	write('Silahkan masukkan namamu (tidak menggunakan huruf kapital): '),
	read(X),
	retract(nama_player(N)),
	asserta(nama_player(X)),
	intro,
	instructions,
	questday1,!.

status :-
	poin(X),
	write('Total poinmu sekarang adalah : '), nl,
	write(X).
	
syarat_craft(craft(bukang)) :-
	inven(kertas), 
	inven(mika), 
	inven(lem), 
	inven(foto),!. 
syarat_craft(craft(bukang)):-
  	write('Perlengkapan tidak ada untuk membuat bukang'),nl,!,fail.
syarat_craft(_).

syarat_craft(craft(nametag)) :-
	inven(tali),
	inven(kertas),!.
syarat_craft(craft(nametag)):-
  	write('Perlengkapan tidak ada untuk membuat nametag'),nl,!,fail.
syarat_craft(_).

take(slayer):-
	quest(satu,active),
	location_now(lapangan_cinta),
	asserta(inven(slayer)),
	quest14,!.
take(X):-
	object(X),
	object_at(X,Y),
	location_now(Y),
	asserta(inven(X)),
	retract(object_at(X,Y)),
	write('...'), write(X),write(' diambil'), nl, !.
take(X):-
	object(X),
	write('Barang tersebut tidak ada di sini'), nl, !.
take(X):-
	write(X), write(' bukanlah suatu benda yang bisa disimpan.'),nl.
	
talk(A):-
	npc(A),
	location_now(X),
	npc_at(A,X),
	q1talk(A),
	talkjahim(A),!.
talk(X):-
	npc(A),
	write(X), write(' tidak berada di sini.'),nl.
talk(X):-
	write(X),write(' bukanlah seorang npc.'),nl.

tulis([]).
tulis(List):-
	List= [H|List1],
	write('Ada '),write(H),write(' di sini.'), nl,
	tulis(List1),!.

use(X) :-
	inven(X),
	wearable(X),
	retract(inven(X)),
	asserta(wear(X)),
	write('Memakai '), write(X), write('...'), nl,
	cekquest4,!.
use(X):-
	inven(X),
	write(X), write(' bukan barang yang bisa dipakai.'), nl,!.
use(X):-
	object(X),
	wearable(X),
	write(X), write(' tidak ada di inventory'), nl, !.
use(_):-
	write('Kamu tidak bisa menggunakan use untuk barang tersebut'), nl.

who :- 
	location_now(X),
	npc_at(Y,X),
	write('Di sini ada '), write(Y), nl,
	write('Cobalah berbicara dengan dia').