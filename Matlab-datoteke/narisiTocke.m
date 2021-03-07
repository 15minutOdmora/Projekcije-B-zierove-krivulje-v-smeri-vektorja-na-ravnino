function narisiTocke(t, barva)
% narisiTocke(t, barva)
% Funkcija nariše točke t v prostoru povezane z daljicami 
%   t = matrika tock, kjer je vsak stolpec ena točka (n, stevilo tock)
%   barva = niz barve točk

[n, m] = size(t);
% Če so tocke dimenzije 2 x st_tock, dodamo z = 0 vrednosti
if n == 2
    toc = [t(1); t(2); zeros(1,m)];
% Če so točke večje dimenzije kot 3 x st_tock, izpišemo napako
elseif n > 3
    sporocilo = 'Dimenzija točk je prevelika (>3).';
    error(sporocilo);
else 
    toc = t;
end
% Narišemo tocke
plot3(toc(1,:), toc(2,:), toc(3,:) ,append(barva, '-o'));
end
