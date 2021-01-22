% Comparaçao de 4 algoritmos de compressao
% Binary huffman, Ternary huffman, Arithmetic and LZ coding.

txt = 'chapter19.txt';
%txt = 'chapter20.txt';
%txt = 'chapter21.txt';
%txt = 'chapter22.txt';

Entropy = text_entropy(txt);

fprintf('Entropia do ficheiro é %.2f\n', Entropy);

[com1, rate_binary] = binary_huffman(txt);
[com2, rate_ternary] = ternary_huffman(txt);
[com3, rate_arithmetic] = arithmetic(txt);
[com4, rate_lz] = lz_wrapper(txt);

rates = [rate_binary rate_ternary rate_arithmetic rate_lz];
c = categorical({'binary', 'ternary', 'arithmetic', 'lempel ziv'});

% Gráfico de Barras
figure = bar(c, rates);
title('Comparação dos Algoritmos')
xlabel('Algoritmos')
ylabel('Rácio de Compressão')

saveas(figure, 'comp.jpeg');
