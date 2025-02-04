####prise en main / tests de graphiques####


##ggplot2
install.packages("ggplot2")
library(ggplot2)

CO2
names(CO2)

ggplot(CO2, aes(conc, uptake,
                colour = Treatment))+
  geom_point(size = 3, alpha = 0.5)+
  geom_smooth(color = "pink")

