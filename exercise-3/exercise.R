# Exercise 3: working with built-in data sets

# Load R's "USPersonalExpenditure" dataset using the `data()` function
# This will produce a data frame called `USPersonalExpenditure`
data("USPersonalExpenditure")

# The variable `USPersonalExpenditure` is now accessible to you. Unfortunately,
# it's not a data frame (it's actually what is called a matrix)
# Test this using the `is.data.frame()` function
is.data.frame(USPersonalExpenditure)

# Luckily, you can pass the USPersonalExpenditure variable as an argument to the
# `data.frame()` function to convert it a data farm. Do this, storing the
# result in a new variable
us_personal_expenditure <- data.frame(USPersonalExpenditure)

# What are the column names of your dataframe?
View(us_personal_expenditure)
colnames(us_personal_expenditure, do.NULL = FALSE)

## Consider: why are they so strange? Think about whether you could use a number 
## like 1940 with dollar notation!

us_personal_expenditure$X1940

# What are the row names of your dataframe?
row_names <- rownames(us_personal_expenditure, do.NULL = FALSE)

# Add a column "category" to your data frame that contains the rownames
us_personal_expenditure$category <- row_names

# How much money was spent on personal care in 1940?
care_1940 <- us_personal_expenditure[4,1]

# How much money was spent on Food and Tobacco in 1960?
food_1960 <- us_personal_expenditure['Food and Tobacco', '1960']

# What was the highest expenditure category in 1960?
colMax(us_personal_expenditure, na.rm=FALSE, dims = 5)
highest_1960 <- us_personal_expenditure[us_personal_expenditure$X1960 == max(us_personal_expenditure$X1960)]

# Define a function `lowest_category` that takes in a year as a parameter, and
# returns the lowest spending category of that year

lowest_category <- function(year) {
  
}


lowest_category <- function(year) {
col <- paste0('X', year)
  us_personal_expenditure$category[us_personal_expenditure[, col] == min(us_personal_expenditure[, col])]
}
# Using your function, determine the lowest spending category of each year
# Hint: use the `sapply()` function to apply your function to a vector of years
all_years <- c("1940", "1945", "1950", "1955", "1960")
sapply(all_years, lowest_category)
