library(pokemon)
dplyr::glimpse(pokemon)
pokemon
?pokemon
?pokemon_ptbr
library(tidyverse)

#===============================================================================

#===========================================================================



library(ggplot2)
library(dplyr)
library(scales) 

tipo_cores <- c( #cria as cores de cada um dos tipos de pokemon
  "normal" = "#A8A878", "fogo" = "#F08030", "água" = "#6890F0",
  "grama" = "#78C850", "elétrico" = "#F8D030", "gelo" = "#98D8D8",
  "lutador" = "#C03028", "venenoso" = "#A040A0", "terrestre" = "#E0C068",
  "voador" = "#A890F0", "psíquico" = "#F85888", "inseto" = "#A8B820",
  "pedra" = "#B8A038", "fantasma" = "#705898", "dragão" = "#7038F8",
  "aço" = "#B8B8D0", "sombrio" = "#705848", "fada" = "#EE99AC"
)

pokemon_ptbr_ajustado <- pokemon_ptbr %>% #utiliza o dyplyr para ajustar os dados
  mutate(tipo_1_limpo = tolower(trimws(tipo_1))) %>% #ajusta os nomes dos tipos para nao ter problema na hora de aplicar as cores
  mutate(tipo_1 = factor(tipo_1_limpo, levels = names(tipo_cores))) %>% 
  filter(!is.na(tipo_1)) #remove NA

ggplot(pokemon_ptbr_ajustado, aes(x = tipo_1, y = ataque, fill = tipo_1)) + #utiliza a funcao geom boxplot do ggplot para fazer o grafico, tendo no eixo x o tipo e no y o ataque dos pokemons
  
  scale_y_continuous(expand = expansion(mult = c(0.05, 0.05))) + #ajusta o eixo, pois estava cortando os subtitulos
  
  geom_boxplot( #configura os boxplots com as cores, a transparencia e configurações do outlier
    alpha = 0.8,      
    color = "black",      
    outlier.shape = 4,    
    outlier.size = 2.5,  
    outlier.color = "red"  
  ) +  
  
  geom_jitter( #adiciona pontos nao colados no eixo x para mostrar a densidade real dos dados
    shape = 1,  
    size = 1,  
    position = position_jitter(0.2),  
    alpha = 0.4,  
    color = "darkgrey"
  ) +
  
  scale_fill_manual(values = tipo_cores) + #adiciona as cores
  
  labs( #adiciona legendas
    title = "Distribuição do Ataque Base (ATK) por Tipo Primário de Pokémon",
    x = "Tipo Primário",
    y = "Ataque Base (ATK)"
  ) +
  
  theme_minimal(base_size = 14) + #variacoes esteticas do tema
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", margin = margin(b = 10)),
    plot.subtitle = element_text(hjust = 0.5, margin = margin(b = 15)),
    axis.text.x = element_text(angle = 45, hjust = 1, size = 11, face = "bold"),
    legend.position = "none",
    panel.grid.major.x = element_blank(), #remove as linhas de fundo do gráfico
    
    panel.background = element_rect(fill = "#fffcf3", color = NA),
    plot.background = element_rect(fill = "#fffcf3", color = NA)
  )
 #==================================================================================
 

 library(fmsb)
 library(scales) 
 
 stats_colunas <- c("hp", "ataque", "defesa", "ataque_especial", "defesa_especial", "velocidade")
 rotulos_eixos <- c("HP", "Ataque", "Defesa", "Ataque Especial", "Defesa Especial", "Velocidade")
 
 pokemon_ptbr$BST <- rowSums(pokemon_ptbr[, stats_colunas])
 
 pokemon_mais_forte <- pokemon_ptbr[which.max(pokemon_ptbr$BST), ]
 nome_forte <- paste(pokemon_mais_forte$pokemon) 
 
 pokemon_mais_fraco <- pokemon_ptbr[which.min(pokemon_ptbr$BST), ]
 nome_fraco <- paste(pokemon_mais_fraco$pokemon) 
 
 pokemon_medio_stats <- data.frame(
   hp = mean(pokemon_ptbr$hp),
   ataque = mean(pokemon_ptbr$ataque),
   defesa = mean(pokemon_ptbr$defesa),
   ataque_especial = mean(pokemon_ptbr$ataque_especial),
   defesa_especial = mean(pokemon_ptbr$defesa_especial),
   velocidade = mean(pokemon_ptbr$velocidade)
 )
 
 data_forte <- pokemon_mais_forte[, stats_colunas]
 data_fraco <- pokemon_mais_fraco[, stats_colunas]
 
 max_values <- apply(pokemon_ptbr[, stats_colunas], 2, max)
 min_values <- apply(pokemon_ptbr[, stats_colunas], 2, min)
 
 radar_data <- rbind(
   max_values,
   min_values,
   pokemon_medio_stats,
   data_forte,
   data_fraco
 )
 
 rownames(radar_data) <- c("Max", "Min", "Média", nome_forte, nome_fraco)
 
 cores_poligono_borda <- c("#6A5ACD", "#228B22", "#FF4500")
 cores_poligono_preenchimento <- alpha(cores_poligono_borda, 0.15) 
 
 op <- par(mar = c(1, 1, 2, 1), bg = "#fffcf3") 
 
 radarchart(
   radar_data[c(1:2, 3:5), ], 
   axistype = 1,
   
   pcol = cores_poligono_borda,
   pfcol = cores_poligono_preenchimento,
   plwd = 2,
   plty = 1,
   

   cglcol = "#999999", 
   cglty = 1,
   axislabcol = "#333333", 
   caxislabels = seq(0, 250, 50),
   
   vlcex = 0.8,
   vlabels = rotulos_eixos,
   title = "Comparação de Stats: Média, Mais Forte e Mais Fraco"
 )
 
 legend(
   x = 1.3, y = 1.2,
   legend = c("Média", nome_forte, nome_fraco),
   bty = "n",
   pch = 20,
   col = cores_poligono_borda,
   text.col = "black",
   cex = 0.9,
   pt.cex = 1.5
 )
 
 par(op)
 
#=============================================================================
 
 