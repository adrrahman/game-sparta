/*Alokasi Variabel Dinamik*/
:- dynamic(poin/1).
:- dynamic(location_now/1).
:- dynamic(location_quest/1).
:- dynamic(nama_player/1).
:- dynamic(wear/1).
:- dynamic(money/1).
:- dynamic(inven/1).
:- dynamic(object_at/2).
:- dynamic(quest/2).
:- dynamic(npc_at/2).
:- dynamic(harga/2).


/*Deklarasi Fakta*/
/*Dynamic Clause*/
inven(meja).
inven(kursi).

inven(bukang).
inven(madurasa).
inven(tolak_angin).
inven(nametag).
inven(ponco).
inven(sepatu).

money(50000).

nama_player(unnamed).

poin(0).

quest(dilantik, undone).
quest(jadi_ketang, undone).

wear(nothing).
wear(slayer).


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
npc_at(daemon,lapangan_sipil).
npc_at(ibu_kos,kosan).
npc_at(danlap_agitasi,kandang_domba). /*npc sementara untuk tes*/

object(slayer).
object(nametag).
object(madurasa).
object(tolak_angin).
object(ponco).
object(sepatu).
object(bukang).
object(kertas).
object(gunting).
object(lem).
object(foto).
object(pulpen).
object(tali).

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
cek(person) :-
	location_now(X),
	npc_at(Y,X),
	write('Di sini ada: '), write(Y).

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
	cekquest3,!,cektoko3,!.
	
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
	cek_location,!,cekquest1,!,cekquest33,!,cekquest34,!.
	
down :- 
	location_now(X),
	jalan(X,bawah,Y),
	retract(location_now(X)),
	asserta(location_now(Y)),
	write('Berjalan ke bawah......'), nl,
	cek_location,!.
/*end of direction*/

buy(kertas) :-
	quest(quest3,aktif),
	location_now(toko),
	money(X),
	write('Jumlah uangmu saat ini adalah: '), write(X), nl,
	harga(kertas,Y),
	write('Harga kertas: '), write(Y), nl,
	Z is X-Y,
	retract(money(X)),
	asserta(money(Z)),
	asserta(inven(kertas)),
	write('Kamu baru saja membeli kertas'), nl,
	write('Jumlah uangmu saat ini adalah: '), write(Z), nl,!.

buy(lem) :-
	quest(quest3,aktif),
	location_now(toko),
	money(X),
	write('Jumlah uangmu saat ini adalah: '), write(X), nl,
	harga(lem,Y),
	write('Harga lem: '), write(Y), nl,
	Z is X-Y,
	retract(money(X)),
	asserta(money(Z)),
	asserta(inven(lem)),
	write('Kamu baru saja membeli lem'), nl,
	write('Jumlah uangmu saat ini adalah: '), write(Z), nl,!.

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
	cek(nama),
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
	write(X), nl, nl.
	
making(bukang) :-
	retract(inven(kertas)),
	retract(inven(lem)),
	retract(inven(foto)),
	asserta(inven(bukang)).

making(nametag) :-
	retract(inven(tali)),
	retract(inven(kertas)),
	asserta(inven(nametag)).

making(ensiklopedia) :-
	quest(quest3,aktif),
	retract(quest(talk_bethea,done)),
	retract(quest(talk_icha,done)),
	retract(quest(talk_rahman,done)),
	retract(quest(talk_rio,done)),
	retract(inven(lem)),
	retract(inven(kertas)),
	asserta(inven(ensiklopedia)).
	
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
cekquest1.
/*end quest hari pertama*/

/*quest hari ketiga*/
quest3 :-
	asserta(location_now(dingdong)),
	asserta(location_quest(lapangan_sipil)),
	asserta(quest(quest3,aktif)),
	write('Day 3 is here!'), nl,
	write('Beberapa orang sedang menunggumu di lapangan sipil, temuilah mereka dan cari tau tugasmu hari ini!'), nl,
	write('Jangan lupa membawa spek lengkap!'), nl,
	write('Lokasi sekarang: dingdong'), nl.
	
cekquest3 :-
	location_now(lapangan_sipil),
	location_quest(lapangan_sipil), nl,
	quest31.
cekquest3.

quest31 :- 
	write('Sudah ada daemon yang menunggumu di sini. Mereka meminta ENIGMA untuk melakukan cek spek.'), nl, nl,
	cekquest31.
	
cekquest31 :- 
	wear(slayer),
	inven(bukang),
	inven(madurasa),
	inven(tolak_angin),
	inven(nametag),
	inven(ponco),
	inven(sepatu),
	write('Selamat! Spekmu lengkap!'), nl,nl,
	poin(X),
	cek(poin),nl,
	write('Poin tambahan: 5'), nl,
	Y is X+5,
	retract(poin(X)),
	asserta(poin(Y)),
	cek(poin),nl,
	tanya32,!.

cekquest31 :-
	poin(X), Y is X-2,
	retract(poin(X)), asserta(poin(Y)),
	write('Tidak! Spekmu tidak lengkap.'), nl,
	write('Poinnmu telah dikurangi'), nl,
	write('Tetapi hari ini daemon sedang berbaik hati, poinmu bisa bertambah lagi jika kamu bisa menjawab pertanyaan daemon dengan benar'), nl,
	write('Tunggu apa lagi, segeralah berbicara dengan mereka!'), nl.
	
cektanya312(b) :- 
	nl,
	write('Selamat, jawabanmu benar'), nl,
	tanya32,!.

cektanya312(_) :-
	nl,
	write('Jawaban salah'), nl,
	quest33,!.



tanya32 :-
	nl,
	write('Sekarang daemon meminta ENIGMA untuk menginterupsi. '), nl,
	write('Interupsi(y/n)?'), nl,
	read(X),
	cektanya32(X).

quest33 :-
	nl,
	write('Akibat dari tindakanmu, daemon memberimu tugas khusus'), nl,nl,
	write('Buatlah ensiklopedia ENIGMA'), nl,
	write('Objek yang harus kamu kumpulkan antara lain kertas dan lem. Jangan lupa cari tahu tempat lahir mereka'), nl,
	write('Kamu sekarang dipersilahkan mencari objek-objek tersebut'), nl, nl,
	write('Hint: pergilah ke tempat dimana tempat itu (seharusnya) merupakan tempat ternyaman untukmu setelah rumah dan kosanmu.').

cekquest33 :-
	location_now(basecamp),
	asserta(npc_at(bethea,basecamp)),
	asserta(npc_at(icha,basecamp)),
	asserta(npc_at(rahman,basecamp)),
	asserta(npc_at(rio,basecamp)),
	nl,
	write('Kamu telah menemukannya! Basecamp adalah tempat yang tepat untuk mencari tahu tempat lahir teman-temanmu'), nl,
	write('Di sini ada Bethea, Icha, Rahman, dan Rio'), nl,
	write('Mengobrolah dengan mereka. Ketika kamu sudah mengetahui tempat lahir semua temanmu, ketikkan command "tanyaenigma."'),!.
cekquest33.
tanyaenigma :- 
	quest(talk_icha,done),
	quest(talk_bethea,done),
	quest(talk_rahman,done),
	quest(talk_rio,done),
	nl,
	write('Dimana bethea lahir?'), nl,
	write('Jawabanmu: '), read(X), nl,
	cektanyabethea(X),!, nl,
	write('Dimana icha lahir?'), nl,
	write('Jawabanmu: '), read(Y), nl,
	cektanyaicha(Y),!, nl,
	write('Dimana rahman lahir?'), nl,
	write('Jawabanmu: '), read(Z), nl,
	cektanyarahman(Z),!, nl,
	write('Dimana rio lahir?'), nl,
	write('Jawabanmu: '), read(W), nl,
	cektanyario(W),!, nl,
	write('Selamat! Kamu telah mendapat data tentang tempat lahir teman-temanmu.'), nl,
	write('Sekarang, pergilah ke toko untuk membeli lem dan kertas.'). nl.

cektanyaicha(bandung) :-
	write('Selamat, jawabanmu benar'), nl.
cektanyabethea(solo) :-
	write('Selamat, jawabanmu benar'), nl.
cektanyarahman(surabaya) :-
	write('Selamat, jawabanmu benar'), nl.
cektanyario(trenggalek) :-
	write('Selamat, jawabanmu benar'), nl.

cektoko3 :-
	quest(quest3,aktif),
	location_now(toko),
	asserta(harga(kertas,10000)),
	asserta(harga(lem,2000)),
	nl,
	write('"Selamat datang di toko. Ingin membeli sesuatu? Ketikkan command "buy(<namabarang>)""'), nl.

cekquest33f :-
	making(ensiklopedia),
	inven(ensiklopedia),
	nl,
	write('Selamat, kamu telah menyelesaikan tugas ensiklopedia'), nl,
	end3.

cektanya32(y) :-
	nl, nl,
	write('"Interupsi Daemon!"'), nl,
	write('Bagus, kamu berani menginterupsi! Lima poin telah ditambahkan untukmu'), nl,
	tanya321.
cektanya32(_) :-
	nl, nl,
	write('Tidak! Ternyata tidak ada satu orang pun yang berani interupsi'), nl,
	quest33.

tanya321 :-
	location_now(lapangan_sipil),
	location_quest(lapangan_sipil),
	npc_at(daemon,lapangan_sipil),
	write('"Ada berapa komunitas di HMIF?"'), nl,
	read(X),
	cektanya321(X).

cektanya321(6) :-
	write('Selamat, jawabanmu benar'), nl,
	tanya322,!.
cektanya321(_) :-
	write('Jawabanmu salah'), nl,
	tanya322.

tanya322 :-
	nl,
	write('Selanjutnya daemon ingin mengetes seberapa kamu mengenal teman-teman di angkatanmu'), nl,
	write('"Siapa teman angkatanmu yang paling "receh?"'), nl,
	write('Jawaban (nama panggilan): '), nl,
	read(X),
	cektanya322(X).

cektanya322(jekk) :-
	write('Selamat, jawabanmu benar'), nl,
	tanya323,!.
cektanya322(_) :-
	write('Jawabanmu salah'), nl,
	write('Tingkatkan lagi pengetahuanmu tentang angkatanmu, ya!'), nl,
	end3.

tanya323 :-
	nl,
	write('Kamu telah berani menginterupsi dan menjawab pertanyaan dengan benar'), nl,
	write('Karena itulah daemon menganggapmu sebagai seseorang yang kompeten dan memiliki kepedulian tinggi'), nl,
	write('Jadi daemon memintamu untuk menjadi korang, apakah kamu bersedia? (y/n)'), nl,
	read(X),
	cektanya323(X).

cektanya323(y) :- 
	nl,
	write('Bagus! Kamu memiliki kemauan untuk berperan lebih di angkatanmu'), nl,
	quest34.

cektanya323(_) :- 
	nl,
	write('Sayang sekali, padahal ada sesuatu menarik yang menantimu'), nl,
	write('Tapi itu bukan masalah, setiap orang pasti memiliki pertimbangannya sendiri'), nl,
	end3.
	

quest34 :-
	nl,
	asserta(npc_at(rahman,kandang_domba)),
	write('Sekarang tugasmu adalah mencari temanmu, rahman, yang sudah beberapa kali tidak ikut SPARTA'), nl,
	write('Salah satu temanmu yang baik hati, sebut saja Mawar, memberimu clue tentang tempat dimana rahman berada.'), nl,
	write('Clue tempatnya adalah: "hanya sebuah nama, sebenarnya tidak ada"'), nl.

cekquest34 :-
	nl,
	location_now(kandang_domba),
	npc_at(rahman,kandang_domba),
	write('Kamu menemukannya! Sekarang, ajaklah ia bicara untuk menunjukkan kepedulianmu').
cekquest34.

cekquest34f :-
	nl,
	quest(talk_rahman,done),
	write('Well done! Harimu tampak sangat sempurna! Sejumlah poin telah diberikan untukmu. Tetap jaga performamu, ya!'), nl,
	end3.



end3 :- 
	retract(location_now(X)),
	retract(location_quest(X)),
	retract(quest(quest3,aktif)),
	nl,
	write('Hari ketiga telah selesai.'), nl.




/*end quest hari ketiga*/

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

talk(daemon) :-
	quest(quest3,aktif),
	location_now(lapangan_sipil),
	location_quest(lapangan_sipil),
	npc_at(daemon,lapangan_sipil),
	write('Berapa ENIGMA yang hadir saat ini?'), nl,
	write('a. 195'), nl,
	write('b. 98'), nl, nl,
	write('Masukkan pilihan jawaban (a/b): '),
	read(X),
	cektanya312(X),!.
talk(icha) :-
	quest(quest3,aktif),
	asserta(quest(talk_icha,done)),
	location_now(basecamp),
	write('Clue kota: "... ketika Tuhan sedang tersenyum"-M.A.W Brouwer'), nl,!.
talk(bethea) :-
	quest(quest3,aktif),
	asserta(quest(talk_bethea,done)),
	location_now(basecamp),
	write('Clue kota: Jokowi'), nl,!.
talk(rahman) :-
	quest(quest3,aktif),
	asserta(quest(talk_rahman,done)),
	location_now(basecamp),
	write('Clue kota: Hiu dan Buaya'), nl,!.
talk(rahman) :-
	quest(quest3,aktif),
	location_now(kandang_domba),
	npc_at(rahman,kandang_domba),
	asserta(quest(talk_rahman,done)),
	write('Terima kasih atas kepedulianmu!'),
	cekquest34f,!.
talk(rio) :-
	quest(quest3,aktif),
	asserta(quest(talk_rio,done)),
	location_now(basecamp),
	write('Clue kota: tarian Tronggoyakso'), nl,!.
talk(X) :-
	location_now(Y),
	npc_at(X,Y),
	write('Halo, saya '),
	write(X), nl,
	tanya1,!.
	

use(X) :- 
	inven(X),
	wear(X).
	
who :- 
	location_now(X),
	npc_at(Y,X),
	write('Di sini ada '), write(Y), nl,
	write('Cobalah berbicara dengan dia').
