clear all;
close all;
clc;

t=(0:0.0001:0.02-0.0001)'; % valoarea timpului
phi=pi/3; % valoarea defazajului
f=50; % valoarea frecventei

u=230*sqrt(2)*sin(2*pi*f*t); % calculeaza rezultatul tensiunii
i=10*sqrt(2)*sin(2*pi*f*t+phi); % calculeaza rezultatul curentului  
p=i.*u; % calculeaza rezultatul puterii active

% afiseaza prezentarea grafica a tensiunii
figure;
subplot(311);
plot(t,u, 'red');
grid;
% afiseaza prezentarea grafica a curentului
subplot(312);
plot(t,i, 'blue');
grid;
% afiseaza prezentarea grafica a puterii active
subplot(313);
plot(t,p, 'green');
grid;

% calculeaza rezultatul puterii active
P=mean(p);
% calculeaza rezultatul valorii a tensiunii efective
Uef=sqrt(mean(u.*u));
% calculeaza rezultatul valorii a curentului efective
Ief=sqrt(mean(i.*i));
% calculeaza rezultatul puterii aparente
S=Uef*Ief;
% calculeaza rezultatul puterii reactive
Q=sqrt(S*S-P*P);

% afiseaza rezultatul puterii active
fprintf('P: %f\n',P);
% afiseaza rezultatul puterii aparente
fprintf('S: %f\n',S);
% afiseaza rezultatul puterii reactive
fprintf('Q: %f\n',Q);
% afiseaza rezultatul valorii a tensiunii efective
fprintf('Uef: %f\n',Uef);
% afiseaza rezultatul valorii a curentului efective
fprintf('Ief: %f\n',Ief);


% calculeaza un exemplu de semnal
x=sin(2*pi*f*t)-sin(2*pi*3*f*t)/9+sin(2*pi*5*f*t)/25-sin(2*pi*7*f*t)/49+sin(2*pi*9*f*t)/81;
% afiseaza prezentarea semnalului
figure;
plot(t,x);
grid;