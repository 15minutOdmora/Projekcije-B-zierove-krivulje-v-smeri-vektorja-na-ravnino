function pr = projekcijaSmerVektorja(t,v)
% pr = projekcijaSmerVektorja(t,v)
% Funkcija preslika točke t v smeri danega vektorja v na ravnino z normalo
% n = [0, 0,..., 0, 1]
%   t = matrika poljubne dimenzije, kjer je vsak stolpec ena tocka (n, stevilo tock)
%   v = vektor oblike [v1 v2 v3 ... vn]
%
%   pr = matrika preslikanih tock dimenzije (n, stevilo tock), kjer pr(:,n) = 0

% dimenzija(n_t) in stevilo tock(m_t)
[n_t, m_t] = size(t);
[~, m_v] = size(v);

% Preveri če se dimenziji ujemata
if n_t ~= m_v
    sporocilo = 'Dimenziji točk in vektorja se ne ujemata.';
    error(sporocilo);
% V primeru, da je zadnja komponenta vektorja enaka 0 ali več
% vrnemo matriko ničel.
elseif v(m_v) == 0
    pr = zeros(n_t, m_t); 
else
    % Če vektor kaže navzgor točke in vekt. prezrcalimo preko ravnine z
    if v(m_v) > 0
        v(m_v) = v(m_v) * -1;
        t(n_t,:) = t(n_t, :) * -1;
    end
    % 'Odrežemo' vse točke, kjer je zadnja komponenta < 0
    t(:, t(n_t,:)<0) = [];
    % Ponastavimo velikost (št točk)
    [n_t, ~] = size(t);
    % Matrika zadnjih vrednosti (v 3d bi to ble z vred. tock)
    A = repmat(t(n_t,:),  [n_t, 1]);
    % Vektor razmerja 
    vekt = v / -v(m_v);
    % Računanje sprememb točk
    Delta = A .* vekt';
    % prištevanje sprememb točkam, dobimo končne preslikane točke
    pr = t + Delta;
end
end

