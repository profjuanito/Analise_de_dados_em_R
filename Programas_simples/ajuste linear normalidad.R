# Arquivo de comandos para fazer um ajuste linear com testede Normalidade
# ***********************************************************************
#
#
# Chamar o oconjunto de dados, para isso precisamos entrar em  nosso diretorio de trabalho
setwd('/Users/imac-casa/Desktop/DataScience/8 R/script')
#
# Lee os valores de uma tabela .txt que nao tem cabecario e separados por virgula
dados<-read.table("dados1.txt", header=FALSE,sep=",")
x<-dados[,1]
y<-dados[,2]
#
#A função para regressão é “lm” e não requer pacote estatístico (variável resposta ~ variável preditora)
resmodelo<-lm(y~x)
# 
#Sumário dos resultados do modelo
summary(resmodelo)
#
#
op <- par(mfrow = c(1, 2))  # organiza os gráficos em 1 fila e 2 colunas
#
#Visualização gráfica lty é o tipo da linha 1: linha contínua; 2: linha descontínua
plot(y~x)
abline(resmodelo,lty=2)
# 
#Teste para NORMALIDADE (valores de p > 0,05 indicam dados normais)
shapiro.test(rstudent(resmodelo))   #teste de shapiro wilk (normalidade)
# 
# Análise visual para homogeneidade dos resíduos (visualmente eles devem se distribuir igualmente abaixo e acima da linha)
plot(rstudent(resmodelo) ~ fitted(resmodelo), pch = 19)
abline(h = 0, lty = 2)
 
