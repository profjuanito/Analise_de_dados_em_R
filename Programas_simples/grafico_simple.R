# Arquivo de comandos para fazer um Gráfico
# ******************************************
#
# 
# Primeiramente, vamos chamar a biblioteca ggplot2
library(ggplot2)
# 
# Chamar o oconjunto de dados da propria biblioteca
cars 
# Mapear os dados
ggplot(cars,aes(x=speed, y=dist)) + geom_point(col="red",size=2) + theme_bw() + labs(title="Primeiro Gráfico em R", caption='@jalcantara')
