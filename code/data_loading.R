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


#
library(reshape2)
baseball <- read.table("./dataraw/Transpos.dat",
                       head = FALSE, col.names = 
                         c("Team", "Player", "Type", "Entry"))

baseball.m <- melt(baseball,
                   idvars = c("Team", "Player", "Type"),
                   measure.vars = "Entry")
head(baseball.m)


# Exercises

library(MASS)
data(birthwt)

# code the age of mother in years as less than 20, 20-35, or greater than 35
mother20 <- subset(birthwt, age <= 20)
mother35 <- subset(birthwt, age >= 35)
mother2035 <- subset(birthwt, age >=20 & age <= 35)

#count the number of normal or low birth weight births according to race, coded age, smoking status (smoke), and history of hypertension (ht)
m <- aggregate(cbind(age, race, smoke, ht) ~low, FUN = sum, data = birthwt)


#calculate the percent of each race, age, group, smoking status, and hypertension according to low or normal birth respectively?
prop.table(m)

# report the data using a flat table, with low as the column variable and the others as row variables
Low <- xtabs(low ~age+race+smoke+ht, data = birthwt)

ftable(Low, row.vars = c("age","race","smoke","ht"))






