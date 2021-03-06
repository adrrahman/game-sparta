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
npc(danlap).
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
object(foto).
object(jahim).

wearable(sepatu).
wearable(slayer).
wearable(jahim).