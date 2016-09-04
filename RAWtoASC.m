function RAWtoASC(s,asc)
    fid=fopen(s, 'r');
    l = length(s);
    if(fid>=3 && (strcmp(s(l-3:l),'.raw') || strcmp(s(l-3:l),'.RAW')))
        archivoRaw=fread(fid, inf, 'int16');
        %raw = archivoRaw;
        fidw=fopen(asc,'w');
        if(fidw>=3)
            for i=1:length(archivoRaw)
                fprintf(fidw,'%d ',archivoRaw(i));
            end
        else
            fprintf('Error al escribir el archivo\n')
        end
        fclose(fidw);
        fclose(fid);
    else
        fprintf('Error al abrir el archivo\n')
    end
    
    