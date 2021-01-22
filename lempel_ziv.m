%Código retirado de:
%https://www.mathworks.com/matlabcentral/fileexchange/29772-example-of-lempel-ziv-coding

%'dec_cod' "decimal code" que codifica a String introduzida ('str').
%'code_bin' "binary code" da String obtida através da conversão de 'dec_cod'.
%'code_book' "code-book" utilizado no algoritmo the Lempel-Ziv.
function [codice, code_bin, code_book] = lempel_ziv(alfabeto, stringa)

alf=alfabeto;   % Alfabeto que contem o caracter usado na "String"
str=stringa;    % String a codificar
code_book=cell(length(alf),1);      % Inicializa o "code-book"
for i=1:1:length(alf)               % Insere no "code-book" os primeiros elementos
    code_book{i}=alf(i);
end

k=str(1);   % Primeira palavra a codificar
codice=[];  % Inicializa a variável usada para guardar o "decimal code"
i=1;
index=1;
while i<=length(str)   
    trovato=0;
    for i=1:length(code_book)
        if(length(k)==length(code_book{i}))  % Verifica se a palavra já está contida no "code book" 
            if(strcmp(k,code_book{i})==1)
                z=i;    % "Decimal code" da palavra a codificar
                trovato=1;
            end
        end
    end
    if trovato==0   % Se a palavra nao estiver no "code book", atualiza o "code book"
        code_book{length(code_book)+1}=k;
        codice(length(codice)+1)=z;     % Atualiza o "decimal code" da parte conhecida da palavra
        k=k(length(k));     % Parte desconhecida da palavra
    end
    % Se a palavra estiver no "code book", atualiza o "decimal code", aumenta o "index" e verifica o fim da string
    if trovato==1
        index=index+1;
        if index>length(str)    % Se a string termina, codifica a última palavra
            for i=1:length(code_book)
                if(length(k)==length(code_book{i}))
                    if(strcmp(k,code_book{i})==1)
                        z=i;
                    end
                end
            end
            codice(length(codice)+1)=z;
            break;
        end
        k=[k str(index)];   % Nova palavra
    end
end
code_bin=dec2bin(codice);   % Codifica com código binário o resultado (binary code)