################################################
## script que  plota  mapas em relevo       ####
##do Brasil                                 ####
##                                          ####
################################################


# 
setwd('/Users/imac-casa/Desktop/DataScience/8 R/evento_aula3')

source('scripts/mapa_relevo.R')

meu_mapa('SP')

for (i in c('SP','SC', 'MG')) {
  meu_mapa(i)
  ggsave(filename= paste0('figuras/',i,'.png')) 
}

