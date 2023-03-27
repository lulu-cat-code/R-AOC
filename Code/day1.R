
getwd()
setwd( "/cloud/project/Data")

# ----
# Day 1 
# Part 1 - n opening parenthesis, (, means he should go up one floor, and a closing parenthesis, ), means he should go down one floor.
# To what floor do the instructions take Santa?


# Read Puzzle Input:
data =  read.delim(file = "Day1.txt",header=F)
class(data) # "data.frame"


if (!require("stringr")) install.packages("stringr")
library(stringr)


# Count left and right parenthesis:
left  = stringr::str_count(data$V1,"\\(")
right = stringr::str_count(data$V1,"\\)")

left-right # 232



# Part 2 - Now, given the same instructions, find the position of the first character 
# that causes him to enter the basement (floor -1). 

# Split string into substring and make a list of them
list = stringr::str_split(data$V1,'')[[1]]
# list[[1]] - "("


# Convert to Numeric Values [Up Floor = 1, Down Floor = -1]
  # Nested ifelse: if ( then 1, else then -1
list_num <- ifelse(list == "(", 1, 
                    ifelse(list == ")", -1, NA))

which(cumsum(list_num)==-1)

# First time of position
which(cumsum(list_num)==-1)[1] # 1783



# stringr cheet sheet: https://evoldyn.gitlab.io/evomics-2018/ref-sheets/R_strings.pdf

