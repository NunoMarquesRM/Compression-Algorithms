txt = 'chapter19.txt';
%txt = 'chapter20.txt';
%txt = 'chapter21.txt';
%txt = 'chapter22.txt';

Entropy = text_entropy(txt);
[com1,size_bin,bin_b,bin_a] = binary_huffman(txt); 
[com2,size_ter,ter_b,ter_a] = ternary_huffman(txt);
[com3,size_ari,ari_b,ari_a] = arithmetic(txt);
[com4,size_lz,lz_b,lz_a] = lz_wrapper(txt);

bin_b = (bin_b / 8) /1024; 
bin_a = (bin_a / 8) /1024; 
ter_b = (ter_b / 8) /1024; 
ter_a = (ter_a / 8) /1024;
ari_b = (ari_b / 8) /1024; 
ari_a = (ari_a / 8) /1024; 
lz_b = (lz_b / 8) /1024; 
lz_a = (lz_a / 8) /1024; 

rates = [bin_b, bin_a ; ter_b, ter_a  ; ari_b, ari_a ; lz_b, lz_a ]; 
c = categorical({'Binary-before','Binary-after';'Ternary-before','Ternary-after'; 'Arithmetics-before','Arithmetics-after'; 'Lz-before','Lz-after'}); 

% Gráfico de Barras
figure = bar(c, rates);
title('Comparação de algoritmos')
xlabel('Algoritmos')
ylabel('Size(KB)')
