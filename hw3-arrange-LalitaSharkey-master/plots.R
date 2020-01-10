MyData <- read.csv(file="merged.csv", header=TRUE, sep=",")

require(ggplot2)
library(tidyverse)


names(MyData)[names(MyData) == "ï..Date"] <- "Dates"
MyData$Dates <-  as.Date(MyData$Dates, "%m/%e/%Y")

g <- ggplot(MyData, aes(x=Dates, group= 1)) 
g <- g + scale_y_continuous(limits = c(0,110), breaks=seq(0,110,10), minor_breaks=seq(0,110,10))
g <- g + geom_line(aes(y=Men), colour="#4D79A8", size=2) + 
  geom_point(aes(y=Men), colour="#4D79A8", size=4) +
  geom_text(aes(y = Men[49]+7, x = Dates[49], label = "Men"), colour="#4D79A8", size = 6) + 
  geom_smooth(method = "lm", se=FALSE, color="#4D79A8", 
              aes(x = Dates, y = Men,group=1), size= 0.8, linetype = "dashed")
g <- g + geom_line(aes(y=Women), colour="#FA9FA6", size=2) + 
  geom_point(aes(y=Women),colour="#FA9FA6", size=4) +
  geom_text(aes(y = Women[49]-7, x = Dates[49], label = "Women"), colour="#FA9FA6", size = 6)  + 
  geom_smooth(method = "lm", se=FALSE, color="#FA9FA6", 
              aes(x = Dates, y = Women,group=1), size= 0.8, linetype = "dashed")
g <- g + theme_minimal()+theme_bw()
g <- g + scale_x_date(date_labels = "%b %d, %y", date_breaks = "1 day", date_minor_breaks = "1 day")
g <- g + theme(axis.text.x = element_text(angle = 90 , hjust = 1)) 
g <- g + labs(title = "The breakdown of women vs. men who were provided shelter each night", 
              x = "Date", y = "Value") 
g <- g + theme(plot.title = element_text(color = "black", size = 22, face = "bold", hjust = 0.5))

g

# create a new table with sum of male and female guests, group by church
men_data = aggregate(cbind(MyData$Men, MyData$Total.Guests),  by=list(Church=MyData$Church), FUN=sum)
women_data = aggregate(cbind(MyData$Women, MyData$Total.Guests),  by=list(Church=MyData$Church), FUN=sum)
men_data$Church = reorder(men_data$Church, men_data$V2)
women_data$Church = reorder(women_data$Church, women_data$V2)
men_data
men_data$Type = "Men"
women_data$Type = "Women"
new_data <- rbind(men_data, women_data)
new_data 
# drop na
new_data <- na.omit(new_data)

new_data

p <- ggplot(data= new_data, aes(y = new_data$V1, x = new_data$Church, fill = new_data$Type))
p <- p + geom_bar(stat = 'identity', width = 0.7) +theme_bw()
p <- p + coord_flip() + scale_fill_manual(values =c("#4D79A8", "#FA9FA6"), name = "Measure Names")
p <- p + geom_text(aes(new_data$Church, new_data$V2 + 10, label=new_data$V2), vjust=0, hjust = 0, size = 4) 
p <- p + scale_y_continuous(breaks=seq(0,850,50), minor_breaks=seq(0,850,50))
p <- p + theme(plot.title = element_text(color = "black", size = 19, face = "bold", hjust = 0.5))
p <- p + theme(axis.text.x = element_text(size = 12), axis.text.y = element_text(size = 12),
               axis.title.x = element_text(size = 14, face = "bold"), 
               axis.title.y = element_text(size = 14, face = "bold", angle = 0, vjust = 1))
               
p <- p + labs(title = "Number of guests were provided shelter by each church (or pair of churches)",
              x = "Church", y = "Number of Guests")
p

library(ggpubr)
require(ggplot2)
library(tidyverse)
MyData <- read.csv(file="merged.csv", header=TRUE, sep=",")

names(MyData)[names(MyData) == "ï..Date"] <- "Dates"
MyData$Dates <-  as.Date(MyData$Dates, "%m/%e/%Y")

MyData <- na.omit(MyData)

s <- ggplot(MyData, aes(x=Precipitation, y=Total.Demand, color=Church)) + theme_bw()
s <- s + geom_point(size = 4) + theme(legend.position = "none") 
s <- s + scale_color_manual(values=c("#47638A", "#D58D45", "#BD6265", "#73B6A5", 
                                    "#698F5C", "#E1D35D", "#937A90"))
s <- s + labs(title = "")
s <- s + theme(plot.title = element_text(color = "black", size = 22, face = "bold", hjust = 0.5))

s1  <- ggplot(MyData, aes(x=Temp.Low, y=Total.Demand, color=Church)) + theme_bw()
s1 <- s1 + geom_point(size = 4) + theme(legend.position = "none", axis.title.y=element_blank(),
                                  axis.text.y=element_blank(), axis.ticks.y=element_blank()) 
s1 <- s1 + scale_color_manual(values=c("#47638A", "#D58D45", "#BD6265", "#73B6A5", 
                                     "#698F5C", "#E1D35D", "#937A90"))
s1 <- s1 + labs(title = "")
s1 <- s1 + theme(plot.title = element_text(color = "black", size = 22, face = "bold", hjust = 0.5))

s2  <- ggplot(MyData, aes(x=Snow.Depth, y=Total.Demand, color=Church)) + theme_bw()
s2 <- s2 + geom_point(size = 4) + theme(legend.position = "none" , axis.title.y=element_blank(),
                                  axis.text.y=element_blank(), axis.ticks.y=element_blank())
s2 <- s2 + scale_color_manual(values=c("#47638A", "#D58D45", "#BD6265", "#73B6A5", 
                                     "#698F5C", "#E1D35D", "#937A90"))
s2 <- s2 + labs(title = "Relationship between demand for shelter and weather")
s2 <- s2 + theme(plot.title = element_text(color = "black", size = 22, face = "bold", hjust = 1))


s3  <- ggplot(MyData, aes(x=Snow, y=Total.Demand, color=Church)) 
s3 <- s3 + geom_point(size = 4) +theme_bw() + theme(axis.title.y=element_blank(),
                                axis.text.y=element_blank(), axis.ticks.y=element_blank())
s3 <- s3 + scale_color_manual(values=c("#47638A", "#D58D45", "#BD6265", "#73B6A5", 
                                     "#698F5C", "#E1D35D", "#937A90"))
s3 <- s3 + labs(title = "")
s3 <- s3 + theme(plot.title = element_text(color = "black", size = 22, face = "bold", hjust = 0.5))


ggarrange(s, s1, s2, s3, ncol = 4, nrow = 1, widths = c(0.6,0.5,0.5,1), heights = c(0.5,0.5,0.5,0.5))

