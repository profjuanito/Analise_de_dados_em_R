# Arquivo de comandos para fazer um ajuste linear simples
# *********************************************************
#
# Chamar o oconjunto de dados, para isso precisamos entrar em  nosso diretorio de trabalho
setwd('/Users/imac-casa/Desktop/DataScience/8 R/script')
dados<-read.table("dados1.txt", header=FALSE,sep=",")
x<-dados[,1]
y<-dados[,2]
eixoX<-"População (10K)"
eixoY<-"Lucro (10K)"
#
#
# Armazena a regresso em uma variável chamada reg
reg = lm(y~x)

# Mostra um resumo da regressão
summary(reg)

# Estima os novos valores para o modelo
fitted(reg)

# Estima os residuos
resid(reg)

# Teste de normalidade para os resíduos Shapiro-Wilk
shapiro.test(resid(reg))

# Analise de Variancia ANOVA
anova(reg)

# Organiza os gráficos em duas colunas e duas filas
par(mfrow = c(2,2))

# histograma os residuos
hist(resid(reg),xlab="Resíduos",ylab="Frequência",main="Histograma dos Resíduos")

# Grafico QQ dos residuos
qqnorm(resid(reg),xlab="Quantis teóricos",ylab="Quantis amostrais",
main="Gráfico Q-Q dos Resíduos")
qqline(resid(reg),col=2)

# Residuos para os valores ajustados
plot(fitted(reg),resid(reg),xlab="Valores ajustados",ylab="Resíduos", main="Resíduos x Valores Ajustados")
abline(h=0,lty=2,col=2)

# Residuos em ordem
plot(resid(reg), type="o", xlab="Ordem", ylab="Resíduos",main="Resíduos x Ordem")
abline(h=0,lty=2,col=2)
#
#
# Organiza os gráficos em 1 coluna e 1 fila
par(mfrow = c(1,1))
#
# Grafica a dispersão dos dados originais e a reta ajustada abline
# usando os parâmetros de ajuste
plot(x, y, xlab=eixoX, ylab=eixoY, main="Curva Analítica", abline(reg,col=2))
#
# Se se pretende usar gplot. E necessario instalar ggplot2
#install.packages("ggplot2")
# precisa ativar ggplot2
#require(ggplot2)
#p <- ggplot(dados, aes(x=x,y=y)) + geom_point()
#p <- p + geom_point(aes(x=x,y=y), colour = "red")
#p

#p1 <- p + geom_smooth(method=lm)
#p1

# Determina o intervalo de confiança e de predição para o ajuste
predict(reg,se.fit=TRUE)
intervaloc<-predict(reg, interval="confidence")   # intervalo de confiança 95%
intervalop<-predict(reg, interval="prediction")  # intervalo de predição 
#
# Junta os dois intervalos numa matriz 
intervalo<-matrix(nrow=length(x),ncol=5)
intervalo[,1]=intervaloc[,1]
intervalo[,2]=intervaloc[,2]
intervalo[,3]=intervaloc[,3]
intervalo[,4]=intervalop[,2]
intervalo[,5]=intervalop[,3]
#
# transforma uma matrix em data.frame
inter<-data.frame(intervalo)
#
# ordena de forma crescente um dataframe em função a variável X1
intervalos<-inter[order(inter$X1),]
#
# transforma um data.frame em matrix 
intervalo1<-data.matrix(intervalos)
#
# verificar se e crescente o decrescente
correlacao<-cor(dados)
ordem<-TRUE
if (correlacao[1,2]>0.0)
    ordem<-FALSE

# ordena o vetor X 
x1<-sort(x,decreasing=ordem)
#
#matlines(x1,intervalo1, type="l", col=c(1,2,2,3,3), ltd=c(1,2,2,3,3))
matlines(x1,intervalo1, type="l", col=c(1,2,2,4,4), lty=c(1,2,2,4,4))

if (correlacao[1,2]>0.0)
legend("bottomright",
       legend=c("valores observados", "valores preditos",
         "intervalo de confiança (95%)","intervalo de predição (95%)"),
       lty=c(NA,1,2,4), col=c(1,1,2,4), pch=c(1,NA,NA,NA,NA), bty="n")

if (correlacao[1,2]<0.0)
legend("bottomleft",
       legend=c("valores observados", "valores preditos",
         "intervalo de confiança (95%)","intervalo de predição (95%)"),
       lty=c(NA,1,2,4), col=c(1,1,2,4), pch=c(1,NA,NA,NA,NA), bty="n")

