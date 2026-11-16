clear all;
close all;
clc;

fe = 45000;	% frecventa de esantionare de 45000 Hz
fo=50; % frecventa 

t=(0:1/fe:0.1)'; % vector momente de timp in care se masoara semnalele

To=1/fo; % se calculeaza perioada
No=round(fe*To); % se calculeaza numarul intreg reprezentat

% filtrul de tip medie
b=ones(1,No)/No;
a=[1 zeros(1,No-1)];
fset=logspace(0,3,3001)';
H=polyval(b,exp(2*pi*1i*fset*(1/fe)))./polyval(a,exp(2*pi*1i*fset*(1/fe)));
m=abs(H);
p=180*angle(H)/pi;


% filtru cu raspuns finit la impuls (mai bun)
wn=fo/(0.5*fe);
bb=fir1(3*No-1,wn);
aa=[1 zeros(1,3*No-1)];
H=polyval(bb,exp(2*pi*1i*fset*(1/fe)))./polyval(aa,exp(2*pi*1i*fset*(1/fe)));
mm=abs(H);
pp=180*angle(H)/pi;

% reprezentam grafic cele 2 filtre mentionate
figure;
semilogx(fset,[mm m]); 
grid;

% facem o simulare pentru rezultate (calcul valoare eficace)
fr=55; % frecventa reala a semnalului

% calculam tensiunea
u=230*sin(2*pi*fr*t);

% calculam tensiunea la puterea a 2-a
u2=u.*u;

% notam pentru tensiune medie
uef_medie=dlsim(b,a,u2);
% notam pentru tensiune filtru
uef_filtru=dlsim(bb,aa,u2);

% reprezentam grafic tensiunea medie si tensiunea filtru
figure;
plot(t,[uef_medie uef_filtru]);
grid;

