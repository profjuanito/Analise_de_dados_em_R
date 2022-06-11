# Comandos básico de estatística com R
#**************************************

# entrada de dados por vetor
x<-c(1,3,5,5,7)
mean(x)    # devolve a média
var(x)     # devolve a variança
std(x)     # a função no existe
sd(x)      # desvio

y<-c(1,2,2,3,3,3,3,3,4,4,4,4,4,4,5,5,5,5,5,5,6,6,6,6,7)
mean(y)
var(y)
sd(y)
stem(y)
stem(y,scale=2,width=100,atom=1e-8)

z<-c(2,2,3,6,6)
mean(z)
var(z)
sd(z)

a<-rnorm(1000,0,1)
mean(a)
var(a)
median(a)
sd(a)
range(a)
min(a)
max(a)
n<-length(a)


# Distribuição de Frequências: Var Qualitativas
at <- c("C","L","L","M","C","M","So","L","L","C","M","C","S","L","C","LA","C","M","C","C")
tab.at <- table(at)
df <- matrix(0,5,3)
colnames(df)<-c("fa","fr","fp")
rownames(df)<-c("Café","Leite","Milho","Outras","Total")
df[1,1]<-tab.at["C"]
df[2,1]<-tab.at["L"]
df[3,1]<-tab.at["M"]
df[4,1]<-sum(tab.at["So"], tab.at["S"], tab.at["LA"])
df[5,1]<-length(at)
for(i in 1:5)   {df[i,2]<-df[i,1]/length(at)}
for(i in 1:5)   {df[i,3]<-df[i,2]*100}

#(a) Barras
gc<-barplot(df[1:4,2],xlab="Atividade",ylab="Freqüência relativa",
col = gray(seq(0.4,1.0,length=4)))

#(b) Colunas
gc<-barplot(df[1:4,2],horiz=TRUE,ylab="Atividade",xlab="Freqüência relativa",
col = gray(seq(0.4,1.0,length=4)))

#(c) Pizza
pie(df[1:4,2], col = gray(seq(0.4,1.0, length=4)), radius = 1.05)



# Distribuição de Frequências: Var Quantitativas Discretas
filhos<-c(3,4,3,1,3,2,1,1,2,2,4,4,1,3,2,2,4,4,3,3,1,0,2,1,3,2,2,4,2,1,1,4,1,0,1,3,3,0,3,3)
tab.filhos<-table(filhos)
df<-matrix(0,6,3)
colnames(df)<-c("fa","fr","fp")
rownames(df)<-c(0,1,2,3,4,"Total")
df[1,1]<-tab.filhos["0"]
df[2,1]<-tab.filhos["1"]
df[3,1]<-tab.filhos["2"]
df[4,1]<-tab.filhos["3"]
df[5,1]<-tab.filhos["4"]
df[6,1]<-length(filhos)
for(i in 1:6)   {df[i,2]<-df[i,1]/length(filhos)}
for(i in 1:6)   {df[i,3]<-df[i,2]*100}

#(a) Linhas
gl<-plot(df[1:5,2], type="h", xlab="Número de filhos",ylab="fr")    # linha

#(b) Barras
gb<-barplot(df[1:5,2],col=gray(seq(0.4,1.0,length=5)),xlab="Número de filhos",ylab="fr")     #colunas


# Distribuição de Frequências: Var Quantitativas Continua
canela<-c(45.2,45.3,45.4,45.7,45.9,46.1,46.1,46.2,46.5,46.6,46.9,47.9,48.1,48.1,
48.3,48.5,48.8,48.8,49.1,49.2,49.3,49.7,49.8,49.9,50.1,50.2,50.3,50.4,50.5,
50.5,50.5,50.6,50.8,51.0,51.1,51.4,51.4,51.6,51.7,51.9,52.5,52.7,52.8,53.0,
54.9,55.0,55.2,55.3,55.7,55.7)
df<-matrix(0,8,3)
colnames(df)<-c("fa","fr","fp")
rownames(df)<-c("[44,33;46,08)","[46,08;47,83)","[47,83;49,58)","[49,58;51,33)","[51,33;53,08)","[53,08;54,83)","[54,83;56,58)","Total")
tab.canela<-table(cut(canela,breaks=c(44.33,46.08,47.83,49.58,51.33,53.08,54.83,56.58)))
df[1:7,1]<-tab.canela
df[8,1]<-length(canela)
for(i in 1:8)   {df[i,2]<-df[i,1]/length(canela)}
for(i in 1:8)   {df[i,3]<-df[i,2]*100}


# histograma
h<-hist(canela,breaks=c(44.33,46.08,47.83,49.58,51.33,53.08,56.58),freq=FALSE,
ylab="Dfr",xlab="Canela em pó (g)",main="",col=gray(seq(0.1,1.0,length=6)))
points(h$mids,h$density,"l")

#()
lim<-c(44.33,46.08,47.83,49.58,51.33,53.08,54.83,56.58)
ab<-c(0, 5, 11, 21, 35, 44, 44, 50)
ac<-c(50, 45, 39, 29, 15, 6, 6, 0)
plot(lim,ab,"l",ylab="Freqüência acumulada",xlab="Canela em pó (g)")
points(lim,ac,"l")


#() Media
x <- c(10, 14, 13, 15, 16, 18, 12)
mean(x)

#() Mediana
k <- c(1,3,0,0,2,4,1,2,5)
median(k)
g <- c(1,3,0,0,2,4,1,3,5,6)
median(g)

#() Moda
y <- c(7,8,9,10,10,10,11,12)
table(y)
y
7 8 9101112
111311

subset(table(y),table(y)==max(table(y))) 10
3

h<-hist(canela,breaks=c(44.33,46.08,47.83,49.58,51.33,53.08,54.83,56.58),
main=’’,freq=FALSE,ylab=’dfr’,xlab=’Variável’,col=gray(seq(0.1,1.0,length=6)))
points(c(49.58,51.33),c(h$density[3],h$density[4]),"l")
points(c(49.58,51.33),c(h$density[4], h$density[5]),"l")
points(c(50.357,50.357), c(0.134,0),"l")


#() Quartis
z <- c(5,2,6,9,10,13,15)
summary(z)


#() Percentis
q <- c(48,49,51,50,49)
quantile(q)
percentis = seq(.01,.99,.01)
quantile(q, percentis)

#() Decis
d <- c(48,49,51,50,49)
quantile(d,seq(0.10,0.9,0.1))


# Medidas de Dispersao
c1<-c(100,100,100,100)
c2<-c(80,100,100,120)
c3<-c(10,100,100,190)
Ac1<-range(c1)[2]-range(c1)[1]  #Amplitude
var(c2)                         #Variância
sd(c2)                          #Desvio padrão
CVc3<-sd(c3)/mean(c3)*100       #Coeficiente de variação


# Probabilidades: Lei dos grandes números
cara<-0
fr<-vector("numeric",500)
for (i in 1:500)      {
    moeda<-runif(1,0,1)
    if (moeda>0.5) {cara<-cara+1}
    fr[i]<-cara/i         }
x<-seq(1:500)
plot(x,fr,"l",xlab="Número de lançamentos",ylab="Freqüência Relativa")
abline(h=.5,lty=3)


# Função de Probabilidade
x <- seq(-4,4,by=.01)
y<-dnorm(x, mean=0,sd=1, log = FALSE)
rx<-rev(x)
ry<-vector("numeric", length(rx))
x<-c(x,rx)
y<-c(y,ry)
plot(x,y,"l",xlab="x",ylab="fdp(x)")
polygon(x, y, col = "gray")


# Distribuição de Prob. Continuas
x1 <- rnorm(50,0,1)
hist(x1,freq=FALSE,xlab="",ylab="",main="")
x2<- rnorm(500,0,1)
hist(x2,freq=FALSE,xlab="",ylab="",main="")
x3 <- rnorm(50000,0,1)
hist(x3,freq=FALSE,xlab="",ylab="",main="")
x4<-seq(-4,4,by=.01)
y<-dnorm(x4, mean=0, sd=1, log = FALSE)
plot(x4,y,"l",lwd=3, xlab="",ylab="",main="")
polygon(x4, y, col = "gray")



# posso apresentar o arquivo gráfico_normal_aleatorio
#
mi<-c(0,0)
sigma <- matrix(c(1,0,0,2),2,2)
c <- mvrnorm(n = 1000,mi,sigma,10e-6,empirical = TRUE,EISPACK = FALSE)
#c
corre<-sigma[1,2]/(sqrt(sigma[1,1])*sqrt(sigma[2,2]))
corre


# Boxplot
x = c(5,5,5,13,7,11,11,9,8,9)
> y = c(11,8,4,5,9,5,10,5,4,10)
boxplot(x,y)             #para plotar no mesmo gráfico (comparação)
boxplot(x); boxplot(y)   #para plotar em gráficos diferentes

boxplot(count~spray,data=InsectSprays,xlab="Tipo de Spray",
+ ylab="Contagem de Insetos",main="InsectSprays data",
+ col="yellow")


# Ramos e Folhas

rf<-c(5.50,5.61,4.88,5.07,5.26,5.55,5.36,5.29,5.58,5.65,5.57,5.53,5.62,5.29,5.4
> stem(rf)
The decimal point is 1 digit(s) to the left of the |
48 | 8
49 |
50 | 7
51 | 0
52 | 6799
53 | 04469
54 | 2467
55 | 03578
56 | 12358
57 | 59
58 | 5



# posso apresentar o arquivo  grafico_normal_aleatorio
x <- seq ( -6, 6, len=100 )
y <- cbind ( dnorm ( x, -2, 1 ),
dnorm (x, 0, 2 ),
dnorm ( x, 0, .5),
dnorm ( x, 2, .3 ),
dnorm ( x, -.5, 3 ) )
matplot ( x, y, type="l", col=1 )
legend ( -6, 1.3,
paste("mu =", c(-2,0,0,2,-.5),"; sigma =",c(1,2,.5,.3,3)),lty=1:5, col=1, cex=.75 )


# Distribuição Binomial
#Uma amostra de ar tem 10% de chance de conter certa molécula rara. Considere que as amostras sejam independentes com relação à presença da molécula rara. Encontre a probabilidade de que nas próximas 18 amostras, exatamente 2 contenham a molécula rara.
p <- 0.1   #probabilidade
n <- 18    #número de amostras
x <- 2     #número de sucessos em 18 amostras
dbinom(x, n, p)  # distribuição binomial
pbinom(x, n, p)  # probabilidade binomial
x<—1:8
Fx <- dbinom(x,8,0.2)
plot(x, Fx, type="S")

#A probabilidade de uma peça artesanal ser feita com perfeição por um artesão é de 50%. Considerando que o artesão produz, de maneira independente, 6 peças por dia, pede-se:

#a) Obter a distribuição de probabilidades, ou seja, as probabilidades associadas aos possíveis valores da variável aleatórias discreta x, em que x = número de peças perfeitas produzidas pelo artesão num único dia.
x <- 0:6
n <- 6
p <- 0.5
bino <- dbinom(x, n, p)
bino

#b) Plotar o gráfico com os valores da probabilidade calculada.
plot(x,bino,type="h",xlab="Nro de peças com perfeição", + ylab="Probabilidade",main="Distribuição binomial")



# Distribuição de Poisson
#Em um fio delgado de cobre, o número de falhas no fio segue a distribuição de Poisson, com uma média de 2,3 falhas por milímetro.

#a) Determine a probabilidade de existir exatamente 2 falhas em um milímetro de fio.
x<-2
lambda<-2.3
dpois(x,lambda)  #distribuição de Poisson com parâmetros x e lambda:

#b) Sabendo que o número máximo de erros no teste de qualidade é de 10 erros/mm, verifique as probabilidades de que ocorram de 0 a 10 falhas no fio. Plote o gráfico da distribuição.
x <- 0:10
poisson <- dpois(x, lambda)
plot(x,poisson, xlab= "Nro de erros por milímetro",+ ylab="Probabilidade de Poisson",main="Distribuição de Poisson") > lines(x,poisson)



# Distribuição Gaussiana
#Um pesquisador coletou os dados da estatura de jovens em idade de alistamento militar. Sabe-se que a estatura de uma população segue a distribuição nor- mal, com média 170 cm e variância 36 cm2 (desvio padrão de 6 cm2).

#a) Qual a probabilidade de se encontrar um jovem com mais de 1,79 m de altura?
1-pnorm(179,170,6) #pnorm(x,média,desvio padrão)
[1] 0.0668072

#b) Qual a altura em que a probabilidade de encontrarmos valores menores que ela seja de 80%?
qnorm(0.8, 170,6)

#c) Represente graficamente a curva da distribuição normal para este problema e identifique as respostas dos itens a e b.
curve(dnorm(x,170,6),170-3*6,170+3*6,xlab="Alturas (cm)",+ ylab="Probabilidade de se encontrar a altura x",+ main="Distribuição Normal")
lines(c(179,179),c(0,0.022),col="red")
lines(c(175.0497,175.0497),c(0,0.0465),col="blue")



# Distribuição Normal de probabilidades
#A velocidade de veículos em uma rodovia segue uma distribuição Normal com média 60km/h e variância 400(km/h)2.
#(a) Qual a probabilidade de um veículo ser flagrado a mais de 100km/h? Solução:
x<-seq(-30,150,by =.01)
y<-dnorm(x, mean=60,sd=20, log = FALSE)
rx<-seq(100,150,by =.1)
ry<-numeric(2*length(rx))
ry[1:length(rx)]<-dnorm(rx,mean=60,sd=20,log=FALSE)
rx<-c(rx,rev(rx))
plot(x,y,”l”,xlab=“Velocidade (km/h)”,ylab=“fdp(x)”)
polygon(rx, ry, col = "gray")
abline(v=60,h=0,lty=3)

#(b) E qual a chance de um automóvel estar trafegando entre 40 e 70km/h?
x<-seq(-30,150,by = .01)
y<-dnorm(x, mean=60,sd=20, log = FALSE)
rx<-seq(40,70,by =.1)
ry<-numeric(2*length(rx))
ry[1:length(rx)]<-dnorm(rx,mean=60,sd=20, log = FALSE)
rx<-c(rx,rev(rx))
plot(x,y,”l”,xlab=“Velocidade (km/h)”,ylab=“fdp(x)”)
polygon(rx, ry, col = “gray”)
abline(v=60,h=0,lty=3)

#(c) Qual intervalo contém 90% dos veículos?
x<-seq(-30,150,by = .01)
y<-dnorm(x, mean=60,sd=20, log = FALSE)
rx<-seq(27.1,92.9,by=.1)
ry<-numeric(2*length(rx))
ry[1:length(rx)]<-dnorm(rx,mean=60,sd=20, log = FALSE)
rx<-c(rx,rev(rx))
plot(x,y,’l’,xlab=’Velocidade (km/h)’,ylab=’fdp(x)’)
polygon(rx, ry, col = ’gray’)
abline(v=60,h=0,lty=3)



#Distribuição de T-Student
x<-seq(-4,4,by=.01)
yn<-dnorm(x,mean=0,sd=1)
yt1<-dt(x,df=5)
yt2<-dt(x,df=30)
plot(x,yn,”l”,lty=1,xlab=“”,ylab=“”)
points(x,yt1, “l”, lty=2)
points(x, yt2, “l”, lty=3)


# Distribuição de Weibull
#O tempo de falha (em horas) de um mancal em um eixo mecânico é satisfatoriamente modelado como uma variável aleatória de Weibull com beta = 1/2 delta = 5000.

#a) Determine a probabilidade de um mancal durar no mínimo 6000 h.
1-pweibull(6000,0.5,5000)

#b) Verificar a probabilidade de um mancal ter problemas nas primeiras 6000 h. Plotar
x <- 0:6000
curve(dweibull(x,0.5,5000),0,7000) #dweibull(x, beta,delta)



#Teste de Hipotese
#Teste de homogeneidade de Variâncias (teste F):
x<-seq(0,7,by=.01)
y<-df(x,10,10)
plot(x, y, "l", xlab= “X”, ylab=“f(X)”)
rx<-seq(1,3.7,by =.1)
ry<-vector(“numeric”,2*length(rx))
ry[1:length(rx)]<-df(rx,10,10)
rx<-c(rx,rev(rx))
plot(x,y,”l”,xlab=“X”,ylab=“f(X)”)
polygon(rx, ry, col = "gray")
abline(h=0)



#Teste sobre mu (populações infinitas)
#(a)Unilateral
x<-seq(-4,4,by =.01)
y<-dnorm(x, mean=0,sd=1, log = FALSE)
rx<-seq(1.5,4,by =.1)
ry<-numeric(2*length(rx))
ry[1:length(rx)]<-dnorm(rx, mean=0,sd=1, log = FALSE)
rx<-c(rx,rev(rx))
plot(x,y,’l’,xlab=’’,ylab=’’)
polygon(rx, ry, col = "gray")
abline(h=0,lty=3)


#(b)Bilateral
rx<-seq(2,4,by =.1)
ry<-numeric(2*length(rx))
ry[1:length(rx)]<-dnorm(rx, mean=0,sd=1, log = FALSE)
rx<-c(rx,rev(rx))
rx1<- seq(-4,-2,by =.1)
ry1<-numeric(2*length(rx1))
ry1[1:length(rx1)]<-dnorm(rx1, mean=0,sd=1, log = FALSE)
rx1<-c(rx1,rev(rx1))
plot(x,y,’l’,xlab=’’,ylab=’’)
polygon(rx, ry, col = "gray")
polygon(rx1, ry1, col = "gray")
abline(h=0,lty=3)


#Correlação
rx<-seq(2,4,by =.1)
ry<-numeric(2*length(rx))
ry[1:length(rx)]<-dnorm(rx, mean=0,sd=1, log = FALSE)
rx<-c(rx,rev(rx))
rx1<- seq(-4,-2,by =.1)
ry1<-numeric(2*length(rx1))
ry1[1:length(rx1)]<-dnorm(rx1, mean=0,sd=1, log = FALSE)
rx1<-c(rx1,rev(rx1))
plot(rx,ry,"l",xlab="X",ylab="Y",log)
polygon(rx, ry, col = "gray")
polygon(rx1, ry1, col = "gray")
abline(h=0,lty=3)


#grafico de normais coloridas
plot(dnorm, -3, 3, xlab='valores de X', ylab='densidade de probabilidade')
title('Distribuicão Normal\nX ~ N(100, 64)')

plot(function(x) dnorm(x, 100, 8), 60, 140, ylab='f(x)')
plot(function(x) dnorm(x, 90, 8), 60, 140, add=T, col=2)
plot(function(x) dnorm(x, 100, 15), 60, 140, add=T, col=3)
legend(120, 0.05, c("N(100,64)","N(90,64)","N(100,225)"), fill=1:3)


op <- par(mfrow = c(1, 2))  # organiza os graficos em 1 fila e 2 colunas
#Para normal 1
mu1<-0                      # definindo o valor esperado de x1
mu2<-0                      # definindo o valor esperado de x2
s11<-1                      # definindo a variancia de x1
s12<-0                      # definindo a covariancia entre x1 e x2
s22<-1                      # definindo a variancia de x2
rho<-0                      # definido a coeficiente de correlacao entre x1 e x2
x1<-seq(-10,10,length=41)   # gera um vetor x1 de 41 elem. de -10 a 10 (paso 0,5)
x2<-x1                      # cópia x1 para x2
#
#
f<-function(x1,x2){
    term1 <- 1/(2*pi*sqrt(s11*s22*(1-rho^2)))
    term2 <- -1/(2*(1-rho^2))
    term3 <- (x1-mu1)^2/s11
    term4 <- (x2-mu2)^2/s22
    term5 <- -2*rho*((x1-mu1)*(x2-mu2))/(sqrt(s11)*sqrt(s22))
    term1*exp(term2*(term3+term4-term5))
}                    # criação da função de densidade normal multivariada
#
z<-outer(x1,x2,f)    # calcular os valores de densidade
#

persp(x1, x2, z,
main="Distribuição Normal Bidimensional",
sub=expression(italic(f)~(bold(x))==frac(1,2~pi~sqrt(sigma[11]~
sigma[22]~(1-rho^2)))~phantom(0)~exp~bgroup("{",
list(-frac(1,2(1-rho^2)),
bgroup("[", frac((x[1]~-~mu[1])^2, sigma[11])~-~2~rho~frac(x[1]~-~mu[1],
sqrt(sigma[11]))~ frac(x[2]~-~mu[2],sqrt(sigma[22]))~+~
frac((x[2]~-~mu[2])^2, sigma[22]),"]")),"}")),
col="lightgreen",
theta=30, phi=20,
r=50,
d=0.1,
expand=0.5,
ltheta=90, lphi=180,
shade=0.75,
ticktype="detailed",
nticks=5)            # produces the 3-D plot
# adicionando uma linha de texto para o gráfico
mtext(expression(list(mu[1]==0,mu[2]==0,sigma[11]==1,sigma[22]==1,sigma[12]==0)), side=3)

#Curva de Nivel normal 1
contour(x1, x2, z,main="Curva de Nivel",col = "black",xlim = c(-2.5, 2.5), ylim = c(-2.5, 2.5), nlev = 10, lty = 1, method = "simple")













# posso apresentar o análise de componentes principais
#
x
z
PCA(x,z)


dados1=c(3,1,4,36,17,14,29,27,33,23,9,10,17,23,11)
dados2=c(7,6,1,8,19,6,18,19,13,4,17,13,11,8,4,12)
dados1
dados2
var.test-(dados1,dados2)

var.test(dados1,dados2,conf.level=0.9)

t.test(dados1,dados2,var.equal=FALSE)






