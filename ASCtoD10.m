function ASCtoD10(s,d10)
    archivoRaw=load(s);
    l = length(s);
    if((strcmp(s(l-3:l),'.asc') || strcmp(s(l-3:l),'.ASC')))
        fidh=fopen('Header.d10','r');
            if(fidh>=3)
                header=fread(fidh, inf, 'int16', 0, 'b');
            else
                return
            end
        fidw=fopen(d10,'w');
        if(fidw>=3)
            for i=1:length(header)
                fwrite(fidw,header(i),'int16',0,'b');
            end
            for i=1:length(archivoRaw)
                fwrite(fidw,archivoRaw(i),'int16',0,'b');
            end
        else
            fprintf('Error al escribir el archivo\n')
        end
        fclose(fidh);
        fclose(fidw);
    else
        fprintf('Error al abrir el archivo\n')
    end