function D10toRAW(s,raw)
    fid=fopen(s, 'r');
    l = length(s);
    if(fid>=3 && (strcmp(s(l-3:l),'.d10') || strcmp(s(l-3:l),'.D10')))
        archivoRaw=fread(fid, inf, 'int16', 0, 'b');
        fidw=fopen(raw,'w');
        if(fidw>=3)
%             for i=1:length(header)
%                 fwrite(fidw,header(i),'int16',0,'b');
%             end
            for i=257:length(archivoRaw)
                fwrite(fidw,archivoRaw(i),'int16',0,'l');
            end
        else
            fprintf('Error al escribir el archivo\n')
        end
        fclose(fidw);
        fclose(fid);
    else
        fprintf('Error al abrir el archivo\n')
    end
    