function b = narisiBezier(kont, barva)
% b = narisiBezier(kont, barva)
% Funkcija nariše Bezierjevo krivuljo na podlagi podanih kontrolnih točk.
% in vrne točke na krivulji.
%   kont = matrika kontrolnih točk, kjer je vsak stolpec ena točka (n, stevilo tock)
%   barva = niz, ki predstavlja barvo krivulje
%
%   b = matrika točk na krivulji dimenzije [n, st_tock]

% Dimenzije 
[n, m] = size(kont);
% Če so tocke dimenzije 2 x st_tock, dodamo z = 0 vrednosti
if n == 2
    toc = [kont(1); kont(2); zeros(1,m)];
% Če so točke večje dimenzije kot (3 x st_tock), izpišemo napako
elseif n > 3
    sporocilo = 'Dimenzija točk je prevelika (>3).';
    error(sporocilo);
else 
    toc = kont;
end
% Nastavimo parameter t
t = linspace(0, 1, 100);
% Generiramo tocke za Bezierjevo krivuljo
b = bezier(toc, t); 
% Narišemo krivuljo
plot3(b(1,:), b(2,:), b(3,:), barva);
end

