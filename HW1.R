# Kaitlynn Wade

library(ggplot2)
library(dplyr)
?ggplot
data = EuStockMarkets

d <- ts(data)

if (class(d) == "numeric") {
  print("warning! only numeric vector is supplied")
}else{ 
    print("")}



myplot <- function(data, title, col, plotmean = TRUE) {
  if(is.numeric(class(data)) {
    print(class(data))
    stop("class can not be numeric")
  } }
 # ggplot(data, col = col)+
  #  ggtitle(title = title )


myplot(d)
myplot(as.numeric(EuStockMarkets))



library(ggplot2)
library(lubridate)
library(tidyverse)
library(tidyr)



myplot <- function(x,y,title, xlab, ylab) {
    ggplot(data, aes(x = Year))+
    geom_line(aes(y = y), color = "black")+
    geom_point(aes(y = y), size = 5, shape = 1)+
    geom_line(aes(y = quantile(y, 0.50)), color = "gray")+
    theme_classic()+
    labs(title = title)+
    xlab(xlab)+
    ylab(ylab)+
    geom_ribbon(aes(ymin = quantile(y, 0.25), ymax = quantile(y,0.75)), fill = "light blue", alpha = 0.75)+
    theme( # remove the vertical grid lines
      panel.grid.major.x = element_blank() ,
      # explicitly set the horizontal lines (or they will disappear too)
      panel.grid.major.y = element_line( size=.1, color="gray"),
      plot.title = element_text(face = "bold", hjust = 0.5, size = 24),
      axis.title = element_text(size = 18),
      axis.text = element_text(size = 14))+
    ylim(-80,0)+
    xlim(1985,2015)
  
}


data <- AD_cluster_3[,1:2]

myplot(ad.na$Year,ad.na$CHOTF, title = "Cluster 3", ylab = "Attainment deficit %", xlab = "Year")

ad.na <- data
ad.na$CHOTF[data$CHOTF == 0] <- NA















