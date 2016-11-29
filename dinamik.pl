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
:- dynamic(isjalan/1).
:- dynamic(started/1).
:- dynamic(harga/2).

/*Dynamic Clause*/
nama_player(unnamed).
poin(0).
money(50000).
isjalan(yes).
location_now(kosan).
location_quest(kosan).
started(no).

object_at(tolak_angin,toko).
object_at(madurasa,toko).
object_at(ponco,toko).
object_at(kertas,toko).
object_at(gunting,toko).
object_at(lem,toko).
object_at(pulpen,toko).
object_at(tali,toko).
object_at(sepatu,kosan).

quest(dilantik, undone).
quest(jadi_ketang, undone).