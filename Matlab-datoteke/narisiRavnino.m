function narisiRavnino(n, interval)
% narisiRavnino(normala, interval)
% Funkcija nariše ravnino z normalo n v prostoru, kjer je n = [a b c]  
% ravnina pa ax + bx + cz = 0
%   n = normala [a b c]
%   interval = [xi, xj] interval od kje do kje narisati ravnino  

% Računanje točk
n = n * (1/norm(n));
a = n(1); b = n(2); c = n(3);
[x, y] = meshgrid(interval(1):1:interval(2));
z = -1*((a/c).*x + (b/c).*y);

% Izris
s = surf(x,y,z);
set(s,'FaceColor',[0 0 1], ...
      'FaceAlpha',0.5,'FaceLighting','gouraud','EdgeColor','none')
end

