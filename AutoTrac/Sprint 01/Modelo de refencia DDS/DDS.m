t = [0:0.0015339807:2*pi]; % Times at which to sample the sine function

fid = fopen('sin_gen.txt','wt')
fid2 = fopen('sin_gen_sintaxe.txt','wt')

I = size(t,2)
N = 12;
A = 2^N -1;
n = 12;         % number bits for integer part of your number      
m = 0;
% binary number
% the inverse transformation
sine = sin(t)*2048 + 2048
for c = 1 : I
    a = sine(c); % your float point number
    d2b = [ fix(rem(fix(a)*pow2(-(n-1):0),2)), fix(rem( rem(a,1)*pow2(1:m),2))];  % 
    string = [];
    for c2 = 1 : N
        string = sprintf('%s%d',string,d2b(c2))
    end    
        string2 = sprintf('"%s", ',string);
        fprintf(fid2,'%s',string2);
        fprintf(fid,'%s\n',string);
end
fclose(fid)
fclose(fid2)
b2d = d2b*pow2([n-1:-1:0 -(1:m)].');
fileID = fopen('sin_gen.txt','r');
[A, count] = fscanf(fileID,'%s');
    res = [];
    string = [];
    for c2 = 1 : I
      c3 = (c2 -1)*N;  
      string = [str2num(A(1 + c3)) str2num(A(2 + c3)) str2num(A(3+ c3)) str2num(A(4+ c3)) str2num(A(5+ c3)) str2num(A(6+ c3)) str2num(A(7+ c3)) str2num(A(8+ c3)) str2num(A(9+ c3)) str2num(A(10+ c3)) str2num(A(11+ c3)) str2num(A(12+ c3))]  
      res(c2) = string * pow2(n-1:-1:-m).';
    end    




