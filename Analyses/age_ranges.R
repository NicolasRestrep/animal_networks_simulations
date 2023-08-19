library(tidyverse)
library(igraph)

# Baboon Data
bab_w1_age <- read_rds("~/Documents/diffusion_animal_networks/Data/networks/bab_w1_age.rds")
bab_w2_age <- read_rds("~/Documents/diffusion_animal_networks/Data/networks/bab_w2_age.rds")
bab_w3_a_age <- read_rds("~/Documents/diffusion_animal_networks/Data/networks/bab_w3_a_age.rds")
bab_w3_b_age <- read_rds("~/Documents/diffusion_animal_networks/Data/networks/bab_w3_b_age.rds")
bab_w4_a_age <- read_rds("~/Documents/diffusion_animal_networks/Data/networks/bab_w4_a_age.rds")
bab_w4_b_age <- read_rds("~/Documents/diffusion_animal_networks/Data/networks/bab_w4_b_age.rds")
bab_new_age <- read_rds("~/Documents/diffusion_animal_networks/Data/networks/bab_new_age.rds")


# Dolphin Networks 
dolphin_w1 <- read_rds("~/Documents/diffusion_animal_networks/Data/networks/dolphin_w1.rds")
dolphin_w2 <- read_rds("~/Documents/diffusion_animal_networks/Data/networks/dolphin_w2.rds")
dolphin_w3 <- read_rds("~/Documents/diffusion_animal_networks/Data/networks/dolphin_w3.rds")
dolphin_w4 <- read_rds("~/Documents/diffusion_animal_networks/Data/networks/dolphin_w4.rds")
dolphin_w5 <- read_rds("~/Documents/diffusion_animal_networks/Data/networks/dolphin_w5.rds")
dolphin_w6 <- read_rds("~/Documents/diffusion_animal_networks/Data/networks/dolphin_w6.rds")

# Elephant Networks 
elph_w1_age <- read_rds("~/Documents/diffusion_animal_networks/Data/networks/elph_w1_age.rds")
elph_w2_age <- read_rds("~/Documents/diffusion_animal_networks/Data/networks/elph_w2_age.rds")
elph_w3_age <- read_rds("~/Documents/diffusion_animal_networks/Data/networks/elph_w3_age.rds")

all_networks <- list(dolphin_w1, 
                     dolphin_w2, 
                     dolphin_w3, 
                     dolphin_w4, 
                     dolphin_w5, 
                     dolphin_w6, 
                     bab_w1_age, 
                     bab_w2_age, 
                     bab_new_age,
                     bab_w3_a_age, 
                     bab_w3_b_age, 
                     bab_w4_a_age, 
                     bab_w4_b_age, 
                     elph_w1_age, 
                     elph_w2_age, 
                     elph_w3_age )

species_list <- c(rep("dolphin", 6), 
                  rep("baboon", 7),
                  rep("elephant", 3))

waves_list <- c(1:6,
                1:7,
                1:3)

for (a in 1:16) {
  if (a < 7){
    V(all_networks[[a]])$age <- round(V(all_networks[[a]])$age/365,1)
  }
  
  if (a >= 7 & a < 14){
    V(all_networks[[a]])$age <- round(V(all_networks[[a]])$age/365,1)
  }
  
  if (a == 14) {
    V(all_networks[[a]])$age <- (1999 - (2021 - V(all_networks[[a]])$age))
  } 
  
  if (a == 15){
     V(all_networks[[a]])$age <- (2002 - (2021 - V(all_networks[[a]])$age))
   }
  if (a == 16){
     V(all_networks[[a]])$age <- (2013 - (2021 - V(all_networks[[a]])$age))
   }
}

for (i in 1:16) {
  
  range(V(all_networks[[i]])$age)

  print(paste0(species_list[i], 
         " ", 
         waves_list[i], 
         ", range: ", 
         range(V(all_networks[[i]])$age)[1], 
         "-", 
         range(V(all_networks[[i]])$age)[2]))
}

