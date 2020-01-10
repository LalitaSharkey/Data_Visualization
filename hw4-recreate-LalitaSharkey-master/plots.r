library(tidyverse)
library(ggplot2)
library(readxl)

p1_data <- read_excel("PolicyViz_MerrillLynchRemake.xlsx")
colnames(p1_data)[1]<-"Generations"
p1_data$Generations <- factor(p1_data$Generations, levels = p1_data$Generations)


#Create the blank plot 
g <- ggplot() 

#Add the grey lines 
g <- g +  geom_line(data = p1_data, aes(x = Generations, y = Pharmacies), color = "#d8d8d8", group=1, size=1.2)
g <- g +  geom_text(data = p1_data, aes(x = 4.1, y = 9.3, fontface=1, label = "Pharmacies"), color = "#bdbdbd", group=1, size=4.3, hjust = 0)

g <- g +  geom_line(data = p1_data, aes(x = Generations, y = `Furniture/Building`), color = "#d8d8d8", group=1, size=1.2)
g <- g +  geom_text(data = p1_data, aes(x = 4.1, y = 11.8, fontface=1, label = "Furniture/Building"), color = "#bdbdbd", group=1, size=4.3, hjust = 0)

g <- g +  geom_line(data = p1_data, aes(x = Generations, y = `General/Misc`), color = "#d8d8d8", group=1, size=1.2)
g <- g +  geom_text(data = p1_data, aes(x = 4.1, y = 22.52, fontface=1, label = "General/Misc"), color = "#bdbdbd", group=1, size=4.3, hjust = 0)

g <- g +  geom_line(data = p1_data, aes(x = Generations, y = Gasoline), color = "#FCB918", group=1, size=1.2) 
g <- g +   geom_point(data = p1_data, aes(x = Generations, y = Gasoline), color = "#FCB918", group=1, size=2.3, shape = 21, stroke = 2, fill = 'white') 
g <- g +  geom_text(data = p1_data, aes(x = 4.1, y = 5.2, fontface=1, label = "Gasoline"), color = "#bdbdbd", group=1, size=4.3, hjust = 0)

#Add the coluful lines
g <- g +  geom_line(data = p1_data, aes(x = Generations, y = `Elec/Hobbies/Clothing`), color = "#d8d8d8", group=1, size=1.2) 
g <- g +  geom_text(data = p1_data, aes(x = 4.1, y = 30.7, fontface=1.9, label = "Elec/Hobbies/Clothing"), color = "#55B748", group=1, size=4.25, hjust = 0) 

g <- g +  geom_line(data = p1_data, aes(x = Generations, y = Restaurants), color = "#1896D3", group=1, size=1.2)
g <- g +  geom_point(data = p1_data, aes(x = Generations, y = Restaurants), color = "#1896D3", group=1, size=2.3, shape = 21, stroke = 2, fill = 'white')
g <- g +  geom_text(data = p1_data, aes(x = 4.1, y = 13.4, fontface=1.9, label = "Restaurants"), color = "#1896D3", group=1, size=4.25, hjust = 0)

g <- g +  geom_line(data = p1_data, aes(x = Generations, y = Groceries), color = "#55B748", group=1, size=1.2)
g <- g +  geom_point(data = p1_data, aes(x = Generations, y = Groceries), color = "#55B748", group=1, size=2.3, shape = 21, stroke = 2, fill = 'white')
g <- g +  geom_text(data = p1_data, aes(x = 4.1, y = 6.6, fontface=1.9, label = "Groceries"), color = "#FCB918", group=1, size=4.25, hjust = 0) 


# Modify plot styles
g <- g + annotate("text", x =5.09, y = 25, label = "") 
g <- g + annotate("text", x =.439, y = 35,fontface=2, color = "#838383", label = "%", size=4.1) 
g <- g + scale_y_continuous(breaks = c(seq(0, 35, by = 5)), limits = c(0, 35))
g <- g + theme(panel.background = element_rect(fill = "White",colour = "White", size = 0.5, linetype = "solid"),
               panel.grid.major.y = element_line(size = 1.0, linetype = 'solid',colour = "#f2f2f2"),
               axis.title.x = element_blank(),
               axis.title.y = element_blank(),
               axis.ticks = element_blank(),
               axis.text = element_text(face = "bold", color = "#838383", size = 13),
               plot.margin = margin(.3, 3, 4, 4, "mm"),
               plot.background = element_rect(fill = "white", colour = "#d8d8d8", size = 1))

g
