fid = fopen('inputs_neurionio.txt','wt')

for c = 1 : 100
    string = [];
    a = 10*rand(); % your float point number
    num = float2bin(3,23,a);
    string = sprintf('%s',num)
    fprintf(fid,'%s\n',string);
end
fclose(fid)
