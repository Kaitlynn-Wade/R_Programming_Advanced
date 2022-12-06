# Machine Leaning
## 12/06/2022

install.packages("keras")
install.packages("tensorflow")
library(keras)
library(tensorflow)
tensorflow::install_tensorflow(version = "2.7", force = TRUE, update = FALSE)
# When asked to install Miniconda, type Y in the Console and press Enter.



library(mlbench)
library(tidyselect)
library(tidyverse)
library(openssl)

#defining terms (think of a linear regression)
## link function is called active function
## intercept is called bias
## coefficient is called weight
## there can be hidden layers between input and output layers


# Data ----

data(BostonHousing)
dim(BostonHousing)
head(BostonHousing)
str(BostonHousing)

# Separate into training and testing (training will be 70% and testing will be 30%)
index <- sample(nrow(BostonHousing), nrow(BostonHousing) * 0.7, replace = FALSE)
Dtrain <- BostonHousing[index,]
Dtest <- BostonHousing[-index,]

X_train <- Dtrain %>%
  select(-chas) %>%
  select(-medv) %>%
  scale()


y_train <- Dtrain %>%
  select(medv) %>%
  scale()

X_test <- Dtest %>%
  select(-chas) %>%
  select(-medv) %>%
  scale()

y_test <- Dtest %>%
  select(medv) %>%
  scale()

# Model ----
model <- keras_model_sequential()
model %>%
  layer_dense(units = 30, activation = "relu") %>%
  layer_dropout(rate = 0.25) %>%
  layer_dense(units = 30, activation = "relu") %>%
  layer_dense(units = 1, activation = "linear")

model %>% compile(
  loss = "mean_squared_error",  # https://keras.io/api/losses/
  #optimizer = "adam"
  optimizer = optimizer_adam(learning_rate = 0.01, decay = 0)
)

history = model %>%
  fit(x = X_train, y = y_train,
    epochs = 50, batch_size = 20)

pred <- predict(model, X_test)
e <- y_test - pred
#RMSE
sqrt(mean(e^2))
#MAE
mean(abs(e))

# RF
library(ranger)
mrf <- range(y = y_train, x = X_train)
pred <- predict(mrf, X_test)$predictions
e <- y_test - pred
#RMSE
sqrt(mean(e^2))
#MAE
mean(abs(e))
