function [comp, compression_rate,size_before_comp,size_after_comp] = arithmetic(text_file)
    fileContents = fileread(text_file); % Converte o ficheiro de texto num array de caracteres

    text_length = length(fileContents); % numero total dos caracteres no array/ficheiro de texto
    distinct_chars = unique(fileContents); % encontra os caracteres especiais presentes no texto
    num_of_dist_chars = length(distinct_chars); % numero dos caracteres especiais
    % Preenche a sequencia por inteiros. Utilizado porque a função "arithenco" do matlab só funciona com sequencias de inteiros
    sequence = zeros(1, text_length);
    
    for i = 1:text_length
        index = find(distinct_chars == fileContents(i)); % Encontra o "mapping of char to integer"
        sequence(i) = index; % Preenche a sequencia de inteiros
    end

    char_occurances = zeros(1, num_of_dist_chars);
    for i = 1:num_of_dist_chars
        % Encontra o numero total de ocorrencias de cada caracter no texto
        char_occurances(i) = length(strfind(fileContents, distinct_chars(i)));
    end
    comp = arithenco(sequence, char_occurances);

    raw_input = dec2bin(fileContents);
    size_before_comp = numel(raw_input);

    decoded = dec2bin(comp);
    size_after_comp = numel(decoded);

    compression_rate = size_after_comp / size_before_comp;

    %%%%%%%%%%%%%%%%% Imprime os resultados num fiheiro "arithmetic_results.txt" %%%%%%%%%%%%%%%%%

    fileID = fopen('./results/arithmetic_results.txt', 'w');

    fprintf(fileID, ['%s' '%d\n'], "Tamanho do ficheiro antes da compressão(bits):  ", size_before_comp);
    fprintf(fileID, ['%s' '%d\n'], "Tamanho do ficheiro depois da compressao(bits):  ", size_after_comp);
    fprintf(fileID, ['%s' '%f\n'], "Compressão:  ", compression_rate);

    fclose(fileID);
end