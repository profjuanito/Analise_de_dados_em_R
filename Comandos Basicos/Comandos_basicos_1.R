# Comandos B�sicos:
#********************

# Diretorio
getwd()          # Mostra o diret�rio em uso
setwd("Dir")     # Cambio de diret�rio
dir()            # mostre o que tem no diret�rio em uso
                 # Cuidado com as mai�sculas e min�sculas � s�o diferentes


# Ajuda
help() , ?         # Muestra a ajuda
help(mean), ?mean  # Muestra ajuda de media
help(princomp)

help(regression)   # Ajuda mas n�o tem fun��o com esse nome

help.search("regression")   # Busca na ajuda este conceito
??regression

help.start(mean)            # precisa instalar (so em Mac) o pacote utils
install.packages("utils")


# Workspace (area de trabalho)
save.image("myworspace")    # guarda o workspace (em binario)
load("myworkspace")         # le o workspace (em binario)

ls()     # mostra os objetos criados e estado no workspace
rm([nome da vari�vel])  # apaga o objeto y do workspace
rm(list = ls())         # Apagar todos os objetos/vari�veis do workspace

# History (arquivo hist�rico)
savehistory("myhistory")    # guarda o history (comando executados) num arquivo
loadhistory("myhistory")    # le o history  precisa instalar (so em Mac) o pacote utils



# Comandos B�sicos: Opera��es Matem�ticas
#*****************************************
# podemos criar vari�veis e estas podem come�ar com mai�sculas ou min�sculas, s� n� podem come�ar com n�mero,
# mas podem ter n�meros e pontos. Vari�veis que come�am com ponto s�o vari�veis de sistemas.

Pago=200
Pago
[1] 200

4 + 5   # Adis�o
4 - 5   # Subtra��o
4 / 6   # Divis�o
4 * 6   # Multiplica��o
4 ^ 4   # Exponencia��o
2 %% 2       # Resto de Divis�o
2 * (2 + 1)  # Ordem de parenteses
1 + 2 * 2    # Ordem Matem�tica


# Atribuindo valores / criando vari�veis
variavel <- 10
variavel    # valor : 10

# Atribuir outro tipo de valor na vari�vel "variavel"
variavel <- "Churros"
variavel

# Resultado de um c�lculo
x <- 20 ^ 2
x / 4


# Tipos b�sicos de dados

#(N�meros)
#Inteiro - Integer
4
class(4L)
#  Sempre colocar o L na frente do n�mero para o R entender que � um
#n�mero inteiro.

# Ponto flutuante - Numeric
4.3
class(65.999)

# Caractere - character
"Churros"
class("Churros")

# L�gico - L�gico TRUE ou FALSE / T ou F
class(TRUE)    # logical
class(FALSE)   # logical
class(t)       # function
class(T)       # logical
class(f)       # N�o encontrado
class(F)       # logical


# Converter dados
# is.integer - inteiro
# is.character - caractere (string)
# is.logical - True ou False
# is.number - n�mero

as.integer("99")   # Retorna 99




# Script
#************
# podemos criar arquivos com os comandos que vamos utilizar

2*2
a<-c(1,2,3,4,5)  # Comentarios

source(�nome�)   # execura



# Executando Pacotes
x<-c(1,3,5,5,7)
x
z<-c(2,2,3,6,6)
z
cor(x,z)            # mostra a correlacao entre x e z

b<-rnorm(1000,0,1)  # cria uma distribui��o normal (1000 dados) com m�dia o e sigma 1
mvrnorm             # cria uma distribui��o bivariada s� que n�o esta instalada
?mvrnorm            # mostra que n�o tem informa��o precisaria saber que paquetes est�o instalados

installed.packages()      # mostra todos os paquetes instalados
install.packages("MASS")
require(MASS)             # ativa o paquete MASS pode ser usado Library(MASS)
mi<-c(0,0)
sigma<-matrix(c(1,0,0,2),2,2)
c<-mvrnorm(n = 1000,mi,sigma,10e-6,empirical = TRUE,EISPACK = FALSE)
c

?PCA
install.packages("FactoMineR")  # instala a fun��o FactoMineR
?PCA
library(FactoMineR)             # ativa a fun��o


# Comandos Basicos:  Chamar algum exemplos de dados

require(MASS)        # ativa o paquete MASS pode ser usado Library(MASS)
data()               # mostra a lista de dados
data(Cars93)         # carrega o conjunto de dados que esta en cars93



#*********************************************************************************
# bibliotecas importantes
#
#- install.packages(�dvtools�)     -> instala pacotes para aa vers�o 4.2 n�o tem
#- install.packages(�readxl�)     -> ler dados de excel
#- install.packages(�ggplot2�)
#- install.packages(�ggpubr�)
#- install.packages(�ggcorrplot�)

#Para fazer mapas de relevos
#- install.packages(�rgdal�)   -> precisa de Rtools
#- install.packages(�raster�)   -> problemas com o paqueta terra ->  para mac
#- install.packages(�dplyr�)   -> para manipulacao de dados  problemas para mac
#- install.packages(�sf�)   ->                                problemas para mac

#- library(readxl) / xlsx  / openxlsx / XLConnect
#- library(dplyr)              -> para manipular dados
#- library(ggplot2)            ->
#- library(geobr)
#- library(RCurl)              -> conecao entre base de dados
#- library(Psych)              -> descri��o de dados
#- library(Lattice)            -> rela��es mais complexas de dados
#- library(ellipse)            -> para matriz de correlacoes
#- library(RODBC)              -> para base de dados
#-install.packages("RMySQL")   -> integrar R  ao SQL
#
# Para mineria de dados (preditiva)
#- install.packages("rattle", dependencies=TRUE)   -> precisa de Rtools
# library(rattle)       -> carga a libraria
# rattle()              ->  carga a interface gr�fica de rattle
#  http://rattle.togaware.com/
#
#Instalar FactoMineR
#source("http:// factominer.freee.fr/install-facto.r")
#library(Rcmdr)  -> aparece o entorno gr�fico
#***************************************************************

