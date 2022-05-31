# Arquivo de comandos para graficar uma curva binormal
# ***************************************************
#
#  gerar aleatoriamente a distribuição binormal com 1000 dados
# mi<-c(0,0)                      # define o vetor de medias
sigma<-matrix(c(1,2,2,9),2,2)   # define a matriz de covariancias
c<-mvrnorm(n = 1000,mi,sigma,10e-6,empirical = TRUE,EISPACK = FALSE)
#c
range(c)
corre<-sigma[1,2]/(sqrt(sigma[1,1])*sqrt(sigma[2,2]))
corre

x1<-seq(-10,10,length=41)   
x2<-x1                   
#
f<-function(x1,x2){
 term1 <- 1/(2*pi*sqrt(sigma[1,1]*sigma[2,2]*(1-corre^2)))
 term2 <- -1/(2*(1-corre^2))
 term3 <- (x1-mi[1])^2/sigma[1,1]
 term4 <- (x2-mi[2])^2/sigma[2,2]
 term5 <- -2*corre*((x1-mi[1])*(x2-mi[2]))/(sqrt(sigma[1,1])*sqrt(sigma[2,2]))
 term1*exp(term2*(term3+term4-term5))
}                    # criação da função de densidade normal multivariada
#
z<-outer(x1,x2,f)    # calcular os valores de densidade
#
persp(x1, x2, z,
main="Distribuição Normal Bidimensional",         #  Titulo principal
sub=expression(italic(f)~(bold(x))==frac(1,2~pi~sqrt(sigma[11]~
sigma[22]~(1-rho^2)))~phantom(0)~exp~bgroup("{",
  list(-frac(1,2(1-rho^2)),
  bgroup("[", frac((x[1]~-~mu[1])^2, sigma[11])~-~2~rho~frac(x[1]~-~mu[1],
  sqrt(sigma[11]))~ frac(x[2]~-~mu[2],sqrt(sigma[22]))~+~
  frac((x[2]~-~mu[2])^2, sigma[22]),"]")),"}")),  # Titulo secundario
col="lightgreen",
theta=30, phi=20,
#theta=10, phi=80,
r=50,
d=0.1,
expand=0.5,
ltheta=90, lphi=180,
shade=0.75,
ticktype="detailed",
nticks=2)            # produces the 3-D plot
                     # adicionando uma linha de texto para o gráfico
mtext(expression(list(mu[1]==0,mu[2]==0,sigma[11]==1.0,sigma[22]==3.0,sigma[12]==1.41)), side=3)




