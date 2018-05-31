clc;clear;
b1 = ('resources/a.bmp');
b2 = ('resources/ba.bmp');
d1 = ('resources/ha.bmp');
d2 = ('resources/ro.bmp');
j1 = ('resources/sa.bmp');

ib1 = im2double(imread(b1));
ib2 = im2double(imread(b2));
id1 = im2double(imread(d1));
id2 = im2double(imread(d2));
ir1 = im2double(imread(j1));

r1 = reshape(ib1,1,22500);
r2 = reshape(ib2,1,22500);
r3 = reshape(id1,1,22500);
r4 = reshape(id2,1,22500);
r5 = reshape(ir1,1,22500);

k1=r1';
k2=r2';
k3=r3';
k4=r4';
k5=r5';

citra_training = [k1,k2,k3,k4,k5];
target = eye(5);

[R,Q] = size(citra_training);
[S2,Q] = size(target);

S1=15;
global net;
net = newff (minmax(citra_training),[S1 S2], {'logsig', 'logsig'}, 'traingdx');
net.LW{2,1} = net.LW{2,1}*0.01;
net.b{2}=net.b{2}*0.01;

net.performFcn='sse';
net.trainParam.goal=1e-8;
net.trainParam.show=20;
net.trainParam.epochs=5000;
%net.trainParam.mc=0.95;

P=citra_training;
T=target;

[net,tr]= train(net,P,T);