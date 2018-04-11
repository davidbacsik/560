# Introduction to R
# GENOME 560

################################
## Rstudio is a helpful GUI for R.  Much like iPython, it makes R easy to use in an interactive way.  Later, we will learn how to write scripts for R that, much like a Python script, can take command line arguments.  However, a unique advantage of R is that it is designed around being interactive.  I use Python to do most of my parsing and simple mathematical operations and then use R for more complex analyses (e.g. when a function is not available in SciPy or NumPy, etc) and for plotting.  

# The Rstudio GUI contains four panes, which enable you to write, edit and execute scripts; view the current environment and history; look at plots, built in help/man pages; and interact directly with the shell.

################################
## First things first - getting help
# R has a built-in help function that can bring up documentation on any function
?help  
?'+' 

# You can also search for any word (rather than just functions)
??help

################################
## Other places to get help
# http://cran.r-project.org/doc/manuals/r-release/R-intro.html
# http://www.cyclismo.org/tutorial/R/

################################
## R as a calculator

3^3
log10(100)
exp(4)

################################
# Creating objects and assigning values
# Objects are assigned using = or <-
# Note, R is case sensitive! x and X are different
# a scalar
x = 5
y = 2
x * y
z = "I_Heart_R"

# A vector is a one-dimensional array of data, and can be created with the concatenation function (c)
# Vectors must consist of the same type of data (i.e., numeric, character, logical)
x12 = c(10,6,8)
x12 * 10
people = c(seq(1,6,1))
blood.gp = c('A', 'B', 'AB', 'B', 'O', 'O')
sex = c( rep('M', 3), rep('F', 3) )
# What are seq and rep? 
?seq
?rep

# Specific elements of vectors (and other data types in R) can be accessed using subset notation.
# the first element of the vector people
people[1]
# elements 1 through 3 of the vector people
people[1:3]
# the second element of the vector blood.gp
blood.gp[2]
# subsetting can be used to reverse values
people[6:1]

# which() can be useful for finding elements with specific values.  other logical operators (e.g. <, >, in, etc) can be substituted, as can extant or user-defined functions that produce Boolean output
which(people == 3)

# Vectors can be bound together to create matrices (two-dimensional) assuming they have the same dimesions
dai = c(0,1,2,5,10,20)
pinf = c(0,0,0,5,25,80)
row.bind = rbind(dai,pinf)
col.bind = cbind(dai,pinf)

# accessing columns and rows
row.bind[1,1] # this gets the element in row 1 column 1
row.bind[,1] # this gets all elements in column 1
row.bind[1,] # this gets all elements in row 1


# Matrices can also be created using matrix()
m1 = matrix(1:9, byrow=T, ncol=3)
m2 = matrix(1:9, byrow=F, ncol=3)
m1[,1]
m1[,2]
m1[1,]

# Arrays are n-dimensional versions of vectors
z = rep(1,8)
a1 = array(1:8, dim = c(2,2,2))
a1
a1[1,1,1]
a1[1,1,]

# Lists are ordered collections of objects created using list(). Unlike vectors, there is no requirement for the objects to be of the same type.  
# Objects in lists are always numbered (e.g. each object has a numerical index assocaited with it).
# List objects can also be named, and named objects can be referred to using $
# The names associated with a list can be retrieved using names()
# List indexing is also a little different. [], the general subscripting operator, retrieves a sublist of the original list consisting of just the first entry (including the name) whereas [[]] retrieves the first object in the list (e.g. not a sublist, no name attached)
doe = list(name="john",age=28,married=F)
doe
names(doe)
doe[1]
doe[[1]]
doe$name

doe[2]
doe[[2]]
doe$age

# Another example
Lst = list(name="Fred", wife="Mary", no.children=3,  child.ages=c(4,7,9)) 
Lst$child.ages
Lst[4]
Lst[[4]]

# Lists can be concatenated using c()
concatenated = c(doe, Lst)
concatenated 

# Data frames are a useful object and can consist of vectors of mixed types arranged in a rectangular table 
# They are a special type of list.  Both columns and rows of a data frame are indexed and can be named, just like a list
# A dataframe is not just a table - the data frame is the central data structure in R and many functions are built around them
# See http://ww2.coastal.edu/kingw/statistics/R-tutorials/dataframes.html for more information.
df5 = data.frame(dai,pinf)
clinic.1 = data.frame(people, blood.gp, sex)
clinic.1$people
clinic.1$people[1:3]

# Useful functions for working with dataframes
dim(clinic.1)
str(clinic.1)
colnames(clinic.1)
attributes(clinic.1)
head(clinic.1)

# Recall above we made the character vector sex, consisting of M's and F's sex
# What if we wanted to just pull out the elements with an M?
which(clinic.1$sex == 'M')
blokes = which(clinic.1$sex == 'M')
blokes
clinic.1[blokes,]
# How would you get the sex of the female samples?

# All of the data types we've talked about so far are mutable, meaning that they can be modified dynamically. 
my.vector = c(seq(0,20,2))
my.vector
index = which(my.vector < 5)
my.vector[index]
my.vector[index] = my.vector[index] + .1
my.vector

################################
## Reading and writing files in R
# R supports both text and binary file IO, but we'll use text files that are delimited (e.g. where columns are separated) by tabs
# To read data from a file use read.table()
# Try filename.txt = RMA_Filtered.txt
data = read.table(header = T, file="http://www.cs.washington.edu/homes/suinlee/genome560/RMA_Filtered.txt")
?read.table

# To write data to a file use write.table()
write.table = write.table(data, file = "new_file.txt", row.names = F, quote = F, sep="\t")

# When using R interactively, you can find out what objects exist in your current session using ls()
ls()

# Removing an object
rm(blokes)

# Remove all objects
rm(list=ls())

# Saving all objects in the current session, allowing you to pick up where you left off.
save.image()

# quit R
q()