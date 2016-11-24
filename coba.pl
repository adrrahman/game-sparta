/*Alokasi Variabel Dinamik*/
:- dynamic(poin/1).
:- dynamic(location_now/1).
:- dynamic(nama_player/1).
:- dynamic(wear/1).
:- dynamic(money/1).
:- dynamic(inven/1).

<<<<<<< HEAD
/*Deklarasi Fakta*/
=======
/*Facts*/
>>>>>>> f08be1c225f3e186f9df7733fb967102a481d61a
inven(pena).
inven(kertas).

jalan(sekre,kanan,7602).
jalan(7602,kiri,sekre).
jalan(7602,kanan,dingdong).
jalan(dingdong,kiri,7602).
jalan(dingdong,kanan,lapangan_sipil).
jalan(dingdong,atas,basecamp).
jalan(dingdong,bawah,kandang_domba).
jalan(kandang_domba,atas,dingdong).
jalan(basecamp,bawah,dingdong).
jalan(basecamp,kanan,toko).
jalan(toko,kiri,basecamp).
jalan(lapangan_sipil,kiri,dingdong).

location_now(dingdong).
location_quest(7602).

location(7602).
location(lapangan_sipil).
location(dingdong).
location(kandang_domba).
location(basecamp).
location(toko).
location(sekre).
location(vib).
location(kosan).

money(50000).

npc(rezsky).
npc(mamet).
npc(friski).
npc(begaler).

npc_at(mamet,7602).
npc_at(begaler,lapangan_sipil).
npc_at(rezsky,dingdong).
nama_player(unnamed).

object(slayer).
object(nametag).
object(madurasa).
object(tolak_angin).
object(ponco).
object(sepatu).
object(bukang).
object(kertas).
object(pena).

object_at(slayer,7602).
object_at(tolak_angin,toko).

poin(0).

quest(dilantik, undone).
quest(jadi_ketang, undone).

wear(nothing).


/*Deklarasi Rules*/
take(X):-
	object_at(X,Y),
	location_now(Y),
	asserta(inven(X)),
	write(X),write(' taken'), nl.
	
drop(X) :- 
	inven(X),
	location_now(Y),
	asserta(object_at(X,Y)),
	write(X),write(' dropped'),nl.

use(X) :- 
	inven(X),
	wear(X).
	

tulis_nama_player:-
	nama_player(X),
	write(X).

instructions :-
	tulis_nama_player,
	write(' adalah seorang Calon Anggota Biasa Himpunan Mahasiswa Informatika'), nl,
	write('Untuk dilantik, kamu harus memenuhi persyaratan kakak tingkat dengan mengumpulkan poin'), nl,
	write('Berikut adalah command yang dapat kamu masukkan selama bermain'), nl,
	write('start					-- memulai permainan'), nl,
	write('look					-- mengetahui lokasi pemain'), nl,
	write('status					-- mengetahui poin pemain'), nl,
	write('right,left,up,down			-- jalan ke kanan, kiri, atas, atau bawah'), nl,
	write('take					-- mengambil suatu objek'), nl,
	write('talk					-- berbicara dengan npc'), nl,
	write('Selamat bersenang-senang! Semoga cepat dilantik, ya!'), nl.

start :-
	write('Selamat datang di Game Petualangan Sparta'), nl,
	write('Silahkan masukkan namamu (tidak menggunakan huruf kapital): '),
	read(X),
	retract(nama_player(Y)),
	asserta(nama_player(X)),
	nl,
	instructions.

right :-
	location_now(X),
	jalan(X,kanan,Y),
	retract(location_now(X)),
	asserta(location_now(Y)),
	write('Berjalan ke kanan......'), nl,
	cek_location,!.
left :-
	location_now(X),
	jalan(X,kiri,Y),
	retract(location_now(X)),
	asserta(location_now(Y)),
	write('Berjalan ke kiri......'), nl,
	cek_location,!.
up :-
	location_now(X),
	jalan(X,atas,Y),
	retract(location_now(X)),
	asserta(location_now(Y)),
	write('Berjalan ke atas......'), nl,
	cek_location,!.
down :- 
	location_now(X),
	jalan(X,bawah,Y),
	retract(location_now(X)),
	asserta(location_now(Y)),
	write('Berjalan ke bawah......'), nl,
	cek_location,!.

look :-
	location_now(X),
	write('Kamu sekarang berada di '),
	write(X), nl.
	
who :- 
	npc_at(Y,X),
	write('Di sini ada '),
	write(Y),
	write('. Kamu boleh berbicara dengan dia/mereka').

talk(X) :-
	location_now(Y),
	npc_at(X,Y),
	write('Halo, saya '),
	write(X), nl,
	tanya1.
	
status :-
	poin(X),
	write('Total poinmu sekarang adalah : '), nl,
	write(X).
	
inspect(X):-
	X==slayer,
	write('Ini menandakan bahwa kamu calon anggota HMIF. Harus selalu dipakai jika berada di itb'), nl.
	
cek_location:-
	location_now(sekre),
	quest(dilantik,undone),
	poin(X),
	Y is X-1,
	retract(poin(X)),
	asserta(poin(Y)),
	write('BOOM!!!, kamu telah memasuki area steril. Kakak tingkat telah diberitahu.'),nl.

cek(inventory):-
	findall(X,inven(X),Inventory),
	write(Inventory).
	
tanya1 :-
	write('siapa kahim hmif: '),
	read(X), nl,
	cektanya(X).

cektanya(bimo):- /*pake cektanya1 gimana?._.*/
	poin(X),
	Y is X+2,
	retract(poin(X)),
	asserta(poin(Y)),
	write('jawaban benar'),nl,!.

cektanya(_)	:-
	write('jawaban kamu salah'),nl.

quit :- 
	write('nama		: '), tulis_nama_player, nl,
	write('poin		: '), poin(Y), write(Y), nl,
	write('status quest'), nl, quest(dilantik,A), quest(jadi_ketang,B),
	write('dilantik	: '), write(A), nl,
	write('jadi ketang	: '), write(B), nl,
	retract(nama_player(X)),
	asserta(nama_player(unnamed)),
	retract(poin(Y)),
	asserta(poin(0)),
	retract(money(Z)),
	asserta(money(50000)),
	write('Terima kasih'), nl.
