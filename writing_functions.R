# Writing functions 11-01-2022 ----

# if else
temp = -5

if (temp < 0) {
  print("It's freezing!")
  if (temp < 32) {
    print( "And kids don't go to school")
  }
} else {
  print("It's not freezing.")
}

## these can get bulky, so you can create a function to do this and be less bulky
## just running a function will give you the code that is used to actually perform the function

lm

# own function

checkweather <- function(x) {
  # x is temperature, degrees C
  if (x < 0) {
    print("It's freezing!")
    if (x < 32) {
      print( "And kids don't go to school")
    }
  } else {
    print("It's not freezing.")
  }
}

checkweather(50)
checkweather(-10)

# if we want the function to convert something 
## example: Celcius to F

checkweather <- function(x, verbose = FALSE) {
  # x is temperature, degrees C
  #verbose is logical value, indicating to print results
  if (FALSE) {
    x = 5
  }
  #xf <- 32 + 1.8*x
  #print(paste0("In Farenheit it is ", xf, "."))
  if (x < 0) {
    print("It's freezing!")
    if (x < 32) {
      if (verbose) {
        print( "And kids don't go to school")
      }
      
    }
  } else {
    if (verbose) {
      print("It's not freezing.")
      
    }
   
  }
  #return(xf)
  32 + 1.8*x
}

tempF = checkweather(50)
tempF

#How to check if a year is a leap year
# Year %% 4 and if not then it is not a leap year (usual year) and yes then it is a leap year
# if yes and indicates a leap year then it also has to be divisible by 100
## if it is divisible by 100 then it is not a leap year unless it is also divisible by 400

10 %% 3
x =9
(x %% 4) == 0

is.leap <- function(x) {
  if ((x %% 4) == 0) {
    return(TRUE)
  } else {
    return(FALSE)
  }
  if ((x/100) == 0) {
    return(TRUE)
  }else {
    return(FALSE)
  }
  if((x %% 400) == 0) {
    return(TRUE)
  } else {
    return(FALSE)
  }}

is.leap(2024)
is.leap(2023)      
is.leap(2020)
