# Comandos Básicos:
#********************

# Gráficos
# Comandos Básicos: Grafico

a <- 1:20
b <- a^2
plot(a,b)
lines(rev(a),b)   # adição de linhas onde rev(a) inverte a posição dos val de a
points(a, 400-b)  # adição de pontos


a <- 1:20; b <- a^2
plot(a,b,pch=2)           # pch=2  indica que o símbolo sera um triángulo
points(a,400-b, pch=5)    # pch=5  indica que o símbolo sera um losango
points(a,200-b, pch=10)   # pch=10 indica que o símbolo sera um circulo com +
# pch=20 circolo cheio
windows()                 # tem que ativar stats
plot(0:20,0:20,pch=0:20)


a <- 1:20; b <- a^2
plot(a,b,type="l")        #  indica que sera com linha continua
lines(a,2*b,lwd=4)        #  indica que sera linha grossa
lines(a,0.5*b,lty=2)      #  indica que sera com linha cortada
lines(a,3*b,lty=3)        #  indica que sera com linha pontilhada
lines(a,4*b,lty=2,lwd=4)  #  indica que sera com linha pontilhada e grossa


plot(c(-pi,pi),c(-1,1), type="n") # gerando um gráfico em branco x(-3.14 3.14),y
x<-seq(-pi,pi,0.1)                # indica uma sequencia de números em paso de 0.1
a <- sin(x)
b <- sin(x-2/3*pi)
c <- sin(x+2/3*pi)
lines(x,a,col=2,lwd=1)    # col=2  vermelho
lines(x,b,col=3,lwd=2)    # col=3  verde
lines(x,c,col=4,lwd=3)    # col=4  azul


plot(c(-pi,pi),c(-1,3),xlab="Período", ylab="Fases", type="n")
title("Representação das tensões trifásicas","Fases ABC")
lines(x,a,col=2,lwd=1)
lines(x,b,col=3,lwd=2)
lines(x,c,col=4,lwd=3)
text(0,2,"Observe a defasagem de 120o entre as fases")


a <- seq(from=0, to=20, by=2); b <- a^2
plot(a,b,type="n")      # plota um gráfico vazio
text(a,b,"R")           # aplica a etiqueta no sítio dos pontos

# Salvando Graficos
jpeg(file=’figure.jpeg’) # figure é o nome do arquivo imagem
plot(rnorm(10))          # gráfico que estou salvando
dev.off()                # fecha a janela gráfica automaticamente


plot(rnorm(10))  #plotando o primeiro gráfico
windows()        #criação de uma nova janela gráfica
plot(rnorm(20))  #plotando o segundo gráfico


# Comandos Básicos: Grafico de Funções
x1 <- seq(0,50, l=101)
y1 <- 1 - (1/x1) * sin(x1)
plot(x1, y1, type="l")

x2 <- seq(80, 120, l=101)
y2 <- (1/sqrt(50*pi)) * exp(-0.02 * (x2-100)^2)
plot(x2, y2, type="l")


#() Exemplo
x<-seq(0,30)
y<--x^2+50*x+5
plot(x,y,"l",ylab="Peso (kg)",xlab="Ingesta de ração (kg/dia)")
e<-rnorm(length(y),0,25)
yo<-y+e
points(x,yo,pch=19)


# Integração Numerica
fx <- function(x) x^2
integrate(fx, -3, 3)
# with absolute error < 2e-13
x <- seq(-4, 4, l=100)
x2 <- x^2
plot(x, x^2, ty=“l”)
> x <- seq(-3, 3, l=100)
> x2 <- x^2
> polygon(rbind(cbind(rev(x),0),cbind(x,x2)), col=“gray”)






# Script

2*2
a<-c(1,2,3,4,5)  # Comentarios
source(“nome”)



# Pacotes

x<-c(1,3,5,5,7)
x
z<-c(2,2,3,6,6)
z
cor(x,z)  # mostra a correlacao entre x e z

b<-rnorm(1000,0,1)  # cria uma distribuição normal (1000 dados) com média o e sigma 1
mvrnorm             # cria uma distribuição bivariada só que não esta instalada
?mvrnorm            # mostra que não tem informação precisaria saber que paquetes
estão instalados

installed.packages() # mostra todos os paquetes instalados
install.packages("MASS")
require(MASS)        # ativa o paquete MASS pode ser usado Library(MASS)
mi<-c(0,0)
sigma<-matrix(c(1,0,0,2),2,2)
c<-mvrnorm(n = 1000,mi,sigma,10e-6,empirical = TRUE,EISPACK = FALSE)
c

?PCA
install.packages("FactoMineR")  # instala a função FactoMineR
?PCA
library(FactoMineR)             # ativa a função


# Comandos Basicos:  Chamar algum exemplos de dados

require(MASS)        # ativa o paquete MASS pode ser usado Library(MASS)
data()               # mostra a lista de dados
data(Cars93)         # carrega o conjunto de dados que esta en cars93

# Comandos Básicos: classes

x<-2             # atribui o numero 2 ao objeto x
x
y<-c(1:7)        # y é um vetor
class(x)
is.numeric(x)
is.character(x)
x
as.character(x)
x
is.character(x)


c1<-“cafe”
c2<-“com”
c3<—“leite”
paste(c1,c2,c3)
paste(c1,c2,c3,sep==“”)
paste(c1,c2,c3,sep==“%”)
z<-paste(c1,c2,c3,sep==“%”)
substr(z,6,8)


x<-c(“A”,”B”,”A”,C”,”A”,”C”)
class(x)
as.factor(x)
fx<-as.factor(x)
class(fx)
levels(fx)
table(fx)


p<-TRUE
q<-FALSE
!p
!q
p|q
p&q
p&!q
x<-(1,2,3,11,20,30)
class(x)
x>10        # resulta a comparação de cada elemento com 10 (TRUE TRUE TRUE FALSE…)
sum(x>10)   #resultado 3 : significa que 3 valores são maiores que 10













