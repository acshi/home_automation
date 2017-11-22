noise = importdata('testnoise.csv');
%noise = rem(noise, 8);
n = size(noise, 1);
bits = zeros(3 * n, 1);
for i = 1:n
    val = noise(i);
    bits(i*3+1) = bitand(val, 1);
    bits(i*3+2) = bitand(val, 2);
    bits(i*3+3) = bitand(val, 4);
end

output = zeros(n, 1);
out_i = 1;

for i = 1:2:3*n
    if bits(i) == 0 && bits(i+1) > 0
        output(out_i) = 0;
        out_i = out_i + 1;
    elseif bits(i) > 0 && bits(i+1) == 0
        output(out_i) = 1;
        out_i = out_i + 1;
    end
end

output = output(1:out_i);
plot(abs(fft(output)))