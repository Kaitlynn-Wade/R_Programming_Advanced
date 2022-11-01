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
