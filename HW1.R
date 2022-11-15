# Kaitlynn Wade

library(ggplot2)
library(dplyr)
library(tidyverse)
library(tidyr)




myplot <- function(data, title ="", xlab = "Time", ylab = "", color = "#00A9FF", plotmean = TRUE, na.rm = TRUE) {
    
  if (is.null(dim(data))) {
    stop(print("Only one numeric vector supplied"))
  }
  
 if (length(data) <= 1) {
 stop(print("Only one numeric vector supplied"))
 }
  
  dat <- as.data.frame(data)
  
  m1 <- apply(dat, 1, FUN = mean, na.rm = TRUE)
  m2 <- apply(dat, 1, FUN = quantile, na.rm = TRUE)
  m0.25 <- m2[2,]
  m0.50 <- m2[3,]
  m0.75 <- m2[4,]
  x <- as.numeric(row.names(dat))

  D1 <- ggplot(dat, aes(x = x))  +
    geom_line(aes(y = m0.50, color = "dark gray"), size = 2) +
    theme_classic() +
    labs(title = title) +
    xlab(xlab) +
    ylab(ylab) +
    geom_ribbon(aes(ymin = m0.25, ymax = m0.75), fill = color, alpha = 0.25) +
    theme( # remove the vertical grid lines
      panel.grid.major.x = element_blank() ,
      # explicitly set the horizontal lines (or they will disappear too)
      panel.grid.major.y = element_line( size = .1, color = "gray"),
      plot.title = element_text(face = "bold", hjust = 0.5, size = 24),
      axis.title = element_text(size = 18),
      axis.text = element_text(size = 14),
      legend.text = element_text(size = 18))
   
    
      if (plotmean == TRUE) {
       D1 + geom_line(aes(y = m1, color = "black"), size = 1.5)  +
          geom_point(aes(y = m1), size = 5, shape = 1, size = 1 ) +
          scale_color_manual(name = "",
            values = c("black" = "black", "dark gray" = "dark gray ", color  = color),
            labels = c("Average", "Median", "Q1 & Q3"))
      } else {
        D1 +  scale_color_manual(name = "",
          values = c("dark gray" = "dark gray", color = color),
          labels = c("Median", "Q1 & Q3")) 
      }
  
}


source("myplot_StudentName.R")

# Dataset for the source figure
ad <- read.csv("AD_cluster_3.csv")
rownames(ad) <- ad[, 1]
ad <- ad[, -1]

# Dataset in ts format
EuStockMarkets

# Dataset with missing values
ad_na <- ad
ad_na$CHOTF[ad$CHOTF == 0] <- NA

# Dataset of 1 time series (should give an error)
ts01 <- rnorm(100)
ts02 <- ts(ts01)
ts03 <- ad[, 1, drop = FALSE]

# Check the function
## 60 points: Should work in each case
myplot(ad)
myplot(EuStockMarkets)
myplot(as.data.frame(EuStockMarkets))
myplot(ad_na)

## 25 points: Consider changing the color and add/remove the line for the average
## (the arguments plotmean and color can be named differently by the student)
myplot(ad, plotmean = TRUE, color = "red")

## 15 points: Should not work (give an informative error in each case)
myplot(ts01)
myplot(ts02)
myplot(ts03)











