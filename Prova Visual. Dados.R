library(pokemon)
dplyr::glimpse(pokemon)
pokemon
?pokemon
?pokemon_ptbr
library(tidyverse)
ggplot(data = pokemon_ptbr)+
  geom_point(mapping = aes(x = id_geracao, y = ataque))
pokemon$attack



library(fmsb)

dados <- rbind(
  max = c(150, 150, 150, 150, 150, 150),
  min = c(0, 0, 0, 0, 0, 0),
  pokemon_medio
)

radarchart(
  dados,
  axistype = 1,
  # Cores da área e da linha
  pcol = "darkblue",        
  pfcol = rgb(0, 0, 1, 0.3), 
  plwd = 3,                  
  plty = 1,                  
  # Grade
  cglcol = "grey",          
  cglty = 1,                  
  cglwd = 0.8,              
  axislabcol = "darkgrey",   
  caxislabels = seq(0, 200, 50),
  vlcex = 0.9,                
  title = "Pokémon Médio"
)


ggplot(pokemon_ptbr, aes(x=peso, y =altura, color = tipo_1)) + 
  geom_point(size = 3, alpha = 0.7) +  
  labs(
    title = "Relação Peso x Altura dos Pokémon",
    x = "Peso (kg)",
    y = "Altura (m)",
    color = "Tipo"
  ) +
  theme_minimal(base_size = 14)


maxpeso <- max(pokemon_ptbr$peso) #consultando o nome do pokemon com maior peso
indice_p <- which.max(pokemon_ptbr$peso)
pokemon_ptbr$pokemon[indice_p]

minpeso <- min(pokemon_ptbr$peso) #consultando o pokemon com menor peso
indice_pmin <- which.min(pokemon_ptbr$peso)
pokemon_ptbr$pokemon[indice_pmin]

maxaltura <- max(pokemon_ptbr$altura)#consultando o pokemon com maior altura
indice_a <- which.max(pokemon_ptbr$altura)
pokemon_ptbr$pokemon[indice_a]

minaltura <- min(pokemon_ptbr$altura) #consultando o pokemon com menora altura
indice_amin <- which.min(pokemon_ptbr$altura)
pokemon_ptbr$pokemon[indice_amin]




  
