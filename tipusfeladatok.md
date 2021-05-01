# 2D grafika
## Egyszerű plot-ok

```matlab
plot(sin(0:2*pi)); % 0-tol 2pi-ig sin kirajzolasa
plot(sin(0:.001:2*pi)); % 0-tol 2pi-ig 0.001-es lepeskozzel
plot(sin(0:2*pi), 'rx'); % piros ikszekkel
plot(sin(0:.001:2*pi), 'g--') % zolden, szaggatottan
plot(pi:.001:2*pi, sin(pi:.001:2*pi), 'r'); % az x tengelyt beskalazzuk
plot(0:.001:10, [0:.001:10].^2, 'b'); % x^2 (matrix elemenkenti hatvanyozasaval)
plot(sin(0:.001:2*pi)); % ujra felidezzuk a jolismert latvanyt...
plot(sin(0:.001:2*pi)); axis([0 5000 -2 2]) % ... majd beallitjuk a kirajzolt tartomany hatarait: axis([xmin xmax ymin ymax])
```
```matlab
help plot % erdemes a See also fejezetet gorcso ala venni
```

```matlab
ezplot('x^2') % easy to use plot
ezplot('x^(1/2)') % mindent kitalal
ezplot('sin(x)') % egyszeru hasznalni
ezplot('x^5-17*x^3-5*x^2+2') % eljen-eljen
```

## Parametrikus plot-ok

```matlab
plot(cos(2*pi.*(0:0.01:1)),sin(2*pi.*(0:0.01:1))) % parametrikus gorbet rajzolunk. Ez igy meg kicsit ovalis, ezert...
axis square % ... ezert tengelyeket negyzetesre allitjuk 
```

```matlab
ezplot('cos(t)','sin(t)',[0 3*pi/2]); % ugyanezt megcsinalhatjuk ezplot-al is, az ert. tart.-t kulon beallitjuk, igy nem lesz teljes a kor 
axis square % es ismet atskalazzuk a tengelyeket
```

## abrak kezelese

```matlab
figure(1) % uj rajztablat csinalunk magunknak
plot(sin(0:.001:2*pi)); % es az ismert rajz
figure(2) % ismet uj felulet (regi megmaradt!!!)
plot(sin(0:.001:2*pi), 'r'); axis([0 5000 -2 2]) % ezt pedig mar az uj abrara
figure(1) % visszavaltunk az elsore
plot(cos(0:.001:2*pi), 'k') % es felulrajzoljuk
close(1) % bezarjuk az elso rajzot
close(2) % meg a masodikat is
```

```matlab
figure(1) % ujat nyitunk
hold on % egymasra szeretnenk rajzolni mindenfele abrat
plot(sin(0:.001:2*pi)); % ez legyen az egyik
plot(sin(0:.001:2*pi), 'r--'); axis([0 5000 -2 2]) % ez a masik
plot(cos(0:.001:2*pi), 'g') % ez meg a harmadik
hold off % befejezzuk az abra kesziteset
close(1)
```

## Subplot-ok kezelese

```matlab
figure(1) % uj lap
subplot(3,2,1) % 3x2-es figure-tabla letrehozasa, 1-essel fogunk dolgozni
plot(sin(0:2*pi)); % a szokasos
subplot(3,2,2) % a 2-es kisabrara valtunk
plot(-2*pi:2*pi, cos(-2*pi:2*pi)); % x tengely, y tengely ertekei
axis([-2*pi 2*pi -1.5 1.5]) % nyilvan itt is mukodik a tartomanyok meghatarozasa
xlabel('rad'); % igy feliratozzuk az x tengelyt
ylabel('cos(x)'); % igy pedig az y tengelyt
subplot(3,2,3) % 3-as abra
plot(sin(0:.001:2*pi)); % szep sin, az x tengely feliratai a vektor indexei
subplot(3,2,4) % 4-es abra
plot(atan(-2*pi:.001:2*pi)); % arcus tangens
xlabel('indexek'); % es az elmaradhatatlan felirat...
ylabel('arcus tg'); % ... a masik tengelyen is
subplot(3,2,5) % 5-os
plot(-2*pi:.001:2*pi, cosh(-2*pi:.001:2*pi), 'r'); % cosinus hiperbolicus, ertelmesre csinljuk az x tengely feliratait
subplot(3,2,6) % 6-os
plot(sin(0:.1:10*pi)./(0:.1:10*pi)); % sin(x)/x fuggv. 0-tol indulva, x tengely marad a vektor altal indexelve
axis tight % beallitjuk a tengelyeket, hogy az abra pont toltse ki a kepet
close(1) % es bezarjuk a muvunket
```

## Subplot-ok kezelese 2.

```matlab
figure(1) % ismet uj lap
subplot(3, 2, 4); % 4-es abra, most tetszoleges sorrendben toltjuk fel a plotokat
plot(-2*pi:.001:2*pi, cosh(-2*pi:.001:2*pi), 'r'); % cosinus hiperbolicus
axis tight % tengelyek beallitasa
subplot(3, 2, 5); % 5-os abra
hold on % tobb grafikon kerul fel
plot(0:1:10, [0:1:10].^2, 'r^'); % iksznegyzet, kis haromszogekkel rajzolva
plot(0:.001:10, ([0:.001:10].^2)./2, 'k'); % iksznegyzet/ketto, feketevel
hold off % es kesz ez az abra
subplot(3, 2, 1); % 1-es abra
hold on % ide 2 Gauss-fv.-t rakunk fel nemsokara. A Gauss-fv egy nagyon hasznos dolog, kesobb meg sokat fogtok talalkozni vele... :)
plot(-5:0.1:5, (1/sqrt(2*pi)) * exp( - ((-5:0.1:5).^2 ./ 2)), 'g'); % 0 varhato erteku, 1 szorasu Gauss-fv.
plot(-5:0.1:5, (1/(sqrt(2*pi)*2)) * exp(- (( (-5:0.1:5)-1).^2 ./ (2*2))), 'm'); % 1 varhato erteku, 2 szorasu Gauss-fv.
legend('Egyik fajta Gauss', 'Masik fajta Gauss'); % jelmagyarazatot ad a fuggvenyhez. Pontosan annyi parametert kell megadni, ahany plottolt fuggvenyunk van, nyilvanvaloan a plottolas sorrendjeben. 
hold off % kesz az abra
close(1) % becsukjuk
```

```matlab
figure('Name', 'Alternativ plotok'); % figure parancs expertebb hasznalata
subplot(1, 2, 1); % 2 abrank lesz, elsot fogjuk most rajzolgatni
stem(sin(0:0.5:3*pi)); % stem plot: bogyok labakkal
title('Kis bogyok labakkal'); % ezt jelezzuk a plot feliratan is
subplot(1, 2, 2); % a masik rajzteruletre valtunk
stairs(sin(0:0.5:3*pi)); % lepcsos formaban rajzoljuk ki ugyanazt
title('Szogletes univerzum'); % es adunk neki szep cimet
close % bezarjuk az ablakot
```

```matlab
clear all % tisztaba tesszuk magunkat
```

# 3D grafika
## Egyszeru 3D, terhalok

a 3D-s abrazolasban az egyik legfontosabb elemunk a meshgrid, 
terhalo lesz. Ez lehet csupan egy iranyu (mondjuk csak X iranyu), vagy
X-Y iranyu (egymasra meroleges vonalakbol osszeallitott halo). 
Nezzunk peldakat!

```matlab
[X, Y] = meshgrid(-2:.1:2); % gyartunk egy terhalot, -2 es 2 kozott, egy tizedenkent vett lepeskozzel
Z = X.*exp(-X.^2-Y.^2); % a terhalo minden pontjahoz szamitunk egy magassag-erteket
plot3(X, Y, Z) % a plot3 fuggveny segitsegevel 3D-ben abrazoljuk
grid on % bekapcsoljuk a halo-beosztast a plot-on
```

most nezzunk egy masik egyszeru peldat, az exponencialis huplik helyett
most a peaks fuggveny segitsegevel szamoljuk ki a Z magassagot egy X-Y
pontparhoz. 

```matlab
[X, Y] = meshgrid(-3:.125:3) % csinalunk egy terhalot, x-y sikot reprezentalvan
Z = peaks(X, Y)  % a peaks fuggveny erre a terhalora radobal neminemu hegyeket-volgyeket
mesh(X, Y, Z) % ezt abrazoljuk...
surf(X, Y, Z) % ...tobfelekeppen is
% a figure ablak fejleceben a kis mancs melletti korkoros nyilacskara
% kattintva forgassuk korbe az abrat, szemleljuk meg minden oldalrol!
close
```

```matlab
figure('Name', 'Mesh'); % uj abra
[x1, y1] = meshgrid(-pi:0.5:pi)   % ismet elkeszitjuk a terhalot
mesh(x1, y1, sin(x1)-cos(y1))       % Ugyanugy mukodik, mint a plot, csak itt megmondjuk, hogy x es y folott ertelmezzuk a z fuggvenyt, ami itt sin(x)-cos(x)
[x2, y2] = meshgrid(-pi:0.03:pi)  % a racspontokat lehet suriteni,
[x2, y2] = meshgrid(-pi:0.03:pi); % most, hogy ezt vegigvartuk, amig kiirta a kismillio erteket, erthetjuk miert van igazan szukseg ";"-re, probaljuk csak meg, hogy igy mennyivel gyorsabb?
mesh(x2, y2, sin(x2)-cos(y2))       % igy mar szebb, de az abrazolt felulet atlatszo... (zoomoljunk bele a figure-be, jol latszik!!!)
figure('Name', 'Surface'); % ... igy korulnezunk, hogy hogy lehet osszefuggo feluletet csinalni
surf(x1, y1, sin(x1)-cos(y1))       % es rabukkanunk a surface fuggvenyre, amely kitolti a rendelkezesre allo feluletet
close('Mesh')
close('Surface')

ezmesh('x^2-y^2') % easy to use itt is mukodik. Figyeljuk meg az ertlemezesi tartomanyt! 
ezmesh('x^2-y^2', [-2 2], [-2 2]) % most kezzel beallitottuk az ert. tart-t. Az ezmesh/ezplot/... fuggvenyek alapertelmezett ert. tart.-a -2*pi...2*pi
close
```

## Konturplot-ok

```matlab
figure(1) % uj abra
[X Y] = meshgrid(-3:0.1:3,-3:0.1:3); % teglalap teruleten definialunk terhalot
contour(X,Y,X.^2 + Y.^2) % Ez az un. contour-plot. Ekkor a feluletek szintvonalait abrazoljuk, direktben nem jelenik meg a felulet
axis square % meg megigazitjuk a tengelyeket
% ez igy jo, de tenyleg igy nez ki ez 3D-ben? Nezzuk meg!
Z = X.^2 + Y.^2; % legeneraljuk a felulet ertekeit (dontforget a ;-ot, kulonben a kiiratas miatt nagyon lassu lesz )
% es kovetkezzen 2 modszer:
figure % uj abra nyitasa
surfc(X,Y,Z); % a surfc fuggv. segitsevel egy abran lathatjuk a 3D-s es a konturplot-ot
% es a masik lehetosegunk egy kicsit hosszadalmasabb, am annal izgibb:
% (ehhez ki kell szallni a kifejt-bol!!!)
figure % ehhez a modszerhez is nyitunk egy uj abrat
for j = 1:1:180 % es korbejarjuk a problemat
    surf(X,Y,Z); % egy plottolas
    view([-20 j+30]) % egy nezopontvaltas
    M(j) = getframe; % kimentjuk a legeneralt frame-et
end % es vege a ciklusmagnak
% es most lassunk csodat :)
movie(M) % es lejatszuk az elkeszitett kepsorozatot
movieview(M) % egesz kis lejatszot rittyentettek nekunk a Mathworks mernokei
% hasznald a movie2avi fuggvenyt az avi-ban torteno kimenteshez
close all
```

clear all % nagytakaritas

### kovetkezzen egypar kicsit bonyolultabb contour-plot

```matlab
[X Y] = meshgrid(-3:0.1:3,-3:0.1:3); % ismet a szokasos meshgrid
[c h] = contour(X,Y,X.^2 - Y.^2); % kontur eloallitasa
clabel(c,h), colorbar % feliratozunk, es kirakjuk a szinskalat is a plotra
close % zarjuk be, hogy a nezhessuk a kovetkezot
[c h] = contour(X,Y,X.^2 - Y.^2,[0:3,6]); % ismet egy kontur-definicio, a masodik parameterben a jol ismert matlab-szintaxissal felsoroljuk, hogy mely magassagvonalakat kivanjuk latni
clabel(c,h) % es kirajzoljuk
close % tovabblepunk... 
clear all % tovabblepunk 2... 

% Kovetkezzen egy erekes gorbe - Lemniszkata - tovabbi info:
% http://www.hik.hu/tankonyvtar/site/books/b124/sec-15-03.html

[X Y] = meshgrid(-1.1:0.1:1.1,-1.1:0.1:1.1); % generaljuk le a vonatkozo terhalot
contour(X,Y,(X.^2 + Y.^2).^2 - X.^2+Y.^2,[0 0]) % konturplot
Z = (X.^2 + Y^2).^2 - X.^2+Y.^2; % szamoljuk ki 3D-ben
title('Lemniszkata (X^2 + Y^2)^2 - X^2+Y^2') % termeszetesen szepen feliratozzuk a plot-ot
surf(X,Y,Z) % majd nezzuk meg 3D-ben
axis square % szepre allitjuk a tengelyeket
% ismet nyugodtan forgassuk korbe a nezopontunkat a felulet korul a figure
% ablak fejleceben talalhato gombok segitsegevel!

% es kovetkezzen egy kis Matlab-feature:
% a workspace-unkben levo X, Y es Z valtozokat jeloljuk ki, es kattintsunk
% rajuk jobb gombbal. Valasszuk a More Plots menupontot, majd itt a
% listabol a 3D Surfaces elemet. A jobb oldalon megjeleno plot-tipusokbol
% valasszuk ki a nekunk tetszot (10 fogorvos kozul kilenc a surfc
% hasznalatat ajanlja :) ), majd nyomjuk meg a Plot in new figure gombot!
```

### Polarkoordinatak

```matlab
[theta, Z] = meshgrid((0:0.1:2)*pi, (-1:0.1:1)); % polarkoordinatas rendszerben fogunk dolgozni
X = sqrt(1-Z.^2).*cos(theta); % atteres a polarkoordinatarol X-Y sikra, elso egyenlet
Y = sqrt(1-Z.^2).*sin(theta); % atteres a polarkoordinatarol X-Y sikra, masodik egyenlet
surf(X, Y, Z); % es kesz a karacsonyfadiszunk
axis square % hogy szep gomb alaku legyen, ezert negyzetes skalazasura allitjuk a koordinatarendszert
```


## Vektormezok

```matlab
[x,y] = meshgrid(-1.1:.2:1.1,-1.1:.2:1.1) % a jol ismert terhalonk
figure(1) % uj abra
subplot(231); % sok kis abrank lesz ugyebar
quiver(x,y); % a kis nyilacskak az adott pontban levo "aramlas" sebesseget jelzik
axis equal; % szepre allitjuk a tengelyeket
subplot(232); % kovetkezo abrara lepunk
quiver(x,x); % a sebessegnek iranya es nagysaga is van, ezert jok nekunk a nyilak
axis equal; % folytatas...
subplot(233); % folytatas...
quiver(-y,x); % folytatas...
axis equal; % folytatas...
subplot(234); % folytatas...
axis equal; % folytatas...
quiver(y,x); % folytatas...
axis equal; % folytatas...
subplot(235); % folytatas...
quiver(x./(sqrt(x.^2+y.^2)),y./(sqrt(x.^2+y.^2))); % folytatas...
axis equal; % folytatas...
close(1) % ...ittavege
```


## Csavarvonalak

```matlab
plot3(cos(2*pi*(-2:0.01:2)), sin(2*pi*(-2:0.01:2)), -2:0.01:2); % hasznaljuk a plot3 fuggvenyt, amely 3D-ben tud vonalakat es pontokat kirajzolni
ezplot3('cos(2*pi*t)','sin(2*pi*t)','t',[-2 2]) % ugyanez ezplottal, nyilvan az elozo analogiajara az ezplot3 fuggveny lesz a baratunk
```

# Minták

### I.

Jelenitsd meg a sin(x)/x fuggvenyt 3D-ban, korkorosen minden iranyban!

```matlab
[X, Y] = meshgrid(-8:.5:8);
R = sqrt(X.^2 + Y.^2) + eps; % azert kell az eps, hogy nehogy az R nulla lehessen
Z = sin(R)./R; % R nem lehet nulla, elkerulendo a nullaval osztast (lasd elozo sor)
mesh(X, Y, Z); % ez igy mar szep, de...
surf(X, Y, Z, 'FaceColor', 'interp', 'EdgeColor', 'none', 'FaceLighting', 'phong'); % ...de igy meg szebb :) - felulet szineinek allitasa
daspect([5 5 1]); % de igy meg szebb :) - x-y-z ertekek aranyat transzformalja (x-y: 5, z: 1)
axis tight % de igy meg szebb :) - az abra es a tengelyek pont illeszkedjenek
view(-50, 30) % de igy meg szebb :) - nezzuk kicsit felulrol a dolgokat
camlight left % de igy meg szebb :) - es jojjon a feny balrol
```

### II.

ez egy kicsit sok es bonyolult dolgot hasznal, csupan arra szanjuk, hogy
megmutassuk a matlab grafikus kepessegeit. 
kovetkezzen tehat a Halalcsillag-plot!

```matlab
k = 5;
n = 2^k-1;
theta = pi*(-n:2:n)/n; % mettol meddig menjunk a szogekkel
phi = (pi/2)*(-n:2:n)'/n;
X = cos(phi)*cos(theta); % talan ismeros a gombi koordinatarendszer, na az kovetkezik itt
Y = cos(phi)*sin(theta);
Z = sin(phi)*ones(size(theta));
colormap([0 0 0;1 1 1])
C = hadamard(2^k); % legeneraljuk azt a szep sakktabla-mintat
surf(X,Y,Z,C) % es az egeszet kiplottoljuk
axis square
```

### III.

nezzuk meg egy felulet plotjat, a konturplotjat es a gradiens-mezojet

```matlab
[X,Y,Z] = peaks(20); % a jol ismert peaks fuggv.
dy = diff(X(1,1:2)); % gradiens-szamitas 1. 
dx = diff(Y(1:2,1)); % gradiens-szamitas 2. 
[PX,PY] = gradient(Z,dx,dy); % gradiens-szamitas 3. 


figure
subplot(1, 2, 1)
hold on
quiver(X,Y,PX,PY,1,'b'); % a gradiens kirajzolasa
contour(X, Y, Z); % es a konturplot ugyanott
axis([min(min(X)) max(max(X)) min(min(Y)) max(max(Y))]);
hold off
view([15 15]) % nezopont-allitas
subplot(1, 2, 2);
meshc(X, Y, Z); % a felulet es a konturplot egyben
axis([min(min(X)) max(max(X)) min(min(Y)) max(max(Y))]);
view([15 15]) % es a nezopont-allitas
```

