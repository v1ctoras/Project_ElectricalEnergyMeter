clear all;
close all;
clc;

h=0.1e-3;
t=(0:h:60e-3-h)';

b=fir1(600-1,0.01);
a=[1 zeros(1,600-1)];
f=logspace(0,3,4001)';
%[m,p]=dbode(b,a,h,2*pi*f);
H=polyval(b,exp(2*pi*1i*f*h))./polyval(a,exp(2*pi*1i*f*h));
m=abs(H);
p=180*angle(H)/pi;

bb=ones(1,100)/100;
aa=[1 zeros(1,99)];
%[mm,pp]=dbode(bb,aa,h,2*pi*f);
H=polyval(bb,exp(2*pi*1i*f*h))./polyval(aa,exp(2*pi*1i*f*h));
mm=abs(H);
pp=180*angle(H)/pi;

figure;
semilogx(f,[mm m]);
grid;


fo=50;
fo_set=48:1:52;
nf=size(fo_set,2);
ph_set=(0:0.01:0.99)*2*pi;
np=size(ph_set,2);

cs=sin(2*pi*fo*t);
cc=cos(2*pi*fo*t);

for i=1:nf
	for j=1:np
		x=cos(2*pi*fo_set(i)*t+ph_set(j));
		n=size(x,1);
		s=2*fft(x(1:200))/200;
		v(i,j)=s(2);
		q=b*(x.*cs)-1i*b*(x.*cc);
		vv(i,j)=2*q;
	end
end

figure;
plot(abs(v'));
grid;

figure;
plot(abs(vv'));
grid;


	