datos_38 = importdata("data38.txt");
medias = mean(datos_38(:,2:39), 2);
binaria = double(medias >1.5);
matriz_binaria=abs(sign(datos_38-0.5));
pearson_final =zeros(38,1);
jaccard_final=zeros(38,1);
dice_final = zeros(38,1);
metricas_binarias = zeros(38,4);
metricas_binarias(:,4)= (1:38);
for i=2:39
    matriz_1= confusionmat(matriz_binaria(:,i),binaria);
    a = matriz_1(1,1);
    b = matriz_1(1,2);
    c = matriz_1(2,1);
    d = matriz_1(2,2);
    metricas_binarias(i-1,1) = ((a*d)-(b*c))/sqrt((a+c)*(b+d)*(a+b)*(c+d));
    metricas_binarias(i-1,2)= a/(a+b+c);
    metricas_binarias(i-1,3)=(2*a)/((2*a)+b+c);

end
matriz_ordenada = sortrows(metricas_binarias,-1);
matriz_ordenada(1:10,4)