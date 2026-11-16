clear all;
close all;
clc;

h=1/45000;
fn=0.5/h;

b=fir1(2699,50/fn);
a=[1 zeros(1,2699)];

f=logspace(0,3,4001)';
H=polyval(b,exp(2*pi*1i*f*h))./polyval(a,exp(2*pi*1i*f*h));
m=abs(H);
p=180*angle(H)/pi;

figure;
semilogx(f,m);
grid;

a=floor(log2(32767/max(b)));

bb=round(2^23*b);

% genereaza coeficientii filtrului si se salveaza
% in fisierul Coef_filt.txt pe care-l introducem in
% algoritm pentru microcontroller in MPLAB X IDE

f=fopen('Coef_filt.txt','w');
for k=1:2700
	fprintf(f,'%5d,',bb(k));
	if mod(k,9)==0
		fprintf(f,'\n\t\t\t\t\t\t');
	end
end
fclose(f); 
