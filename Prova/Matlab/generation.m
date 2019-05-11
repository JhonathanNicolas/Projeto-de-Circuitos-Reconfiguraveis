clc
clear all
close all
N=100; % numero de vetores de teste aleatorios
EW=8; % tamanho do expoente
FW=18; % tamanho da mantissa
n = [1:1:100];
sigZ = 0.75;


fid1 = fopen('Xulfloat.txt','wt');
fid2 = fopen('Xirfloat.txt','wt');
fid3 = fopen('Xulbin.txt','wt');
fid4 = fopen('Xirbin.txt','wt');




% seed inicial---------------------------------
matricula = 160031621;
rand('twister',matricula);
sigkmin = 0.1;
sigkmax = 0.25;
sigK = (sigkmax-sigkmin)*rand() + sigkmin;
sigKbin = float2bin(EW,FW,sigK);
sigZmin = 0.5;
sigZmax = 0.75;
sigZ = (sigZmax-sigZmin)*rand() + sigZmin;
sigZbin = float2bin(EW,FW,sigZ);

%---------------------------------------------
for count=1: N
Xul(count) = 100 +sigK*randn();
Xir(count) = 100 +sigZ*randn();
XulBin = float2bin(EW,FW,Xul(count));
XirBin = float2bin(EW,FW,Xir(count));
fprintf(fid1,'%f\n',Xul);
fprintf(fid2,'%f\n',Xir);
fprintf(fid3,'%s\n',XulBin);
fprintf(fid4,'%s\n',XirBin);
end

fclose(fid1);
fclose(fid2);
fclose(fid3);
fclose(fid4);

