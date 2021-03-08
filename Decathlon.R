"Analisis de componenetes principales

Vamos a utilizar librerias que complementan el analisis paa el PCA con los Biplots.
Los datos son registros obtenidos pertenecen a diferentes deportistas en los juegos olímpicos
para diferentes disciplinas.

"

library(FactoMineR)
data(decathlon)#El dataset pertenece a la librería FactoMineR.
head(decathlon, 3)

#Calculamos
res <- PCA(decathlon,quanti.sup=11:12,quali.sup=13)

"Veamos el resultados de nuestro PCA
Aquí se muestan los valores los varianzas, los elmenetos y las varianzas acumuladas
"
print(res)
summary(res)

#Observemos la varianza de los componentes
plot(res,type="l", main="Varianza de las componentes")

#Observemos las variables que mas se orientan hacia las 2 principales conpenentes
plot(res,choix="var",invisible="quanti.sup")

#otras formas
plot(res,habillage=13)
plot(res,invisible="quali")

#Visualizamos con las elipses
aa=cbind.data.frame(decathlon[,13],res$ind$coord)
bb=coord.ellipse(aa,bary=TRUE)
plot.PCA(res,habillage=13,ellipse=bb)