EW=8; % tamanho do expoente
FW=18; % tamanho da mantissa
N = 100;
sigZ = 0.596506143687854;
sigK = 0.201305263307348;
fileID1 = fopen('Xulbin.txt','r');
fileID2 = fopen('Xirbin.txt','r');
fileID3 = fopen('Xfusao.txt','r');
Xir = textread('Xirfloat.txt','%f');
Xul = textread('Xulfloat.txt','%f');
Xfusao=textread('Xfusao.txt', '%s');

G = [];
sig = [];
sig(1) = sigK;


for count = 1 : 100
G(count) = sig(count)/(sig(count)+sigZ);
sig(count+1) = sig(count)- G(count)*sig(count);
Xfusaos(count) = Xul(count) - G(count)*(Xir(count) - Xul(count));

end
result_sw = Xfusaos;
for i= 1: N-1
    result_hw(i,1)=bin2float(cell2mat(Xfusao(i)),EW,FW);
    erro(i) = sum((result_hw(i,:) - result_sw(i)).^2);
end
MSE = sum(erro)/N
bar(erro)