library(tidyverse) #para instalar, utilizar install.packages("tidyverse"), toda vez que for usar, library(tidyverse)
ggplot2::mpg # ggplot2:: "chama a funcao gg plot", o mpg seria o conjunto de dados sobre veiculos

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = displ))+#displ = capacidade do motor, hwy = numero de milhas por galao na estrada
  facet_wrap(~class, nrow = 2)#facet wrap com a variavel class, cria uma visualizacao para cada classe

#ggplot(data = <DATA>) + 
#<GEOM_FUNCTION>(mapping = aes(<MAPPINGS))
 
#teste de alterações
nrow(mtcars)
?mtcars
ncol(mtcars)
?mpg
class(mpg)
?geom_point

vignette("ggplot2-specs")

