% lzw comprassion function wrapper
function [code, compression_rate,size_before_comp,size_after_comp] =  lz_wrapper(text_file)

    fileContents = fileread(text_file); % Converte o ficheiro de texto num array de caracteres
    alphabet = unique(fileContents); % Encontra os caracteres especiais no texto ("alphabet of the array")
    
    [code ,binary_code, code_book ] = lempel_ziv(alphabet, fileContents);
    
    raw_input = dec2bin(fileContents);
    size_before_comp = numel(raw_input);
    size_after_comp = numel(binary_code);
    
    compression_rate = size_after_comp / size_before_comp;
    
    %%%%%%%%%%%%%%%%% Imprime os resultados num fiheiro "lempelziv_results.txt" %%%%%%%%%%%%%%%%%

    fileID = fopen('./results/lempelziv_results.txt', 'w');

    fprintf(fileID, ['%s' '%d\n'], "Tamanho do ficheiro antes da compressão(bits):  ", size_before_comp);
    fprintf(fileID, ['%s' '%d\n'], "Tamanho do ficheiro depois da compressao(bits):  ", size_after_comp);
    fprintf(fileID, ['%s' '%f\n'], "Compressão:  ", compression_rate);

    fclose(fileID);
end