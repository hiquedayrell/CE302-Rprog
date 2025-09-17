devtools::install_github("danicat/read.dbc") 
require(read.dbc)
url <- "http://leg.ufpr.br/~ara/data/TUBEBR22.dbc"
download.file(url, destfile = "TUBEBR22.dbc", mode = "wb")
dados22 <- read.dbc("TUBEBR22.dbc")
dados22

url <- "http://leg.ufpr.br/~ara/data/TUBEBR23.dbc"
download.file(url, destfile = "TUBEBR23.dbc", mode = "wb")
dados23 <- read.dbc("TUBEBR23.dbc")
dados23

url <- "http://leg.ufpr.br/~ara/data/TUBEBR24.dbc"
download.file(url, destfile = "TUBEBR24.dbc", mode = "wb")
dados24 <- read.dbc("TUBEBR24.dbc")
dados24

sum(names(dados22) == names(dados24))
ncol(dados22)


dadosT=rbind(dados22, dados23, dados24)
dadosT
nrow(dadosT)
nas.por.variavel <- apply(is.na.data.frame(dadosT),2, sum)
nas.por.variavel #numeros de dados que estão faltando
proporcao.nas <- round(nas.por.variavel/nrow(dadosT), 2)
proporcao.nas
matriz <- matrix(c(1,2,3,4), byrow = TRUE nrow = 2, ncol = 2)
barplot(proporcao.nas[1:25], horiz = T, las = 2, cex.names = 0.6, xlab = "NA prop.")
barplot(proporcao.nas[26:50], horiz = T, las = 2, cex.names = 0.6, xlab = "NA prop.")
barplot(proporcao.nas[51:74], horiz = T, las = 2, cex.names = 0.6, xlab = "NA prop.")
barplot(proporcao.nas[75:97], horiz = T, las = 2, cex.names = 0.6, xlab = "NA prop.")
sort(proporcao.nas)

abaixo_10 <- proporcao.nas <0.1
names(dadosT)[proporcao.nas < 0.1]

table(dadosT$ANO_NASC)
table(dadosT$CS_SEXO)
plot(dadosT$ANO_NASC)
table(dadosT$HIV)

table(dados23$CS_SEXO)
table(dados23$ANO_NASC)
plot(dados23$ANO_NASC)

ref_ano <-2023