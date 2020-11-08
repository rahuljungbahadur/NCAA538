#
# This is a Plumber API. You can run the API by clicking
# the 'Run API' button above.
#
# Find out more about building APIs with Plumber here:
#
#    https://www.rplumber.io/
#

library(plumber)

#* @apiTitle Plumber Example API

#* Echo back the input
#* @param msg The message to echo
#* @get /echo
function(msg = "") {
    list(msg = paste0("The message is: '", msg, "'"))
}


#* Return the sum of two numbers
#* @param a The first number to add
#* @param b The second number to add
#* @post /sum
function(a, b) {
    as.numeric(a) + as.numeric(b)
}
fittedModel <- readRDS("E:\\TidyTuesdays\\NCAAWomensBasketball\\bestFitModel.rds")

#* retiurns the prediction based on the seed
#* @param newSeed THe seed on which the prediction is made
#* @get /predict
function(newSeed) {
  predict(fittedModel, new_data = tibble(seed = as.numeric(newSeed)))
}
