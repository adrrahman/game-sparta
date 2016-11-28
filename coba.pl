/*Alokasi Variabel Dinamik*/
:- dynamic(poin/1).
:- dynamic(location_now/1).
:- dynamic(nama_player/1).
:- dynamic(wear/1).
:- dynamic(money/1).
:- dynamic(inven/1).


/*Deklarasi Fakta*/
/*Dynamic Clause*/
inven(meja).
inven(kursi).

location_now(dingdong).

location_quest(7602).

money(50000).

nama_player(unnamed).

poin(0).

quest(dilantik, undone).
quest(jadi_ketang, undone).

wear(nothing).

/*Static Clause*/
jalan(sekre,kanan,7602).
jalan(7602,kiri,sekre).
jalan(7602,kanan,dingdong).
jalan(dingdong,kiri,7602).
jalan(dingdong,kanan,lapangan_sipil).
jalan(dingdong,atas,kandang_domba).
jalan(dingdong,bawah,kosan).
jalan(kandang_domba,atas,basecamp).
jalan(kandang_domba,bawah,dingdong).
jalan(basecamp,bawah,kandang_domba).
jalan(basecamp,kanan,toko).
jalan(toko,kiri,basecamp).
jalan(lapangan_sipil,kiri,dingdong).

location(7602).
location(lapangan_sipil).
location(dingdong).
location(kandang_domba).
location(basecamp).
location(toko).
location(sekre).
location(vib).
location(kosan).

npc(rezsky).
npc(mamet).
npc(friski).
npc(begaler).

npc_at(mamet,7602).
npc_at(begaler,lapangan_sipil).
npc_at(rezsky,dingdong).
npc_at(enigma-ers,basecamp).
npc_at(pedagang,toko).
npc_at(swasta,sekre).
npc_at(penjaga,vib).
npc_at(teman,kosan).
npc_at(domba,kandang_domba). /*npc sementara untuk tes*/

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

/*Deklarasi Rules*/
cek(inventory) :-
	findall(X,inven(X),Inventory),
	write('Inventory: '),
	write(Inventory).
cek(location) :-
	location_now(X),
	write(X).
cek(nama) :-
	nama_player(X),
	write('Nama player: '), write(X),nl.
cek(poin) :-
	poin(X),
	write('Poin: '), write(X).

cek_location:-
	location_now(sekre),
	quest(dilantik,undone),
	poin(X),
	Y is X-1,
	retract(poin(X)),
	asserta(poin(Y)),
	write('BOOM!!!, kamu telah memasuki area steril. Kakak tingkat telah diberitahu. Terdapat jalan ke kanan untuk menuju 7602'),nl.

cek_location:-
	location_now(dindong),
	quest(dilantik,undone),
	poin(X),
	Y is X-1,
	retract(poin(X)),
	asserta(poin(Y)),
	write('Kamu berada di selasar labtek V. Apakah kalian sudah kuorum untuk dimobilisasi? Terdapat jalan ke atas menuju basecamp, ke kanan menuju lapangan sipil, ke kiri menuju 7602, dan ke bawah menuju kandang domba'),nl.

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

/*Direction*/
right :-

	location_now(X),

	jalan(X,kanan,Y),

	retract(location_now(X)),

	asserta(location_now(Y)),

	write('Berjalan ke kanan......'), nl,

	look,

	cek_location,!.
left :-
	location_now(X),
	jalan(X,kiri,Y),
	retract(location_now(X)),
	asserta(location_now(Y)),
	write('Berjalan ke kiri......'), nl,
	look,
	cek_location,!.
up :-
	location_now(X),
	jalan(X,atas,Y),
	retract(location_now(X)),
	asserta(location_now(Y)),
	write('Berjalan ke atas......'), nl,
	look,
	cek_location,!.
down :- 
	location_now(X),
	jalan(X,bawah,Y),
	retract(location_now(X)),
	asserta(location_now(Y)),
	write('Berjalan ke bawah......'), nl,
	look,
	cek_location,!.
/*end of direction*/

drop(X) :- 
	inven(X),
	location_now(Y),
	asserta(object_at(X,Y)),
	write(X),write(' dropped'),nl.

empty(inventory,File,NbBarang) :-
	inven(X),
	!,
	retract(inven(X)),
	empty(inventory,File,NbBarang).
empty(inventory,File,NbBarang) :-
	loadbarang(File,NbBarang).

inspect(X):-
	X==slayer,
	write('Ini menandakan bahwa kamu calon anggota HMIF. Harus selalu dipakai jika berada di itb'), nl.

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

load :-
	open('data.txt', read, File),
	read(File,Namabaru),
	retract(nama_player(Namalama)),
	asserta(nama_player(Namabaru)),
	loadpoin(File).

loadpoin(File) :-
	read(File,Poin),
	poin(X),
	retract(poin(X)),
	asserta(poin(Poin)),
	read(File,NbBarang),
	empty(inventory,File,NbBarang).

loadbarang(File,A) :-
	A>0,
	read(File,Barang),
	asserta(inven(Barang)),
	B is A-1,
	loadbarang(File,B).
loadbarang(File,0) :-
	close(File).
	
look :-
	location_now(X),
	write('Kamu sekarang berada di '),
	write(X), nl.

quit :- 
	write('Nama		: '), tulis_nama_player, nl,
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

save :-
	open('data.txt',write,File),
	nama_player(X),
	write(File,X), write(File,'.'), nl(File),
	poin(P),
	write(File,P), write(File,'.'), nl(File),
	findall(A,inven(A),Inventory),
	length(Inventory,L),
	write(File,L), write(File,'.'), nl(File),
	savebarang(Inventory,File).	

savebarang(Inventory,File):-
	Inventory= [H|Tail],
	/*write(File,H), write('.'), nl(File),*/
	write(File,H), write(File,'.'), nl(File),
	savebarang(Tail,File).

start :-
	write('Selamat datang di Game Petualangan Sparta'), nl,
	write('Silahkan masukkan namamu (tidak menggunakan huruf kapital): '),
	read(X),
	retract(nama_player(Y)),
	asserta(nama_player(X)),
	nl,
	instructions.

status :-
	poin(X),
	write('Total poinmu sekarang adalah : '), nl,
	write(X).

take(X):-
	object_at(X,Y),
	location_now(Y),
	asserta(inven(X)),
	write(X),write(' taken'), nl.

talk(X) :-
	location_now(Y),
	npc_at(X,Y),
	write('Halo, saya '),
	write(X), nl,
	tanya1.

use(X) :- 
	inven(X),
	wear(X).
	
who :- 
	location_now(X),
	npc_at(Y,X),
	write('Di sini ada '), write(Y), nl,
	write('Cobalah berbicara dengan dia').
