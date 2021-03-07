function main_risanjeBezierovihKrivulj
% Funkcija izriše Figuro, kjer je možno z klikom na tipke in levim klikom 
% miške dodajati kontrolne točke na graf, jih premikati in izrisati
% Bezierovo krivuljo.

clear all;
najvecjeStTock = 20;

% definiramo limite velikosti grafa (da se ne resizea)
x_velikost = [-100 100];
y_velikost = [-100 100];
% odpremo nov figure z podanimi limitami
fig = figure('Resize','off');
xlim(x_velikost)
ylim(y_velikost)
hold on; grid on;

% Nastavitev figure velikosti
x0=10;
y0=10;
width=900;
height=900;
set(gcf,'position',[x0,y0,width,height])
% nastavitev za tipke
set(fig,'KeyPressFcn',@pritisnjenaTipka);

% izpisemo navodila
disp('Ukazi: ');
disp('t ... Dodaj kontrolno točko');
disp('m ... Premakni točko');
disp('b ... Generiraj Bezierovo krivuljo glede na kontrolne točke');
% disp('r ... Rotacija okoli osi (y = 0)'); Ne dela

% narisemo funkcijo y = 0
plot([0 0], [-100 100]);
% dolocimo spremenljivke
global st_tock; global tocke; global narisane_tocke; global bt;
tocke = ones(najvecjeStTock,2) * -200;
st_tock = 0;
narisane_tocke = zeros(1,najvecjeStTock);

    function narisiVse
        % funkcija narise vse tocke in bez. krivuljo
        cla;
        plot([0 0], [-100 100]);
        for i=1:st_tock
           narisane_tocke(i) = plot(tocke(i,1), tocke(i,2), 'r-o');
        end
        if not(isempty(bt))
            plot(bt(1,:), bt(2,:), 'r');
        end
    end

    function y = pritisnjenaTipka(~,event)
        % ce pritisnemo t
        if strcmp(event.Key,'t')==1
            dodajTocko;
            narisiVse;
        % ce pritisnemo m
        elseif strcmp(event.Key, 'm')==1
            premakniTocko;
            narisiVse;
        % ce pritisnemo b
        elseif strcmp(event.Key,'b')==1
            generirajBezier;
            narisiVse;
        % ce pritisnemo r
        elseif strcmp(event.Key,'r')==1
            rotacija;
        end
    end

    function dodajTocko
        % funkcija doda tocko na graf
        tocka = ginput(1);
        st_tock = st_tock + 1;
        tocke(st_tock,1) = tocka(1);
        tocke(st_tock,2) = tocka(2);
        narisiVse;
    end
    
    function premakniTocko
        % funkcija premakne izbrano tocko
        tocki = ginput(2);
        tocka1 = tocki(1,:);
        tocka2 = tocki(2,:);
        % najdemo indeks najblizje tocke tocki ena(prvi izbrani) 
        [~, x_indeks] = min(abs(tocke(:,1)-tocka1(1))); %najblizji indeks
        [~, y_indeks] = min(abs(tocke(:,2)-tocka1(2)));
        % Ce se indeksa ujemata, premaknemo 
        if x_indeks == y_indeks
            tocke(x_indeks,1) = tocka2(1);
            tocke(y_indeks,2) = tocka2(2);
            % zbrisemo zadnjo narisano tocko
            % delete(narisane_tocke(x_indeks));
        end
        if not(isempty(bt))
            % ce je krivulja ze bla narisana, jo ponovno narisemo, da se
            % popravi glede na spremenjeno tocko
           generirajBezier; 
        end
    end

    function generirajBezier
        % funkcija zgenerira tocke bezierjeve krivulje glede na dolocene
        % kontrolne tocke
        if st_tock > 1
            transp = tocke';
            kontrolne_tocke = transp(:,1:st_tock);
            t = linspace(0, 1, 100);
            bt = bezier(kontrolne_tocke, t);
            narisiVse;
        end
    end

    function rotacija
        % Ne dela trenutno
        % funkcija zarotira bezierjevo krivuljo, ter izrise surf
        rotacijaKontrolnihTock(bt, 30);
    end
end
