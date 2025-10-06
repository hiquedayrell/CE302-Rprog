devtools::install_github("danicat/read.dbc")
require(read.dbc)
url <- "http://leg.ufpr.br/~ara/data/TUBEBR22.dbc"
download.file(url, destfile = "TUBEBR22.dbc", mode = "wb")
dados22 <- read.dbc("TUBEBR22.dbc")
dados22
url <- "http://leg.ufpr.br/~ara/data/TUBEBR23.dbc"
download.file(url, destfile = "TUBEBR23.dbc", mode = "wb")
dados23 <- read.dbc("TUBEBR23.dbc")
url <- "http://leg.ufpr.br/~ara/data/TUBEBR23.dbc"
download.file(url, destfile = "TUBEBR23.dbc", mode = "wb")
dados23 <- read.dbc("TUBEBR23.dbc")
dados23
url <- "http://leg.ufpr.br/~ara/data/TUBEBR24.dbc"
download.file(url, destfile = "TUBEBR24.dbc", mode = "wb")
dados24 <- read.dbc("TUBEBR24.dbc")
dados24

library(dplyr)

dadosT <- bind_rows(dados22, dados23, dados24) #cria um dataset que contem os tres anos em observacoes


nas.por.variavel <- apply(is.na.data.frame(dadosT),2, sum) #numeros de NA por variavel
nas.por.variavel #numeros de dados que estão faltando
proporcao.nas <- round(nas.por.variavel/nrow(dadosT), 2) #Motra quais variaveis tem menos dados faltantes 
proporcao.nas

menos0.1 <- proporcao.nas[proporcao.nas < 0.1] #mostra quais são as colunas que possuem menos de 0.1 de NAS
menos0.1
dadosT$TP_NOT

dadosT$FORMA #mostra em de forma de factor, o tipo de tuberculose, entre pulmonar, extrapulmonar e ambas
dadosT$FORMA <- as.character(dadosT$FORMA)
dadosT$FORMA <- as.numeric(dadosT$FORMA) #transformam a coluna em numeric, para que eu possa trabalhar com numeros
hist(dadosT$FORMA)


mesa <- table(dadosT$FORMA) #table para visalização
mesa <- as.data.frame(mesa)
mesa$proporcao <- mesa$Freq / sum(mesa$Freq) #cria a proporcao de cada uma das linhas do novo dataframe criado
proporcao <- round(mesa$proporcao, digits = 3) #arredonda para 3 casas a proporcao
proporcao
valores <- round(proporcao *100) #numero de pulmoes expostos, de 100
tipos <- c("Pulmonar", "Extrapulmonar", "Pulmonar + Extrapulmonar") #cria a legenda
cores <- c("#5F826F", "#A197FF", "#A81D11") #define cores, de acordo com roda de cores
waffle_vec <- rep(seq_along(valores), valores)  #permite a repeticao no plot com N vezes pela proporcao definida
waffle_mat <- matrix(waffle_vec, nrow = 10, byrow = TRUE) #cria a matriz vazia 10x10

plot(0:10, 0:10, type="n", axes=FALSE, xlab="", ylab="", asp=1, xaxs="i", yaxs="i") #ajusta os limites para exibicao do grafico e inicia o plot

for (i in 1:10) { #inicia loop para preenchimento da matriz
  for (j in 1:10) {
    symbols(x = j - 0.5, y = 10 - i + 0.5, circles = 0.46, inches = FALSE, #codigo para um circulo, sem uso do ggplot
            bg = cores[waffle_mat[i, j]], fg = "white", add = TRUE)
  }
}
legend("topright", legend = tipos, fill = cores, bty = "n") #adiciona legenda

