# Útvonalak

Az alábbi adatsor Magyarország megyeszékhelyeinek közúti távolságait tartalmazza km-ben.

A mátrix (tavolsag) és a városok neveit tartalmazó vektor (varos) segítségével válaszold meg az alábbi kérdéseket!

1\. min\_tav: Mennyi a minimális távolság 2 megyeszékhely közt?

2\. legkozelebb: Melyek ezek a városok?

3\. max\_tav: Mennyi a maximális távolság 2 megyeszékhely közt?

4\. legtavolabb: Melyek ezek a városok?

5\. atlag\_tav: Átlagosan mekkora távolságra van két megyeszéhely egymástól Magyarországon?

6\. kozel: Mely városok vannak Budapesttől (1) legfeljebb x km távolságra?

7\. utvonal: Hány km-t utazunk az alábbi útvonal bejárásával:

Zalaegerszeg (19) -> Pécs (10) -> Szeged (12) -> Debrecen (3) -> Miskolc (8) ?

A városneveket minden esetben ABC rendben add meg!

Hint: A városok neve mellett zárójelben szerepel az indexük, azaz hogy hanyadikak a listában (a varos vektor melyik eleméhez és a tavolsag mátrix mely oszlopához ill. sorához tartozik)? A 7. feladatban vizsgált útvonal mentén fekvő megyeszékhelyek indexeit a megfelelő sorrendben az utvonalhoz vektor tartalmazza. A városok nevét elég az alábbi formában megadni:

1×2 cell array

{'Győr'} {'Kecskemét'}

Lásd még: ind2sub, sub2ind, sort

```matlab
function [min_tav, legkozelebb, max_tav, legtavolabb, atlag_tav, kozel, utvonal] = varos_tavok(tavolsag, varos, x, utvonalhoz)
    min_tav = min(tavolsag(tavolsag ~= 0));
    [min_idx, ~] = find(tavolsag == min_tav);
    legkozelebb = sort(varos(min_idx));
    max_tav = max(tavolsag, [], 'all');
    [max_idx, ~] = find(tavolsag == max_tav);
    legtavolabb = sort(varos(max_idx));
    atlag_tav = mean(tavolsag(tavolsag ~= 0), 'all');
    kozel = sort(varos(0 < tavolsag(1, :) & tavolsag(1, :) <= x));
    honnan = utvonalhoz(1:end - 1);
    hova = utvonalhoz(2:end);
    utvonal = sum(tavolsag(sub2ind(size(tavolsag), honnan, hova)));
end
```


```matlab
varos={'Budapest' 'Békéscsaba' 'Debrecen' 'Eger' 'Győr'	'Kaposvár' 'Kecskemét'...
    'Miskolc' 'Nyíregyháza' 'Pécs' 'Salgótarján' 'Szeged' 'Székesfehérvár'...
    'Szekszárd'	'Szolnok' 'Szombathely' 'Tatabánya' 'Veszprém' 'Zalaegerszeg'};
tavolsag=[...
0	216	231	158	126	189	81	177	234	205	109	165	67	153	108	231	62	111	233;...
216	0	137	200	340	323	136	235	187	285	260	103	278	241	119	442	276	322	443;...
231	137	0	136	354	417	182	108	49	353	189	227	295	301	132	459	290	338	460;...
158	200	136	0	280	344	171	71	139	359	107	257	221	307	137	385	217	265	387;...
126	340	354	280	0	203	205	299	356	301	231	288	88	248	232	121	66	81	155;...
189	323	417	344	203	0	188	362	419	64	295	219	127	91	292	175	189	123	124;...
81	136	182	171	205	188	0	190	232	171	179	86	142	118	57	306	140	186	307;...
177	235	108	71	299	362	190	0	111	378	119	276	240	326	156	404	235	284	406;...
234	187	49	139	356	419	232	111	0	435	191	277	297	383	182	461	293	341	463;...
205	285	353	359	301	64	171	378	435	0	311	182	158	61	228	238	237	154	186;...
109	260	189	107	231	295	179	119	191	311	0	263	172	258	148	337	168	216	338;...
165	103	227	257	288	219	86	276	277	182	263	0	226	139	122	390	225	270	391;...
67	278	295	221	88	127	142	240	297	158	172	226	0	107	170	165	62	45	170;...
153	241	301	307	248	91	118	326	383	61	258	139	107	0	176	245	184	125	214;...
108	119	132	137	232	292	57	156	182	228	148	122	170	176	0	334	168	214	335;...
231	442	459	385	121	175	306	404	461	238	337	390	165	245	334	0	172	121	67;...
62	276	290	217	66	189	140	235	293	237	168	225	62	184	168	172	0	102	206;...
111	322	338	265	81	123	186	284	341	154	216	270	45	125	214	121	102	0	126;...
233	443	460	387	155	124	307	406	463	186	338	391	170	214	335	67	206	126	0];
x=150;
utvonalhoz=[19 10 12 3 8];
[min_tav, legkozelebb, max_tav, legtavolabb, atlag_tav, kozel, utvonal] = varos_tavok(tavolsag, varos, x, utvonalhoz)
```
