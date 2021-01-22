function H = text_entropy(text_file)
    fileContents = fileread(text_file); % converte o ficheiro de texto num array de caracteres

    text_length = length(fileContents); % numero total dos caracteres no array/ficheiro de texto
    distinct_chars = unique(fileContents); % encontra os caracteres especiais presentes no texto
    num_dist_chars = length(distinct_chars); % numero dos caracteres especiais
    char_occurances = zeros(1, num_dist_chars);
    
    for i = 1:num_dist_chars % encontra o numero de repetições de cada caracter especial
         char_occurances(i) = length(strfind(fileContents, distinct_chars(i)));
    end
    char_prob = char_occurances / text_length; % calcula a probabilidade de cada caracter aparecer no texto
        
    H = 0;
    for i = 1:num_dist_chars
        H = H + (-char_prob(i)*log2(char_prob(i))); % calculo da entropia 
    end
end