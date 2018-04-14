# Exercise 5: large data sets: Baby Name Popularity Over Time

# Read in the female baby names data file found in the `data` folder into a 
# variable called `names`. Remember to NOT treat the strings as factors!
names <- read.csv('data/female_names.csv', stringsAsFactors = F)

# Create a data frame `names_2013` that contains only the rows for the year 2013
View(names)
names_2013_1 <- names['year', 'year' == 2013] 
names_2013 <- data.frame(['names', 'year' == 2013])

names_2013 <- names[names$year == 2013, ]
# What was the most popular female name in 2013?
most_pop_2013 <- names_2013[names_2013$prop == max(names_2013$prop) , "name"]

# Write a function `most_popular_in_year` that takes in a year as a value and 
# returns the most popular name in that year
most_popular_in_year <- function(year) {
  names_in_year <- names[names$year == year, ]
  most_popular <- names_in_year[names_in_year$prop == max(names_in_year$prop) , ]
  return(most_popular[, "name"])
}

# What was the most popular female name in 1994?

most_popular_in_year(1994)
# Write a function `number_in_million` that takes in a name and a year, and 
# returns statistically how many babies out of 1 million born that year have 
# that name. 
# Hint: get the popularity percentage, and take that percentage out of 1 million.
number_in_million <- function(name, year) {
  specific_name_row <- names[names$name == name & names$year == year, ]
  probability <- specific_name_row$prop
  probability*1000000
}

# How many babies out of 1 million had the name 'Laura' in 1995?
number_in_million("Laura", 1995)

# How many babies out of 1 million had your name in the year you were born?


## Consider: what does this tell you about how easy it is to identify you with 
## just your name and birth year?
