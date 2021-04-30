# DNS szintézis

DNS molekula laboratóriumi szintézise során átlagban minden ezredik beépült bázispár hibás. Tegyük föl, hogy egy 1000 bázispár hosszúságú DNS szekvenciát szintetizálsz. Írj egy bemenő paraméter nélküli függvényt, amely kiszámolja

*   annak a valószínűségét, hogy a szintetizált DNS láncba három darab hibás aminosav épül be (harom\_hibas),
*   hogy egy adott 1000 bázispár hosszúságú szekvenciába hányféleképpen épülhet be pontosan két hibás bázispár (hanyfele),
*   annak a valószínűségét, hogy egy 1000 bázispár hosszúságú DNS szekvenciába pontosan két darab hibás bázispár épül be, pontosan az 500-adik és a 888-adik pozícióba (ketto\_500\_888),
*   és annak a valószínűségét, hogy egy DNS szekvenciában éppen két hibás bázispár épül be, és ezek egymás szomszédai a szekvencia mentén (szomszedos)!

```matlab
function [harom_hibas, hanyfele, ketto_500_888, szomszedos] = dns_szintezis()
    harom_hibas = nchoosek(1000, 3) * 0.001^3 * 0.999^997;
    hanyfele = nchoosek(1000, 2);
    ketto_500_888 = 1/hanyfele;
    ketto_hibas = nchoosek(1000, 2) * 0.001^2 * 0.999^998;
    szomszedos = 999/nchoosek(1000, 2) * ketto_hibas;
end
```

```
[harom_hibas, hanyfele, ketto_500_888, szomszedos] = dns_szintezis()
```
