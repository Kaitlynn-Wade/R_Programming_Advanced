
# Kaitlynn Wade

# This function plots a time series 

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

# the last line of the file
