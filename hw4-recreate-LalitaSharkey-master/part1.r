library(tidyverse)
library(ggplot2)
library(readxl)

p1_data <- read_excel("PolicyViz_MerrillLynchRemake.xlsx")
colnames(p1_data)[1]<-"Generations"
p1_data$Generations <- factor(p1_data$Generations, levels = p1_data$Generations)


#Create the blank plot 
g <- ggplot() 

#Add the grey lines 
g <- g +  geom_line(data = p1_data, aes(x = Generations, y = Pharmacies), color = "#d8d8d8", group=1, size=1.5)
g <- g +  geom_text(data = p1_data, aes(x = 4.32, y = 9.3, fontface=1, label = "Pharmacies"), color = "#bdbdbd", group=1, size=4.2)

g <- g +  geom_line(data = p1_data, aes(x = Generations, y = `Furniture/Building`), color = "#d8d8d8", group=1, size=1.5)
g <- g +  geom_text(data = p1_data, aes(x = 4.4285, y = 11.8, fontface=1, label = "Furniture/Building"), color = "#bdbdbd", group=1, size=4.2)

g <- g +  geom_line(data = p1_data, aes(x = Generations, y = `General/Misc`), color = "#d8d8d8", group=1, size=1.5)
g <- g +  geom_text(data = p1_data, aes(x = 4.33, y = 22.52, fontface=1, label = "General/Misc"), color = "#bdbdbd", group=1, size=4.2)

g <- g +  geom_line(data = p1_data, aes(x = Generations, y = Gasoline), color = "#edbe31", group=1, size=1.5) 
g <- g +  geom_point(data = p1_data, aes(x = Generations, y = Gasoline), color = "#edbe31", group=1, size=4) 
g <- g +  geom_point(data = p1_data, aes(x = Generations, y = Gasoline), color = "#ffffff", group=1, size=1.2) 
g <- g +  geom_text(data = p1_data, aes(x = 4.2553, y = 5.2, fontface=1, label = "Gasoline"), color = "#bdbdbd", group=1, size=4.2)

#Add the coluful lines
g <- g +  geom_line(data = p1_data, aes(x = Generations, y = `Elec/Hobbies/Clothing`), color = "#d8d8d8", group=1, size=1.5) 
g <- g +  geom_text(data = p1_data, aes(x = 4.56, y = 30.7, fontface=2, label = "Elec/Hobbies/Clothing"), color = "#7bb652", group=1, size=4.2) 

g <- g +  geom_line(data = p1_data, aes(x = Generations, y = Restaurants), color = "#5f9bd1", group=1, size=1.5)
g <- g +  geom_point(data = p1_data, aes(x = Generations, y = Restaurants), color = "#5f9bd1", group=1, size=4)
g <- g +  geom_point(data = p1_data, aes(x = Generations, y = Restaurants), color = "#ffffff", group=1, size=1.2)
g <- g +  geom_text(data = p1_data, aes(x = 4.35, y = 13.4, fontface=2, label = "Restaurants"), color = "#5f9bd1", group=1, size=4.2)

g <- g +  geom_line(data = p1_data, aes(x = Generations, y = Groceries), color = "#7bb652", group=1, size=1.5)
g <- g +  geom_point(data = p1_data, aes(x = Generations, y = Groceries), color = "#7bb652", group=1, size=4)
g <- g +  geom_point(data = p1_data, aes(x = Generations, y = Groceries), color = "#ffffff", group=1, size=1.2)
g <- g +  geom_text(data = p1_data, aes(x = 4.29, y = 6.6, fontface=2, label = "Groceries"), color = "#edbe31", group=1, size=4.2) 


# Modify plot styles
g <- g + annotate("text", x =5.09, y = 25, label = "") 
g <- g + annotate("text", x =.439, y = 35,fontface=2, color = "#838383", label = "%", size=4.1) 
g <- g + scale_y_continuous(breaks = c(seq(0, 35, by = 5)), limits = c(0, 35))
g <- g + theme(panel.background = element_rect(fill = "White",colour = "White", size = 0.5, linetype = "solid"),
               panel.grid.major.y = element_line(size = 1.1, linetype = 'solid',colour = "#f2f2f2"),
               axis.title.x = element_blank(),
               axis.title.y = element_blank(),
               axis.ticks = element_blank(),
               axis.text = element_text(face = "bold", color = "#838383", size = 13),
               plot.margin = margin(.5, 3, 3, 4, "mm"),
               plot.background = element_rect(fill = "white", colour = "#d8d8d8", size = 1))

g
