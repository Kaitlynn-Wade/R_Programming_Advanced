# Data ----

worm <- read.table("./dataraw/worms.missing.txt", head =TRUE)
head(worm)
is.data.frame(worm)

worm[order(worm$Area), ]


tmp <- scan("./dataraw/Lengths.dat",
            what = list(Name = "", Family = "", Length = 0),
            na.string = ".")

marine <- as.data.frame(tmp)


marine[order(marine$Family, marine$Length), ]

## data.table ----

## tibble/dplyr ----

library(dplyr)
worm_tbl = as_tibble(worm)
head(worm_tbl)

#aggregating
marine %>%
 # arrange(Family, Length) %>%
  group_by(Family) %>%
  summarise(Length = mean(Length))

aggregate( Length ~ Family, data=marine, FUN = mean)


# merging

descriptions <- read.fwf("./dataraw/Chocolate.dat",
                         widths = c(4,10,46),
                         col.names = c("CodeNum", "Name", "Description"))

descriptions <- na.omit(descriptions)
sales <- read.table("./dataraw/chocsales.dat", header = FALSE,
                    col.names = c("CodeNum", "PiecesSold"))

x <- merge(sales,descriptions, all = TRUE)

#dplyr

x2 <- sales %>%
  full_join(descriptions, by = "CodeNum")

