function ASCtoRAW(s,raw)
    archivoRaw=load(s);
    l = length(s);
    if((strcmp(s(l-3:l),'.asc') || strcmp(s(l-3:l),'.ASC')))
        fidw=fopen(raw,'w');
        if(fidw>=3)
%             for i=1:length(header)
%                 fwrite(fidw,header(i),'int16',0,'b');
%             end
            for i=1:length(archivoRaw)
                fwrite(fidw,archivoRaw(i),'int16',0,'l');
            end
        else
            fprintf('Error al escribir el archivo\n')
        end
        fclose(fidw);
    else
        fprintf('Error al abrir el archivo\n')
    end
    