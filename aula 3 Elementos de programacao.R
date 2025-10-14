h <- 3
if (h>=6 & h <12) {
  saudacao <- "bom dia!"
}else if (h>= 12 & h < 18) {
  saudacao <- "boa tarde!"
}else if (h >=18 & h <23) {
  saudacao <- "boa noite!"
}else {saudacao <- "nossos horarios de atendimento sao das 6 as 23"
stop("nao enviar mensagem")
}
saudacao
h <- 13

# Exercício tipo de média
tipo <- "aritmetica"
tipo <- "harmonica"
tipo <- "geometrica"
tipo <- "ajhfaksfhdkashd"

x <- 1:10

switch(tipo,
       "aritmetica" = {mean(x)},
       "harmonica" = {lenght}
       
       
       notas <- c("João" = 70, "Ana" = 89,
                  "Márcia" = 81, "Tiago" = 65,
                  "Rodrigo" = 35)
       # Usando IF-ELSE vetorial.
       ifelse(notas >= 70, "Aprovado",
              ifelse(notas >= 40, "Exame",
                     "Reprovado"))
       
       # Usando SWITCH vetorial.
       dplyr::case_when(notas >= 70 ~ "Aprovado",
                        notas >= 40 ~ "Exame",
                        TRUE ~ "Reprovado")
       
       
for(i in 1:1000) {
  tentativas <- 0
  repeat {
    tentativas <- tentativas + 1
    dados <- sample(1:6, size = 3, replace = TRUE)
    ordem <- sort(dados)
    dif <- diff(ordem)
    if (dif[1] == 1 & dif[2] == 1) break
  }
  output[i] <- tentativas
}
       
output   
mean(output) 


baskara <- function(a, b = 1, c = 0) {
  delta <- b^2 - 4*a*c
  x <- (-b +c(-1,1) *sqrt(delta))/(2*a)
  return(x)
}
args(baskara)
formals(baskara)

x <- (baskara(a = 2, b = -3, c = -3))
x

soma <- 0 
for(i in 1:5) { if (i %% 2 == 0) next soma <- soma + i }
soma

vec <- numeric(0) for (i in 1:3) { vec <- c(vec, i) }
vec

x <- c()
for(i in 1:10) {
  x[i] <- i^2 
}
print(x)
sum(x)

a <- 1
b <- 0
c <- 0

baskara <-function(a, b, c) {
delta <- b^2* - 4*a*c
x <- (-b +c(-1,1) * sqrt(Delta)) / (2*a)
return(x)
}
x


dados <-funcion(n_dados, n_max, n_simu) {
  output <- c()
  for(i in 1:nsimu) {
    tentativas <-  1
    while(tentativas < nmax)
  }
}


## Elementos de Programação para Estatística -----------------------------------
## Prof. Wagner Hugo Bonat · LEG/UFPR ------------------------------------------

## Estruturas de programação

# Exercício Saudação
h <- 2

if (h >= 6 & h < 12) {
  saudacao <- "Bom dia!"
} else if (h >= 12 & h < 18) {
  saudacao <- "Boa tarde!"
} else if (h >= 18 & h < 23) {
  saudacao <- "Boa noite!"
} else {
  saudacao <- "Não enviar men;sagem!"
  stop("Não enviar mensagem!")
}

saudacao

# Exercício tipo de média
#tipo <- "aritmetica"
#tipo <- "harmonica"
#tipo <- "geometrica"
tipo <- "ajhfaksfhdkashd"

x <- 1:10

switch(tipo,
       "aritmetica" = {
         mean(x)
       },
       "harmonica" = {
         length(x)/sum(1/x)
       },
       "geometrica" = {
         prod(x)^(1/length(x))
       },
       {
         NA_real_
       })

# Funções vetorizadas
notas <- c("João" = 70, "Ana" = 89,
           "Márcia" = 81, "Tiago" = 65,
           "Rodrigo" = 35)
# Usando IF-ELSE vetorial.
ifelse(notas >= 70, "Aprovado",
       ifelse(notas >= 40, "Exame",
              "Reprovado"))

# Usando SWITCH vetorial.
dplyr::case_when(notas >= 70 ~ "Aprovado",
                 notas >= 40 ~ "Exame",
                 TRUE ~ "Reprovado")

## Estruturas de repetição

# Exemplo de estrutura for

for(i in 1:10) {
  print(i^2)
}

# Exercício · Lançamento de dados
n_max <- 100
tentativas <- 1
while(tentativas < n_max) {
  l1 <- sample(1:6, 3, replace = TRUE) # joga os dados
  l1_ordenado <- sort(l1) # ordenada
  print(l1_ordenado)
  seque <- sum(ifelse(diff(l1_ordenado) == 1, TRUE, FALSE))
  if(seque == 2) break
  tentativas <- tentativas + 1
}
tentativas

# Exercício · Número médio de tentativas

output <- c()
for(i in 1:1000) {
  n_max <- 100
  tentativas <- 1
  while(tentativas < n_max) {
    l1 <- sample(1:6, 3, replace = TRUE) # joga os dados
    l1_ordenado <- sort(l1) # ordenada
    print(l1_ordenado)
    seque <- sum(ifelse(diff(l1_ordenado) == 1, TRUE, FALSE))
    if(seque == 2) break
    tentativas <- tentativas + 1
  } 
  output[i] <- tentativas
}

mean(output)
hist(output)

## Funções

# Formula de baskara
baskara <- function(a, b = 1, c = 0) {
  delta <- b^2 - 4 * a * c
  x <- (-b + c(-1, 1) * sqrt(delta))/(2 * a)
  return(x)
}

args(baskara)
formals(baskara)
body(baskara)

curve(2 * x^2 - 3 * x -3, from = -1, to = 3)
abline(h = 0, col = "red")

x <- baskara(a = 2, b = -3, c = -3)
x

curve(2 * x^2 - 3 * x -3, from = -1, to = 3)
abline(h = 0, col = "red")
abline(v = x, col = "blue")

baskara2 <- function(a, b = 1, c = 0) {
  delta <- b^2 - 4 * a * c
  if (delta < 0) {
    return(c(NA_real_, NA_real_))
  }
  x <- (-b + c(-1, 1) * sqrt(delta))/(2 * a)
  return(x)
}

baskara(a = 2, b = -3, c = 3)
baskara2(a = 2, b = -3, c = 3)

baskara3 <- function(a, b = 1, c = 0) {
  if (a == 0) {
    # stop("O valor de `a` deve ser diferente de 0.")
    message("O valor de `a` deve ser diferente de 0.")
    return(c(NA_real_, NA_real_))
  }
  delta <- b^2 - 4 * a * c
  if (delta < 0) {
    return(c(NA_real_, NA_real_))
  }
  x <- (-b + c(-1, 1) * sqrt(delta))/(2 * a)
  return(x)
}

suppressMessages(baskara3(a = 0, b = -3, c = 3))

## Instruções para funções

joga_dados <- function(n_dados, n_max, n_simulacao) {
  output <- c()
  for(i in 1:n_simulacao) {
    tentativas <- 1
    while(tentativas < n_max) {
      l1 <- sample(1:6, n_dados, replace = TRUE) # joga os dados
      l1_ordenado <- sort(l1) # ordenada
      seque <- sum(ifelse(diff(l1_ordenado) == 1, TRUE, FALSE))
      if(seque == c(n_dados-1)) break
      tentativas <- tentativas + 1
    } 
    output[i] <- tentativas
  }
  return(output)
}

jogadas <- joga_dados(n_dados = 3, n_max = 100, n_simulacao = 1000)
jogadas <- joga_dados(n_dados = 4, n_max = 100, n_simulacao = 1000)
mean(jogadas)


## Aspectos avançados
# Calculo do IMC

calcula_imc <- function(peso, altura) {
  imc <- peso/(altura^2)
  limits <- c(0, 18.5, 25, 30, Inf)
  labels <- c("Magreza", "Adequado", "Pré-obeso", "Obesidade")
  classif <- labels[findInterval(imc, limits)]
  return(list(IMC = imc, Classificao = classif))
}
calcula_imc(peso = 80, altura = 1.80)


# Argumento com valor default
calcula_imc <- function(altura, peso = 80) {
  imc <- peso/(altura^2)
  limits <- c(0, 18.5, 25, 30, Inf)
  labels <- c("Magreza", "Adequado", "Pré-obeso", "Obesidade")
  classif <- labels[findInterval(imc, limits)]
  return(list(IMC = imc, Classificao = classif))
}
calcula_imc(altura = 1.80)


## Tratando exceções
calcula_imc <- function(altura, peso = 80) {
  if(altura < 0) stop("Altura deve ser maior do que zero.")
  if(peso < 0) stop("Peso deve ser maior do que zero.")
  imc <- peso/(altura^2)
  limits <- c(0, 18.5, 25, 30, Inf)
  labels <- c("Magreza", "Adequado", "Pré-obeso", "Obesidade")
  classif <- labels[findInterval(imc, limits)]
  return(list(IMC = imc, Classificao = classif))
}
calcula_imc(altura = -1)


## Funções sem argumentos
calcula_imc <- function() {
  if(altura < 0) stop("Altura deve ser maior do que zero.")
  if(peso < 0) stop("Peso deve ser maior do que zero.")
  imc <- peso/(altura^2)
  limits <- c(0, 18.5, 25, 30, Inf)
  labels <- c("Magreza", "Adequado", "Pré-obeso", "Obesidade")
  classif <- labels[findInterval(imc, limits)]
  return(list(IMC = imc, Classificao = classif))
}
peso <- 70
altura <- 1.70
calcula_imc()

## Lazy evaluation
calcula_imc <- function(altura, peso = 80, altura2) {
  if(altura < 0) stop("Altura deve ser maior do que zero.")
  if(peso < 0) stop("Peso deve ser maior do que zero.")
  imc <- peso/(altura^2)
  limits <- c(0, 18.5, 25, 30, Inf)
  labels <- c("Magreza", "Adequado", "Pré-obeso", "Obesidade")
  classif <- labels[findInterval(imc, limits)]
  return(list(IMC = imc, Classificao = classif))
}
calcula_imc(altura = 1.90, peso = 90)

## Uso dos ...

calcula_imc_numero <- function(peso, altura) {
  imc <- peso/(altura^2)
  return(imc)
}

calcula_imc <- function(...) {
  imc <- calcula_imc_numero(...)
  limits <- c(0, 18.5, 25, 30, Inf)
  labels <- c("Magreza", "Adequado", "Pré-obeso", "Obesidade")
  classif <- labels[findInterval(imc, limits)]
  return(list(IMC = imc, Classificao = classif))
}

calcula_imc(peso = 90, altura = 1.70)