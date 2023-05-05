datos_38 = importdata("data38.txt");
medias = mean(datos_38(:,2:39), 1);
medias= double(medias>0);
matriz_binaria=double(datos_38>0);
empirica =zeros(1159,1);
 for i= 1:1159
     matriz_1= confusionmat(matriz_binaria(i,2:39),medias);
     a = matriz_1(1,1);
     b = matriz_1(1,2);
     c = matriz_1(2,1);
     d = matriz_1(2,2);
     empirica(i,1)= (a+d)/(a+b+c+d);
 end
histogram(empirica );
xline(prctile(empirica,20) );
filtro = empirica < prctile(empirica,20); 
datos_38(filtro,1);
sum(filtro)