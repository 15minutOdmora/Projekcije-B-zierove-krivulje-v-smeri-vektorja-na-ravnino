function pr = projekcijaSmerVektorjaNaRavnino(t, v, n)
% pr = projekcijaSmerVektorjaNaRavnino(t, v, n)
% Funkcija preslika tocke t v smeri danega vektorja v na ravnino podano z normalo.
%   t = matrika poljubne dimenzije, kjer je vsak stolpec ena tocka (n, stevilo tock)
%   v = vektor oblike [v1 v2 v3 ... vn]
%   n = normala ravnine oblike [a b c]
% 
%   pr = matrika preslikanih tock dimenzije (n, stevilo tock), kjer pr(:,n) = 0

vekt_z = [0 0 1];
% Normiramo vektor n (funk. vecRotMat zahteva normiran vektor)
n = n * (1/norm(n));
% Ustvarimo dve rotacijski matriki:
% Prva zarotira iz vekt. n v vekt_z
R1 = vecRotMat(n, vekt_z);
% Druga pa iz vekt_z v vekt. n
R2 = vecRotMat(vekt_z, n);

% Dimenzije tock 
[n, st_tock] = size(t);
% Vse tocke zarotiramo z R1, tako, da problem pretvorimo na projekcijo na
% ravnino z = 0
rot_t = zeros(n, st_tock);
for i=1:st_tock
    % Zarotiramo tocke
    rot_t(:,i) = R1 * t(:,i);    
end
% Preslikamo točke na ravnino z = 0 v smeri vektorja v
pres_t = projekcijaSmerVektorja(rot_t, v);
% Posodobimo št. točk
[~, st_tock] = size(pres_t);
% Točke zarotiramo nazaj
for i=1:st_tock
    % Zarotiramo tocke
    rot_t(:,i) = R2 * pres_t(:,i);    
end
pr = rot_t;
end

