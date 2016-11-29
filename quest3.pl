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

quest3 :-
	asserta(location_now(dingdong)),
	asserta(location_quest(lapangan_sipil)),
	asserta(quest(quest3,aktif)),
	nl,write('Day 3 is here!'), nl,
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
	nl,
	write('Poin tambahan: 5'), nl,
	Y is X+5,
	retract(poin(X)),
	asserta(poin(Y)),
	nl,
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
	write('Sekarang, pergilah ke toko untuk membeli lem dan kertas.'), nl.

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