clear all;

%1. Pembentukan Pola Huruf untuk Pengenalan 

A1=[0 0 0 0 0 0 0;
    0 0 0 0 0 0 0;
    0 1 0 0 0 1 0;
    0 1 1 1 1 1 0;
    0 0 0 0 0 0 0;
    0 0 0 1 0 0 0;
    0 0 0 0 0 0 0;
    0 0 0 0 0 0 0;
    0 0 0 0 0 0 0];
B1=[0 0 0 0 0 0 0;
    0 0 0 0 0 0 0;
    0 0 0 1 0 0 0;
    0 0 0 1 0 0 0;
    0 0 0 1 0 0 0;
    0 0 0 1 0 0 0;
    0 0 0 1 0 0 0;
    0 0 0 0 0 0 0;
    0 0 0 0 0 0 0];
C1=[0 0 0 0 1 0 0;
    0 0 0 0 1 1 0;
    0 0 0 0 0 1 1;
    0 0 0 0 0 0 1;
    0 0 0 0 0 1 1;
    0 0 0 0 1 1 0;
    0 0 1 1 1 0 0;
    0 1 1 0 0 0 0;
    0 0 0 0 0 0 0];

%2. Pola untuk Percobaan (Pola Huruf Lain)

A2=[0 0 0 0 0 0 0;
    0 1 0 0 0 1 0;
    0 1 0 0 0 0 1;
    0 1 1 1 1 1 1;
    0 0 0 0 0 0 0;
    0 0 0 1 1 0 0;
    0 0 0 0 0 0 0;
    0 0 0 0 0 0 0;
    0 0 0 0 0 0 0];
B2=[0 0 0 0 0 0 0;
    0 0 0 1 0 0 0;
    0 0 0 1 0 0 0;
    0 0 0 1 0 0 0;
    0 0 0 1 0 0 0;
    0 0 0 1 0 0 0;
    0 0 0 1 0 0 0;
    0 0 0 1 0 0 0;
    0 0 0 0 0 0 0];
C2=[0 0 0 0 0 0 0;
    0 0 0 0 1 0 0;
    0 0 0 0 1 1 0;
    0 0 0 0 0 1 1;
    0 0 0 0 0 0 1;
    0 0 0 0 0 1 1;
    0 0 0 0 1 1 0;
    0 0 1 1 1 0 0;
    0 0 0 0 0 0 0];

%3. Network Input
p=[A1(1:end);B1(1:end);C1(1:end)]';

%4. Network Target yang Diinginkan
t=[1 2 3];
PR=zeros(63,2);
PR(:,2)=1;

%5. Penggunaan Fungsi Backpropagation
net=newff(minmax(p),[3,1],{'logsig','purelin'})

%6. Pelatihan Network
net.trainParam.epochs=3;
net=train(net,p,t)

%7. Percobaan Input Pola Huruf B dengan Model Lain
hasil=sim(net,B2(1:end)')
y=hasil
hasil=round(y);
if hasil==1' 
    disp('Huruf Ba');
elseif hasil==2' 
    disp('Huruf Alif');
elseif hasil==3' 
    disp('Huruf Ro');
else
    disp('Huruf belum dikenali')
end
