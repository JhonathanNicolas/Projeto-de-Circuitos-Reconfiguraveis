N = 100;
FID1 = fopen('ROMxul.coe','w');
FID2 = fopen('ROMxir.coe','w');
fprintf(FID1,'memory_initialization_radix=2;\n');
fprintf(FID1,'memory_initialization_vector=\n');
fprintf(FID2,'memory_initialization_radix=2;\n');
fprintf(FID2,'memory_initialization_vector=\n');
Xir = textread('Xirbin.txt','%s');
Xul = textread('Xulbin.txt','%s');

for i=1: N-1
fprintf(FID1,'%s,\n',cell2mat(Xul(i)));
fprintf(FID2,'%s,\n',cell2mat(Xir(i)));
end
fprintf(FID1,'%s;',cell2mat(Xul(100)));
fprintf(FID2,'%s;',cell2mat(Xir(100)));
