conts <- as.numeric(c())
for(i in 1:1000){
  contagem <- 1
  for(i in 1:100){
  sequencia <-sort(sample(1:6, 3, replace = TRUE))
  if ((sequencia[2] - sequencia[1] == 1) & (sequencia[3] - sequencia[2] == 1)) break
  contagem <- contagem + 1
  }
  print(contagem)
  conts[i] <- contagem
}


baskara <- function(a, b = 1, c = 0) {
  delta <- b^2 - 4 * a * c
  x <- (-b + c(-1, 1) * sqrt(delta))/(2 * a)
  return(x)
}

args(baskara)
formals(baskara)
body(baskara)

c <- c()
for (i in c){
 print("oi")
}

for(i in 1:3) { if(i == 2) break 
  print(i) }


sqrt(-1)
if(NA) 1 else 0

conj <- c()
for(i in 1:1000){
  limite <- 100
  a <- 1
  while (a < limite) {
    ordem <- sort(sample(1:6, 3, replace = TRUE))
    print(ordem)
    if ((ordem[2] - ordem[1]) == 1 & (ordem[3] - ordem[2] ==1)) break 
    a <- a + 1
  }
  conj[i] <- a
}
mean(conj)
conj


baskara <-  function(a = 1, b ,c){
  if(a ==0) {
    stop("invalido!")
  }
  delta <- b^2 - 4 * a * c
  if (delta < 0) {
    stop("Nuemero imaginario")
  } 
  x <- (-b + c(-1, +1) * sqrt(delta)) / (2*a)
  return(x)
  }
 baskara( b = 2, c = 1)

 
 
 ## Tratando exceções
 calcula_imc <- function(altura, peso = 80) {
   if(altura < 0) stop("Altura deve ser maior do que zero.")
   if(peso < 0) stop("Peso deve ser maior do que zero.")
   imc <- peso/(altura^2)
   limits <- c(0, 18.5, 25, 30, Inf)
   labels <- c("Magreza", "Adequado", "Pré-obeso", "Obesidade")
   classif <- labels[findInterval(imc, limits)]
   limite <- findInterval(imc, limits)
   return(list(IMC = imc, Classificao = classif, limite = limite))
 }
calcula_imc((altura = 1.8))

if(NA) 1 else 0

tentativas_dados <- function(n_dados, nmax, n_simulacao){
output <- c()
for (i in 1:n_simulacao){
  tentativas <- 1
  while(tentativas < nmax){
    nums <-  sort(sample(1:6, n_dados, replace = TRUE))
      seque <- sum(ifelse(diff(nums) == 1, TRUE, FALSE))
      if(seque == c(n_dados-1)) break
    tentativas <- tentativas + 1
  }
  output[i] <- tentativas
}
return(output)

}
tentativas_dados(n_dados = 3, nmax = 100, n_simulacao = 1000)
