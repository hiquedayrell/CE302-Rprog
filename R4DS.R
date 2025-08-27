library(tidyverse) #para instalar, utilizar install.packages("tidyverse"), toda vez que for usar, library(tidyverse)
ggplot2::mpg # ggplot2:: "chama a funcao gg plot", o mpg seria o conjunto de dados sobre veiculos

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) #displ = capacidade do motor, hwy = numero de milhas por galao na estrada
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cyl, y = hwy ))

#ggplot(data = <DATA>) + 
#<GEOM_FUNCTION>(mapping = aes(<MAPPINGS))
 
#teste de alterações