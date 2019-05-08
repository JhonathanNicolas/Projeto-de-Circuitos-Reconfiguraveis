t = [0:0.00306796:2*pi]; % Times at which to sample the sine function
sine = sin(t)*2048 + 2048
ntBP = numerictype(0,12,12);
x_BP = fi(sine)
sineQ = quantize(x_BP,ntBP)
N = 12;
A = 2^N -1;
n = 12;         % number bits for integer part of your number      
m = 0;         % number bits for fraction part of your number

fid = fopen('sin_gen.txt','wt')
for c = 1: 2049
    a = sine(c);
     d2b = [ fix(rem(fix(a)*pow2(-(n-1):0),2)), fix(rem( rem(a,1)*pow2(1:m),2))];  % 
        for c2 = 1 : N
        string = sprintf('%s%d',string,d2b(c2))
        end    
        fprintf(fid,'%s\n',string);

end
fclose(fid)

for c = 1 : A
    a = sineQ(c); % your float point number
    d2b = [ fix(rem(fix(a)*pow2(-(n-1):0),2)), fix(rem( rem(a,1)*pow2(1:m),2))];  % 
    string = [];
    for c2 = 1 : N
        string = sprintf('%s%d',string,d2b(c2))
    end    
    fprintf(fid,'%s\n',string);
end
fclose(fid)
