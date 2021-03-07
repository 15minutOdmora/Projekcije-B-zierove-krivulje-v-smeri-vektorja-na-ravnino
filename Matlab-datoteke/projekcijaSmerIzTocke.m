function pr = projekcijaSmerIzTocke(t, toc)
% pr = projekcijaSmerIzTocke(t, toc)
% Funkcija projecira točke t na ravnino z = 0 v smeri iz dane točke toc
%   t = matrika dimenzije (3, n), kjer je vsaka točka en stolpec
%   toc = točka oblike [tx ty tz]
%
%   pr = matrika preslikanih tock dimenzije (3, n), kjer z = 0

% velikost oz. št točk
[n, st_tock] = size(t);
% Sestavimo matriko, kjer je vsak stolpec enak točki toc
mat_tocke = ones(3, st_tock) .* toc.';
% Sestavimo matriko vektorjev iz točke toc, do posamezne točke iz t
mat_vekt = t - mat_tocke;
% Vektorje ne normiramo, ker bi za to porabili n +  operacij
% računanje sprememb x, y, z točk
delta_x = t(3,:) .* (mat_vekt(1,:) ./ (mat_vekt(3,:) * -1));
delta_y = t(3,:) .* (mat_vekt(2,:) ./ (mat_vekt(3,:) * -1));
% prištevanje sprememb 
x_koncni = t(1,:) + delta_x;
y_koncni = t(2,:) + delta_y;
% končni vektor
pr = [x_koncni; y_koncni; zeros(1,n)];
end

