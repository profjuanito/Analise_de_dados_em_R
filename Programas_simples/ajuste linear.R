# # Arquivo de comandos para fazer um ajuste
# ******************************************
#
#
# Primeiramente, vamos chamar a biblioteca readxl (ler arquivos de excel) ggplot2 (gerar gráficos)
library(readxl)
library(ggplot2)
library(ggpubr)
#
#
# Chamar o oconjunto de dados, para isso precisamos entrar em nosso diretorio de trabalho
setwd('/Users/imac-casa/Desktop/DataScience/8 R/evento_aula2')
alunos <- read_excel('dados/alunos.xlsx')
#
# Mapear os dados
ggplot(alunos,aes(x=horas, y=notas)) + geom_point(shape=21, size=2.8,fill="lightblue", col="blue") + geom_smooth(method="lm",col="tomato",se = TRUE, formula="y~x") + stat_regline_equation(aes(label=paste(..eq.label..,..rr.label..,sep="~~~~~~~"))) + labs(x="Horas", y="Notas", title="Gráfico de Regressão em R", caption='@jalcantara') + theme_light()
#
# salvar o gráfico
ggsave(filename="grafico_regresao.png")
