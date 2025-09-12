x <- rnorm(100000000)
hist(x)
## meu imc
73/1.79^2
## Segundos em um ano
60*60*24
#instrucoes em varias linhas
7+ 
  2+
  2+
  4+
  7
#instrucoes em uma linha 
2+2 ; 7 +5 

peso <- 73
altura <- 1.79
imc <- peso/altura^2
altura; peso; imc
women
plot(women)
cor(women)
ls()
  search()#onde o R procura
ls("package:datasets")#lsita os dados ja existentes do R

getwd()#mostra diretorio de trabalho atual
dir()#mostra o conteudo do diretorio


library(tidyverse) #carrega o pacote

ls("package:tidyverse")

help(package = "tidyverse") 

?women #ou help consulta a documentacao

help.search("women")#procura por women em lugares

apropos("norm") #objetos que batem com um termo de busca

browseVignettes(package = "tidyverse")

RSiteSearch("mosaicplot")#procura pelo termo no rproject


inteiro <- 10L #L forca que 10 seja marcado como inteiro
real <- 10 #eh marcado como numero double ou somente real
is.numeric(inteiro) #funcao is determina se algo eh aquilo ou nao
is.numeric(real)
is.double(inteiro)
is.double(real)
is.integer(real)

#estruturas de dados
vetor_atomico <- c(1,2,3,4) 
matriz <- matrix(c(1,0,0,1),2 ,2)
lista <- list("a" = 5, "b" = 5L, "c" = "letra")
tab <- data.frame("Nome" = c("Bent", "John"), "Idade" = c(3,4))
?reserved

x <- 10
is.double(x)
x <- as.logical(x)
class(x)#mostra a classe 
methods(class = "numeric") #vetor atomico com nome para observacoes
notas <- c("John" = 7.7,
           "Cena" = 5.1,
           "Edu" = 10)
class(notas)
attributes(notas) 
names(notas)


1:7
seq(from = 1, to = 10, by = 0.5) # de um a 10 variando em 0.5
seq(from = 1, to = 20, length.out = 11) #de 1 a 20 em 11 termos
seq(from = 1, by = 2, length.out = 20) # comecando em 1, variando em 2, ate ter 20 observacoes

rep(0, 5) # repete o 0 5 vezes
rep(1:3, 2) #repete o 123, 2 vezes
rep(1:5, each = 2)# repete a sequencia com cada argumento repetido duas vezes

sample(0.00:100.00, size = 6, replace = FALSE) #retira uma amostra de tamanho 10 de uma sequencia de 1 ate 20, sem reposicao
sample(c("a", "b", "c"), size = 10, replace = TRUE)

runif(n = 5, min = 0, max = 1) #5 amostras de uma distribuicao uniforme 
y <- rnorm(n = 1000, mean = 0, sd = 1)
sort(y)
hist(y, 50)


notas <- c("John" = 7.7,
           "Cena" = 5.1,
           "Edu" = 10,
           "carlos" = 3.3,
           "henrique" = 10)
notas[1] #seleciona uma das posucoes do vetor
notas[1:3]
sort(notas)
notas[c(1, 3)]


mask <- notas > 7.0 #selecao por mascara logica, para selecionar determinados valores do conjunto usar []
mask
notas[mask]
notas[notas > 7]


notas["John"] <- 0 #troca um dos itens do conjunto
notas
notas["Cena"] <- NA
notas


append(notas, value = c("carlos" = 9)) #adiciona uma observacao
append(notas, value = c("anass" = 2), after = 0)




matrix <- matrix(data = c(1,0,0,1), 
                 nrow = 2, ncol = 2)
matrix2 <- matrix(data = c(1,1,1,1,0,0,0,0), 
                 nrow = 4, ncol = 2)
matrix2
matrix3 <- matrix(data = c(1,1,1,1,0,0,0,0), 
                  nrow = 4, ncol = 2, byrow =TRUE) #preenche linha com prioridade
matrix3
matrix[1,2] #acessa o valor da cooordenada da matriz
matrix[2,2]
matrix2[1:2, 1:2]
matrix[matrix < 1]
matrix < 1


lista <- list( "num" = 10, "car" = c("Dez"), TRUE, 1+10i)
lista[[1]]
lista[[2]]



str(iris)
head(iris)
tail(iris)
