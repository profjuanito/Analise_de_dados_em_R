# Criando Dataframes
#********************
#Nomes 

nomes <- c("Hebe Camargo", "Sílvio Santos", "Celso Portioli", "Gugu", "Golias")
anoNascimento <- c(1929, 1930, 1967, 1959, 1929)
idade <- c(83, 85, 49, 57, 76)
sexo <- c("F", "M", "M", "M", "M")
falecido <- c(TRUE, FALSE, FALSE, FALSE, TRUE)

dfDados <- data.frame(nomes, anoNascimento, idade, sexo, falecido)

str(dfDados)



# Ordenando dados num DataFrame
#*******************************

dfDadosIdade <- dfDados[order(dfDados$idade),]
?order

dfDados[order(dfDados$idade),] #Idade: menor para maior
dfDados[order(dfDados$idade, decreasing = TRUE),]



# Adicionar linhas/colunas no dataframe
#***************************************

nomesColunas <- c("Nome", "Nascimento", "Idade", "Sexo", "Falecido?")
names(dfDados) <- nomesColunas
tiririca <- c("Tiririca", 1965, 51, "M", FALSE) # erro
tiririca <- data.frame("Tiririca", 1965, 51, "M", FALSE)
names(tiririca) <- nomesColunas
dfDados  <- rbind(dfDados, tiririca)
aindaSBT <- c(FALSE, TRUE, TRUE, FALSE, FALSE, FALSE)
dfDados <- cbind(dfDados, aindaSBT)

nomesColunasNovo <- c("Nome", "Nascimento", "Idade", "Sexo", "Falecido?", "Ainda no SBT?")
names(dfDados) <- nomesColunasNovo


m<-c(1,2,3,4,5,6)
x<-c("A","B","A","C","A","C")
as.factor(x)
data.frame(m,as.factor(x))
dados<-data.frame(m,as.factor(x))
dados
dim(dados)
rownames(dados)
rownames(dados)<-c("primeiro","segundo","terceiro","quarto","quinto","sexto")
dados
row
colnames(dados)<-c("var1","var2")
dados
class(dados)
dados[,1]
class(dados[,2])
colnames(dados)<-c("var1","var2")
dados
dim(dados)
dados[,2]
dados$var2







# Selecionando dados
#********************

dfDados[dfDados$anoNascimento > 1950,]

dfDados[dfDados$sexo != "F", ]

dfDados$sexo == "M" & dfDados$idade > 50



# Subset
#********

# Nome e idade : idade > 50
x <- dfDados$idade > 50
dfDados[x, c(1, 3)]
subset(dfDados, idade > 50 & sexo == "M" , select = c(nomes, idade))



# Listas
vetorNumeros <- 1:12
matriz <- matrix(1:12, ncol=4)
lista <- list(vetorNumeros, matriz, dfDados)
class(lista[[2]])



# Comparadores l—gicos
# Igual (==), Diferente (!=) Maior (>) Menor (<)
dfDados$anoNascimento > 1930 # Elemento por elemento
dfDados2 <- dfDados[-1,]
dfDados2$anoNascimento > c(1930, 1945)


# E (&) OU (|) NÌO (!)
dfDados$anoNascimento > 1929 & dfDados$falecido == FALSE
!(dfDados$anoNascimento > 1929 && dfDados$falecido == FALSE)


# IF / ELSE
numero <- 6
if (class(numero) != "numeric") {
    print("n‹o Ž numŽrico")
} else {
    if (numero %% 2 == 0) {
        print("O nœmero Ž par")
    } else {
        print("O nœmero Ž ’mpar")
    }
}
class(numero)


# LOOPS (While)
dados <- 1:10
i <- 1
while(i <= length(dados)) {
    if (dados[i] > 4) {
        print(dados[i]);
    }
    i <- i + 1 #Incrementação
}


# LOOPS (FOR)
nomes <- c("Chic‹o", "ZŽ Manguaa", "Tio Torna Tudo", "Mij‹o do Zeca Bala")
# while() {}

# MŽtodo 1
for (i in 1:length(nomes)) {
    print(paste("O cachaceiro selecionado Ž o", nomes[i]))
}

# MŽtodo 2
for (cachaceiro in nomes) {
    print(paste("O cachaceiro selecionado Ž o", cachaceiro))
}



#Break
nomes <- c("Chic‹o", "ZŽ Manguaa", "Tio Torna Tudo", "Mij‹o do Zeca Bala")

# while() {}

# MŽtodo 1
for (i in 1:length(nomes)) {
    print(paste("O cachaceiro selecionado Ž o", nomes[i]))
}

# MŽtodo 2
for (cachaceiro in nomes) {
    if (cachaceiro == "ZŽ Manguaa") {
        break
    }
    print(paste("O cachaceiro selecionado é o", cachaceiro))
}
print("Estes s‹o os cachaceiros")
#{ { escopo } }



# Next
nomes <- c("Chic‹o", "ZŽ Manguaa", "Tio Torna Tudo", "Mij‹o do Zeca Bala")

# while() {}

# MŽtodo 1
for (i in 1:length(nomes)) {
    print(paste("O cachaceiro selecionado é o", nomes[i]))
}


# MŽtodo 2
for (cachaceiro in nomes) {
    if (cachaceiro == "ZŽ Manguaa") {
        next
    }
    print(paste("O cachaceiro selecionado Ž o", cachaceiro))
}
print("Estes s‹o os cachaceiros")
#{ { escopo } }




# Abrindo arquivos csv em R

caminho <- file.path("E:","R","Aulas_r","introdu‹o","Tabela_Brasileirao_2016.csv")

dadosBrasileirao <- read.table(caminho, header = TRUE, sep = ";", stringsAsFactors = FALSE)
dadosBrasileirao

# Abrindo arquivos csv em R - Nomeando Colunas
caminho <- file.path("E:","R","Aulas_r","introdução","Tabela_Brasileirao_2016.csv")

dadosBrasileirao <- read.table(caminho,
header = TRUE,
sep = ";",
col.names = nomeColunas,
stringsAsFactors = FALSE)

dadosBrasileirao
nomeColunas = c("Time", "Pontos", "Jogos", "Vitórias", "Empates", "Derrotas")
names(dadosBrasileirao) <- nomeColunas


# Conectando ao banco de dados MySQL
install.packages("RMySQL")
library(DBI)

con <- dbConnect(RMySQL::MySQL(),
dbname = "Aula_R",
host = "localhost",
user = "root",
password = ""
)

dbDisconnect(con)
