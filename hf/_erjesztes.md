# Erjesztés

A feladatleírás értelmezhetetlen

Valami gépi tanulásos cucclit kéne csinálni, de csak a tanár logikája szerint lenne elfogadható

```matlab
function [teszt, mspe, fokszam, p, becsult, meghalad, kiont] = erjedes(ido, temp, betanito, kuszob)
    teszt = ~betanito;
    fokszam = 1;
    mspe = inf;
    
    for d = 1:8 
        p = polyfit(ido(betanito), temp(betanito), d);
        
        xs = ido(teszt);
        ys = temp(teszt);
        vals = polyval(p, xs);
        err = sum((vals - ys).^2) / length(xs);
        
        if err < mspe
            mspe = err;
            fokszam = d;
        end
    end
    p = polyfit(ido, temp, fokszam);
    becsult = polyval(p, ido(1):ido(end));
    meghalad = any(becsult > kuszob);
    kiont = NaN;
end
```
