# Comandos Básicos:
#********************

# Vetores
seg <- 5
ter <- 4
qua <- 1
qui <- 6
sex <- 2
x <- 90
x[1]         # Todas as variáveis no R são vetores

# Criando vetores - função c
x <- c(5, 4, 1, 6, 2)
x          # Retorna o vertor inteiro
x[2]       # Endereço de vetores no R começam pelo 1
x=edit(x)  # Edita vetores

is.vector(x) # True
is.vector(90) # True
is.vector(90[1]) #True


x<-c(1,2,3,4)
class(x)         # vetor de números
x<-c(1,2,3,”4”)
class(x)         # vetor de carateres
x[2]             # devolve o 2do elemento = 2
x[-2]            # devolve o vetor menos o segundo elemento
x[c(2,3)]        # devolve o segundo e terceio elemento
x[2:4]           # devolve desde o segundo ao quarto elemento


# Nomeando vetores
vitorias <- c(1, 2, 3, 4, 5, 6)
nomesSemana <- c("Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado")
vitorias[2]         # Pode selecionar valores por número e por nome
vitorias["Terça"]

numeros <- c(1:6)
names(numeros) <- c("Num1", "Num2", "Num3", "Num4", "Num5", "Num6")
numeros[4]         # devolve o nome
numeros["Num4"]    # devolve o número
numeros[c(1,3,5)]  # Vetor de chaves  devolve  numero e nome


x <- c(1:10)
names(x) <- c("Ímpar", "Par")          # Não completa os nomes. Só nomeia os dois primeiros

x <- c(1,2)
names(x) <- c("Ímpar", "Par", "Ble")  #Erro. Mais nomes que o tamanho do vetor a ser nomeado



#Operações matemáticas em vetores
x <- c(1:10)   # Vetor a ser calculado

x + 10                   # Soma
xMultiplicado <- x * 10  # Multiplicação
mult <- c(2:12)          # Multiplicação entre vetores
x * mult                 # O Comprimento tem que ser igual ou m˙ltiplo

mult <- c(2:11)
x * mult                 # devolve a multiplicação elemento por elemento

y <- c(1:3)
x * y                    # Erro Vetor menor que o alvo

# Ajustar
y <- c(2,3)
x * y                    # devolve a multiplicação


# Adicionando / Removendo elementos em vetores
vitorias <- c(1:5)
names(vitorias) <- c("V1", "V2", "V3", "V4", "V5")

vitorias[6] <- 6     # Adicionar por endereçamento direto
vitorias[length(vitorias) + 1] <- 7  # Adicionar por endereçamento (tamanho + 1)
vitorias <- c(vitorias, 8)           # Adicionando os valores em um outro vetor

vitorias <- vitorias[-3]        # Remover via index
vitorias <- vitorias[-c(1:3)]   # Remover via vetor de index



# Criando Matrices
m <- c(1,2,3,4,5,6)
dim(m) <- c(2,3)                   # muda as dimensao de o vetor para 2 filas e 3 columas
m2<-matrix(c(1,2,3,4,5,6),nrow=2)  # cria uma matriz a partir do vetor
m2==m                              # compara as duas matrices
m[1,2]                             # devolve o elemento
m[1,]                              # devolve os elementos da fila 1
m[,2]                              # devolve os elementos da fila 2
m[m[,1]>1,2]                       # quero os elementos da segunda coluna que cumpram uma condição

umAoCem <- c(1:100)
# Matriz (matrix) - Dividir um vetor em linhas e colunas
# matrx(data, nrow=[qt. Linhas], ncol = [qt. Colunas], byrow = [F ou T], dimnames = [nomes])
# duvida = ?matrix

matrix(c(1:100))         # 1 coluna, 100 linhas
matrix(c(1:100), 5)      # 5 linhas, 20 colunas
matrix(c(1:100), ncol=5) # 5 colunas, 20 linhas
matrix(umAoCem, ncol=5)  # 5 colunas, 20 linhas

# Atribuindo matrix para uma variável
matrizCem <- matrix(umAoCem, ncol=5)

# Linhas/colunas tem que ser multiplo do vetor que ser· transformado em matriz
matrix(c(1:10), nrow =3)   # Sobe um warning, mas cria o vetor reciclando os números
matrix(c(1:10), nrow =10)

# Matriz com byrow = T -> Distribui os números por linhas
# Matriz com byrow = F -> Distribui por colunas

matrix(c(1:10), nrow = 5, byrow = TRUE)
matrix(c(1:10), nrow = 5, byrow = FALSE)


#rbind e cbind
rbind(1:4, 2:5)   # Começa distrribuir linha por linha
cbind(1:4, 2:5)   # ComeÁa coluna por coluna
# Exemplo
vetorPessoas <- c("Xico", "Ze", "Tio", "Pedro")
vetorCachacasIngeridas <- c(3, 4, 1, 12)
cbind(vetorPessoas, vetorCachacasIngeridas)
rbind(vetorPessoas, vetorCachacasIngeridas)


# Nomeando matrizes
vetorNomeCachaceiros <- c("Zé Guela", "Chico Bioca", "Zeca Muringa")
vetorQuantidadeCachacas <- c(3, 5, 8)
vetorCachaceiros <- cbind(vetorNomeCachaceiros, vetorQuantidadeCachacas)
vetorColunas <- c("Nome do Cachaceiro", "Quantidade de Cachaças")

#Nomeia as colunas
colnames(vetorCachaceiros) <- vetorColunas
vetorLinhas <- c("⁄ltimo Lugar", "Penultimo Lugar", "Supremo Cachaceiro")

#Nomear as linhas
rownames(vetorCachaceiros) <- vetorLinhas

#Seleção de Valores
vetorCachaceiros[1,1]
vetorCachaceiros[1,2]
vetorCachaceiros[2,2]

#Seleção de Linha
vetorCachaceiros[1,]

#Seleção da Coluna
vetorCachaceiros[,1]

# Tipos de retorno
class(vetorCachaceiros[1,1]) #character
class(vetorCachaceiros[1,]) # character
is.vector(vetorCachaceiros[1,1]) # Retorna um vetor
is.matrix(vetorCachaceiros) #TRUE
is.matrix(vetorCachaceiros[1,1]) #FALSE


#Atribuindo os nomes das colulas/linhas
colnames(matrizCachaceiros) <- vetorColunas
rownames(matrizCachaceiros) <- vetorLinhas

vetorNomeOutrosCachaceiros <- c("Betinho da Viola", "Ti„o Corno Manso", "Ribamar Fread„o")
vetorQuantidadeCachacasOutros <- c(3, 5, 8)
matrizOutrosCachaceiros <- cbind(vetorNomeOutrosCachaceiros , vetorQuantidadeCachacasOutros)

#Atribuindo os nomes das colulas/linhas
colnames(matrizOutrosCachaceiros) <- vetorColunas
rownames(matrizOutrosCachaceiros) <- vetorLinhas


matrizTodosCachaceiros <- rbind(matrizCachaceiros, matrizOutrosCachaceiros)

matrizTodosCachaceiros[-2,] #Remove a linha 2
matrizTodosCachaceiros[,-2] #Remove a coluna 2
matrizTodosCachaceiros[c(-1, -3, -5),] #Remove a linha 1, 3 e 5
matrizTodosCachaceiros[-c(1, 3, 5),] #Remove a linha 1, 3 e 5
vetorInternacoes = c(0,1,0,1,2,3)
matrizTodosCachaceirosCompleta <- cbind(matrizTodosCachaceiros, vetorInternacoes)

vetorColunas <- c("Nome do Cachaceiro", "Quantidade de CachaÁas", "Quantidade de InternaÁıes")
colnames(matrizTodosCachaceirosCompleta) <- vetorColunas

vetorNovasPosicoes <- c("Supremo Cachaceiro", "2∫", "3∫", "4∫", "5∫", "6∫")
rownames(matrizTodosCachaceirosCompleta) <- vetorNovasPosicoes


#Somando Linhas/Colunas 2
vetorColunas <- c("Quantidade de CachaÁas", "Quantidade de InternaÁıes")
vetorNomeCachaceiros <- c("ZÈ Guela", "Chico Bioca", "Zeca Muringa","Betinho da Viola", "Ti„o Corno Manso", "Ribamar Fread„o")
vetorQuantidadeCachacas <- c(3, 5, 8, 3, 1, 4)
vetorInternacoes = c(0,1,0,1,2,3)

matrizCalculo <- cbind(vetorQuantidadeCachacas, vetorInternacoes)
vetorColunas <- c("Quantidade de Cachaças", "Quantidade de Internações")
rownames(matrizCalculo) <- vetorNomeCachaceiros
colnames(matrizCalculo) <-  vetorColunas

colSums(matrizCalculo)
rowSums(matrizCalculo)


#Factors
vetorJogadores <- c("BR","BR","BR","BR","ARG","ARG","ARG","PAR","PAR","CHI","BR","BR","BR","BR","ARG","ARG","ARG","PAR","PAR","CHI","BR","BR","BR","BR","ARG","ARG","ARG","PAR","PAR","CHI")

factorJogadores <- factor(vetorJogadores)
str(factorJogadores )
summary(factorJogadores)


# Voto de Maior Cachaceiro no Buteco Bebe e Trava
# Bibica Gamb·, XexÈu Furico, Bira Chifrudo, Elias Bala Choca
vetorVotos <- c("BG", "XF", "BC", "EBC","BG", "XF", "BC", "EBC","BG", "XF", "BC","BG", "XF", "BC", "EBC","BG", "XF", "BC","BG", "XF", "BC", "EBC","BG", "XF", "BC")
vetorNomesCachaceiros <- c("Bira Chifrudo", "Bibica Gamb·", "Elias Bala Choca", "XexÈu Furico")
resultado <- factor(vetorVotos, labels = vetorNomesCachaceiros)

str(resultado)
summary(resultado)
levels(resultado) <- vetorNomesCachaceiros
?labels

#Aula 23 - Factor com valores qualitativos ordinais
#VB - Velho Barreiro
#51 - Pirassununga 51
#CT - Corote
#SA - Sagatiba
vetorVotosCachacas <- c("VB", "51", "CT", "SA", "VB", "51", "CT","51", "CT","51", "CT","CT","CT","CT","CT","CT","CT","CT","CT","CT","CT")
vetorNomesCachacas <- c("Sagatiba", "Velho Barreiro", "Pirassununga 51", "Corote")
vetorMelhoresCachacas <- c("SA", "VB", "51", "CT")

resultadoVotosCachacas <- factor(vetorVotosCachacas,
labels = vetorNomesCachacas,
ordered = TRUE,
levels = vetorMelhoresCachacas)
summary(resultadoVotosCachacas)
str(resultadoVotosCachacas)

resultadoVotosCachacas[1] > resultadoVotosCachacas[2] # false
resultadoVotosCachacas[1] < resultadoVotosCachacas[2] # true
resultadoVotosCachacas[1] == resultadoVotosCachacas[1] # true



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




