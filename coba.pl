/*Alokasi Variabel Dinamik*/
:- dynamic(poin/1).
:- dynamic(location_now/1).
:- dynamic(location_quest/1).
:- dynamic(nama_player/1).
:- dynamic(wear/1).
:- dynamic(money/1).
:- dynamic(inven/1).
:- dynamic(object_at/2).


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
jalan(kosan,atas,dingdong).

location(7602).
location(lapangan_sipil).
location(dingdong).
location(kandang_domba).
location(basecamp).
location(toko).
location(sekre).
location(vib).
location(kosan).

npc(korlap).
npc(danlap_agitasi).
npc(mamet).
npc(msdm).
npc(begaler).
npc(daemon).
npc(annisa).
npc(bethea).
npc(rahman).
npc(rio).
npc(ibu_kos).
npc(penjual).

npc_at(mamet,7602).
npc_at(msdm,7602).
npc_at(begaler,lapangan_sipil).
npc_at(korlap,dingdong).
npc_at(penjual,toko).
npc_at(daemon,sekre).
npc_at(daemon,vib).
npc_at(ibu_kos,kosan).
npc_at(danlap_agitasi,kandang_domba). /*npc sementara untuk tes*/

object(bukang).
object(foto).
object(gunting).
object(jahim).
object(kertas).
object(lem).
object(madurasa).
object(nametag).
object(ponco).
object(sepatu).
object(slayer).
object(tali).
object(tolak_angin).

object_at(slayer,7602).
object_at(nametag,7602).
object_at(tolak_angin,toko).
object_at(madurasa,toko).
object_at(ponco,toko).
object_at(kertas,toko).
object_at(gunting,toko).
object_at(lem,toko).
object_at(pulpen,toko).
object_at(tali,toko).
object_at(foto,basecamp).
object_at(bukang,basecamp).
object_at(sepatu,kosan).


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
	
craft(X) :- 
	syarat_craft(craft(X)),
	making(X).

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
	cek_location,
	cekquest1,!.
	
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
	
making(bukang) :-
	retract(inven(kertas)),
	retract(inven(lem)),
	retract(inven(foto)),
	asserta(inven(bukang)).

making(nametag) :-
	retract(inven(tali)),
	retract(inven(kertas)),
	asserta(inven(nametag)).
	
/*quest hari pertama*/
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
/*end quest hari pertama*/

/*quest hari terakhir*/
quest4 :-
	asserta(location_now(vib)),
	asserta(location_quest(vib)),
	write('Kamu telah sampai di VIB!'), nl,
	write('Jangan harap perjalananmu akan mudah disini'), nl,
	write('Kontribusimu di SPARTA akan dipertanyakan disini'), nl,
	quest41.

quest41 :-
	tanya2.

quest42 :-
	tanya3.

quest43 :-
	poin(X),X>=100,
	write('Selamat poin lantik kamu sudah mencukupi'),nl,
	write('Silahkan cari pinjaman jahim dan status anggota biasa HMIF akan ada di genggamanmu'),
	write('Cari seorang kakak tingkat untuk dipinjam jahimnya!'),
	talkjahim(M).

quest43 :-
	quest41.

cekquest4 :-
	location_now(vib),
	location_quest(vib),
	inven(bukang),
	inven(nametag),
	wear(jahim),
	wear(slayer),
	retract(quest(dilantik,undone)),
	asserta(quest(dilantik,done)),
	write('Selamat kalian sudah dilantik! Kami tunggu kontribusi kalian di HMIF.'),nl,
	write('Jaga kekompakan kalian! Jangan lupa sering-sering main ke Sekre ya!'), nl.
/*end quest hari terakhir*/


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

tanya2 :-
	write('berapa jumlah departemen di HMIF?'),
	read(X), nl,
	cektanya2(X).

cektanya2(6):- 
	poin(X),
	Y is X+2,
	retract(poin(X)),
	asserta(poin(Y)),
	write('jawaban benar'),nl,!.
	quest42.

cektanya2(_) :-
	write('jawaban kamu salah'),nl.
	quest41.

tanya3 :-
	write('Siapa nama ketang kalian? '),
	read(X), nl,
	cektanya3(X).

cektanya3(rahman):- 
	poin(X),
	Y is X+2,
	retract(poin(X)),
	asserta(poin(Y)),
	write('jawaban benar'),nl,!.
	quest43.

cektanya3(_) :-
	write('jawaban kamu salah'),nl.
	quest42.

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

talkjahim(X) :-
	location_now(vib),
	npc_at(X,vib),
	write('Halo, saya '),
	write(X), nl,
	write('Dengar-dengar poinmu sudah mencukupi ya? Apa yang kamu inginkan dari saya?'),nl,
	read(M),nl,
	cektalk(M).

cektalk(jahim) :-
	write('Baik, ini jahim saya.'),nl,
	asserta(inven(jahim)),
	write('Jaga baik-baik jahim saya'),
	cekquest4.

cektalk(_) :-
	write('Maaf, saya tidak punya.').

use(X) :- 
	inven(X),
	wear(X).
	
who :- 
	location_now(X),
	npc_at(Y,X),
	write('Di sini ada '), write(Y), nl,
	write('Cobalah berbicara dengan dia').
