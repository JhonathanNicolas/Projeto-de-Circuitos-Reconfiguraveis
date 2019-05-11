% Estima-se o MSE usando a funcao my_prova como modelo de referencia

close all
clc
clear all
N=100; % numero de vetores de teste aleatorios
EW=8; % tamanho do expoente
FW=18; % tamanho da mantissa

bin_outProva=textread('Xfusao.txt', '%s'); % Resultado em Hardware
Xir=textread('Xirfloat.txt', '%f');
Xul=textread('Xulfloat.txt', '%f');

SigK = 0.2013;
SigZ = 0.5965;

result_hw=zeros(N,1);
result_sw=zeros(N,1);

for i=1:N-1
    result_hw(i,1)=bin2float(cell2mat(bin_outProva(i)),EW,FW);
    Gk = SigK/(SigK+SigZ);
    result_sw(i) = my_prova(Xir(i),Xul(i),Gk); % Xfusao = Xul+Gk*(Xir-Xul)
    SigK = SigK-(Gk*SigK);
    erro(i) = sum((result_hw(i,:) - result_sw(i,:)).^2);
end

result_hw(1:10,:);
result_sw(1:10,:);
MSE = sum(erro)/N
stem(erro)

