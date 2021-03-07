function narisiKrivuljo(tocke, barva)
% narisiKrivuljo(tocke, barva)
% Funkcija nariše krivuljo iz podanih točk v barvi barva 
%   tocke = matrika točk, kjer je vsak stolpec ena točka
%   barva = niz, ki predstavlja barvo krivulje

plot3(tocke(1,:), tocke(2,:), tocke(3,:), barva);
end