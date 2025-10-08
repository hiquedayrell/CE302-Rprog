library(pokemon)
dplyr::glimpse(pokemon)
pokemon
?pokemon
?pokemon_ptbr
library(tidyverse)
ggplot(data = pokemon_ptbr)+
  geom_point(mapping = aes(x = id_geracao, y = ataque))
pokemon$attack

pokemon_medio <- data.frame(
  hp = mean(pokemon_ptbr$hp),
  ataque = mean(pokemon_ptbr$ataque),
  defesa = mean(pokemon_ptbr$defesa),
  ataque_especial = mean(pokemon_ptbr$ataque_especial),
  defesa_especial = mean(pokemon_ptbr$defesa_especial),
  velocidade = mean(pokemon_ptbr$velocidade))
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

#graficos de peso x altura
ggplot(pokemon_ptbr, aes(x=peso, y =altura, color = tipo_1)) + 
  geom_point(size = 3, alpha = 0.7) +  
  labs(
    title = "Relação Peso x Altura dos Pokémon",
    x = "Peso (kg)",
    y = "Altura (m)",
    color = "Tipo"
  ) +
  theme_minimal(base_size = 14)+
  scale_fill_brewer(palette = "Set1") 

#pesos outliers
maxpeso <- max(pokemon_ptbr$peso)#consultando o nome do pokemon com maior peso
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
  
pokemon_ptbr[790,]
?ggplot



#boxplot
 ggplot(pokemon_ptbr, aes(x = tipo_1, y = ataque, fill = tipo_1)) +
  geom_boxplot(alpha = 0.7,
              outlier.color = "tomato", outlier.shape = 2) +
  theme_minimal()

 
 
 
 library(ggplot2)
 library(dplyr)
 
 tipo_cores <- c(
   "normal" = "#A8A878", "fogo" = "#F08030", "água" = "#6890F0",
   "grama" = "#78C850", "elétrico" = "#F8D030", "gelo" = "#98D8D8",
   "lutador" = "#C03028", "venenoso" = "#A040A0", "terrestre" = "#E0C068",
   "voador" = "#A890F0", "psíquico" = "#F85888", "inseto" = "#A8B820",
   "pedra" = "#B8A038", "fantasma" = "#705898", "dragão" = "#7038F8",
   "aço" = "#B8B8D0", "sombrio" = "#705848", "fada" = "#EE99AC"
 )
 
 pokemon_ptbr_ajustado <- pokemon_ptbr %>%
   mutate(tipo_1_limpo = tolower(trimws(tipo_1))) %>% 
   mutate(tipo_1 = factor(tipo_1_limpo, levels = names(tipo_cores))) %>% 
   filter(!is.na(tipo_1))
 
 ggplot(pokemon_ptbr_ajustado, aes(x = tipo_1, y = ataque, fill = tipo_1)) +
   
   # Adiciona uma expansão de 5% em ambos os lados do eixo Y
   scale_y_continuous(expand = expansion(mult = c(0.05, 0.05))) +
   
   geom_boxplot(
     alpha = 0.8,         
     color = "black",     
     outlier.shape = 4,   
     outlier.size = 2.5,  
     outlier.color = "red" 
   ) + 
   
   geom_jitter(
     shape = 1, 
     size = 1, 
     position = position_jitter(0.2), 
     alpha = 0.4, 
     color = "darkgrey"
   ) +
   
   scale_fill_manual(values = tipo_cores) +
   
   labs(
     title = "Distribuição do Ataque Base (ATK) por Tipo Primário de Pokémon",
     subtitle = "Box Plot com destaque para Pokémon Outliers (ATK superior ao esperado)",
     x = "Tipo Primário",
     y = "Ataque Base (ATK)"
   ) +
   
   theme_minimal(base_size = 14) +
   theme(
     plot.title = element_text(hjust = 0.5, face = "bold", margin = margin(b = 10)),
     plot.subtitle = element_text(hjust = 0.5, margin = margin(b = 15)),
     axis.text.x = element_text(angle = 45, hjust = 1, size = 11, face = "bold"),
     legend.position = "none",
     panel.grid.major.x = element_blank()
   )