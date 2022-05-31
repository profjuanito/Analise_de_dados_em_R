# Arquivo de comandos para graficar uma curva normal
# ***************************************************
#
#  gerar aleatoriamente a distribuição normal com 1000 dados
# 
b<-rnorm(1000,0,1)
mean(b)
var(b)
median(b)
sd(b)
desvio<-sd(b)
range(b)
min(b)
max(b)
media<-round(mean(b),digits=2)
media
media1<-signif(mean(b),digits=2)
media1
vari<-round(var(b),digits=2)
vari
vari1<-signif(var(b),digits=2)
vari1
n<-length(b)
#
#  prepara o janela par formatar o numero de gráficos
#
op <- par(mfrow = c(1, 2))  # organiza os graficos em 1 fila e 2 colunas
#
#  criar uma tabela de frequências
#
df<-matrix(0,11,3)          # cria umma matriz para o posicionamento dos valores na tabela
colnames(df)<-c("fa","fr","fp")
rownames(df)<-
c("[-5,0;-4,0)","[-4,0;-3,0)","[-3,0;-2,0)","[-2,0;-1,0)","[-1,0;0,0)","[0,0;1,0)","[1,0;2,0)","[2,0;3,0)","[3,0;4,0)","[4,0;5,0)","Total")
#
#  separa os calores dependendo dos intervalos
#
tab.b<-table(cut(b,breaks=c(-5.0,-4.0,-3.0,-2.0,-1.0,0.0,1.0,2.0,3.0,4.0,5.0))) df[1:10,1]<-tab.b df[11,1]<-length(b) for(i in 1:10)   {df[i,2]<-df[i,1]/length(b)} for(i in 1:10)   {df[i,3]<-df[i,2]*100}
df
#
#
#   grafica usando histograma
#
hist(b,breaks=c(-5.0,-4.0,-3.0,-2.0,-1.0,0.0,1.0,2.0,3.0,4.0,5.0),freq=FALSE,ylab="Frequencia Relativa",xlab="x",main="",col=gray(seq(0.1,1.0,length=6)))
#
#   cria uma distribuição normal usando so os parâmetros media e variância
#
x<-seq(-5,5,length=101)
y<- dnorm(x, mean = mean(b), sd = sd(b))
lines(x, y, col = "black", lwd = 2)
y<- dnorm(x, mean = 0.0, sd = 1)
lines(x, y, col = "red", lwd = 2)
#
legend(-4,0.35, 1:2, cex = 0.8, col = 1:2, pch = NULL, lty = ltipo, title = "Curvas Normais")
#
#
# Novo gráfico mudando so os intervalos
#
df1<-matrix(0,10,3)
colnames(df1)<-c("fa","fr","fp")
rownames(df1)<-
c("[-4,5;-3,5)","[-3,5;-2,5)","[-2,5;-1,5)","[-1,5;-0,5)","[-0,5;0,5)","[0,5;1,5)","[1,5;2,5)","[2,5;3,5)","[3,5;4,5)","Total")
#
#  separa os calores dependendo dos intervalos
tab.b<-table(cut(b,breaks=c(-4.5,-3.5,-2.5,-1.5,-0.5,0.5,1.5,2.5,3.5,4.5))) df1[1:9,1]<-tab.b df1[10,1]<-length(b) for(i in 1:9)   {df1[i,2]<-df1[i,1]/length(b)} for(i in 1:9)   {df1[i,3]<-df1[i,2]*100}
df1#   grafica os resultados
#
hist(b,breaks=c(-4.5,-3.5,-2.5,-1.5,-0.5,0.5,1.5,2.5,3.5,4.5),freq=FALSE,ylab="Frequencia Relativa",xlab="x",main="",col=gray(seq(0.1,1.0,length=6)))#
#   grafica os mesmos resultados do calcula anterior
#
y<- dnorm(x, mean = mean(b), sd = sd(b))
lines(x, y, col = "black", lwd = 2)
y<- dnorm(x, mean = 0.0, sd = 1)
lines(x, y, col = "red", lwd = 2)#legend(-4,0.35, 1:2, cex = 0.8, col = 1:2, pch = 1:2, lty = ltipo, title = "Curvas Normais")


