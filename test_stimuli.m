clear all;
close all;
clc;

% calculam tensiunea
u=round(1000*sin(2*pi*(0:919)'/920))+2048;
% calculam curentul
i=round(1000*sin(pi/4+2*pi*(0:919)'/920))+2048;

% salvam valoriile stimulilor in fisierul de tip .txt
f=fopen('stimuli.txt','w');
for k=1:920
	fprintf(f,'%X\n%X\n',u(k),i(k));
end
fclose(f);


