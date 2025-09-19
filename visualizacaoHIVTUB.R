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


table(dados23$CS_SEXO)
table(dados23$ANO_NASC)
plot(dados23$ANO_NASC)


dados23$ANO_NASC <-  as.character(dados23$ANO_NASC)
dados23$ANO_NASC <-  as.numeric(dados23$ANO_NASC)#troca a classe dos dados de fator para numero
dados23$IDADE <- (dados23$ANO_NASC - 2023) *-1 #transforma o ano de nascimento em idade
dados23 <- subset(dados23, IDADE >= 0 & IDADE <= 100) #retira as idades negativas e superiores a 100 anos
table(dados23$IDADE)

dados23$faixa_etaria <- cut( #cria uma coluna de faixa etaria
  dados23$IDADE,
  breaks = c(0, 3, 12, 18, 40, 65, Inf),
  labels = c("Bebe (0-3)",
             "crianca (4-12,",
             "adolescente (13-18",
             "adulto (19-40",
             "meia-idade (41 - 65",
             "idoso ( 65+)")
)
table(dados23$faixa_etaria)

dados23$DIAGNOSTICO_HIV <- factor(dados23$HIV, #cria uma coluna nova que indica o resultado do exame trocando os numeros por caracteres
                          levels = c(1,2,3,4),
                          labels =c("Positivo", "Negativo", "Em andamento", "Nao realizado"))

table(dados23$DIAGNOSTICO_HIV)

install.packages("sunburstR")
library("sunburstR")
?sunburst
#variaveis de interesse, dados23$CS_SEXO, dados23$faixa etaria,  dados23$DIAGNOSTICO_HIV
w
