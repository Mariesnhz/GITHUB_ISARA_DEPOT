############################################################################
############################################################################
###################  ANALYSES - INDICATEURS  ###############################
############################################################################
############################################################################

## Date : 15/11/2024 
## Auteur : Sanchez Marie-Sarah

##########################################################################
########################### Fonction utiles ##############################
##########################################################################
install.packages("tidyverse")


library(tidyverse)
library(readxl)  # Pour lire les fichiers Excel

#%>% 
#|> 
#read_excel()
#select() avec start_with() par exemple
#filter()
#mutate()
#fct_recode()
#group_by_()
#summarise()
#left_join() right_join() inner_join() full_join()
#pivot_longer() pivot_wider()
# ...


##########################################################################
########################### Import #######################################
##########################################################################

Sites <- read_excel("Tidyverse/Sites.xlsx")
Microorga <- read_excel("Tidyverse/Microorganismes.xlsx")
Nematodes <- read_excel("Tidyverse/Nematodes.xlsx")
Vers <- read_excel("Tidyverse/Lombrics.xlsx")


glimpse(Sites)
glimpse(Microorga)
glimpse(Nematodes)
glimpse(Vers)el("data/Lombrics.xlsx")

##########################################################################
######################### Jointure de tables #############################
##########################################################################
########### CONSIGNE : Choisir deux communauté biologique ###########
Sites %>%
  inner_join(.,Microorga,join_by(ID)) %>%
  inner_join(.,Nematodes,join_by(ID)) -> SiteMN


##########################################################################
################## Sélection de lignes et colonnes ##################
##########################################################################
########### CONSIGNE : Choisir un site ###########

siteMN %>% 
  filter(SITE == "Feucherolles") %>%
  select(SITE:REPET_BLOC,ARGILE,contains("SABLE"),
         ends_with("MIN"),PHYTO : CARNI) -> feMN


##########################################################################
####################### Créer des variables ##################
##########################################################################
FeMN %>%
  mutate(Pphyto=(PHYTO/(PHYTO+BACT+FONG+OMNI+CARNI))*100)
View(FeMN2)

##########################################################################
############################## Calculs par groupe ########################
##########################################################################
########### CONSIGNE : calculs sur plusieurs variables en même temps######
FeMN2 %>%
  group_by(MODALITE_DESCR) %>%
  summarise(mean_Pp = mean(Pphyto), sd_Pp=sd(Pphyto))-> M_SD


##########################################################################
####################### Graphique ########################
##########################################################################
########### CONSIGNE : un graphique en modifiant l'ordre et en recodant des modalités


##########################################################################
######################## Pivots ##########################################
##########################################################################

#exemple de pivot wider
siteMN_Goth_var_resul %>%
  filter(VARIETE =="Ariane") -> siteMN_Goth_var_resul_AR
siteMN_Goth_var_resul_pvw <- siteMN_Goth_var_resul_AR %>% pivot_wider(names_from = Modalite, values_from = TD)


#exemple de pivot longer
SiteMN_Goth_var_resul_pvl <- pivot_longer(siteMN_Goth_var_resul, cols = starts_with("LIMON_"), values_to = "amount", names_to = "LIMON")

##########################################################################
####################### Enchaîner tous les traitements ###################
##########################################################################

