## LECTURE 1

print("hello world!")

5 %% 3 #the dividend - this gives the remainder from the division

5%/%3 # how many times 3 can go cleanly into 5 (called the .....?)

# when you want to comment like 10 lines of code or more, there is a shortcut
# select all the lines of code you want to remove, and then hashtag 
# ctrl + shift + c

# undo just the last thing you have done
# ctrl + z

# if an assignment is put in within parenthesis, in addition to assigning the variable you will see its contents
(tutor_name <- "arianna")

3 ** 4
#another way to write 3^4


#####################################
# LECTURE 2

# 4 basic data types

# logical values - true or false
TRUE # keyword recognised by r - changes colour - must be capitalised
# can also write as just
T 

# numerical values - Integer numbers (whole numbers) and all real numbers
1L 
# r wants you to tell it that this is an integer number - so you put uppercase L
typeof(1L)   # ask r what is the type 
# blank spaces like 1 L will return an error

typeof(1)    # comes out different - "double" - this means 'double precision', just a real number basically
typeof(3.14)

typeof(T)    # returns "logical"

# characters - you enclose them in quotes ""
# can be single letters, words or whole paragraphs
# can put words and numbers, but if they are in quotes r wont see them as numbers
"via irnerio 42"

typeof("via irnerio 42") #can check it

##

first_word <- "Bellis"  # assign a value to the variable
(second_word <- "perennis") # when the assignment is enclosed in quotes the value will be printed as well when you run the code


paste(first_word, second_word) # paste will stick values together

species_name <- paste(first_word, second_word) # we can store this code as a variable

species_name #returns the value stored in the variable

paste(species_name, "L.") # add another part to the species name. 

####

0.00005
# returns the number as 5e-05
5 * 10 ^ (-5) # can also be written like this


###Packages
#go to the packages tab
#on the top far left there is a tab called install
# type "vegan" to install the vegetation analysis package used often in ecology

# or use the function in r
install.packages("palmerpenguins") #data about penguins!

#to use them you now need to call them up and load them with library() function
library(palmerpenguins)  #once the package is installed you do not need to use quotes to load the package
?`palmerpenguins-package` # ? opens the help tab to explain what the package is

install.packages("dplyr") 

dplyr::select()   # the package name + :: symbols means you are using specifically the select function from the dplyr package
raster::select()  # in this case you are specifying you are using the select function from the raster package


###syntax errors

1 L # this gives a syntax error because there is an extra space so r cannot understand

greet <- "hello"
GREET # r is case sensitive so it doesnt understand greet vs GREET
# must type exactly right or r will not be able to find what you are looking for

paste(first_word second_word)  #this will also give an error because the comma between objects is missing
paste(first_word,,second_word) #will give an error too with extra commas
#syntax errors:
# spaces
# commas
# missing a parenthesis
# misspelling




###############################
# LECTURE 3

install.packages("tidyverse")

TRUE 
FALSE #must be uppercase in order to be recognised by r

library(vegan)

# ooperations
1<2

# smaller/greater than or equal to
2 <= 2
2 >= 3

# 2 equal signs test if they are equal - one equal sign is an assignment
2 == 2
2 != 2 # != is the negation sign, tests if the objects are different

# AND, OR or NOT
!TRUE # not true, so false
!FALSE # not false, so true

a <- 1
b <- 3

a < 3 && b < 4 # && is the AND symbolism. Both values must be true

a > 3 || b < 4 # if one, the other or both are true. For this to be false, both must be false

# negate an operation
!FALSE
a > 3 || b < 4
# if we want this to be the opposite
!(a > 3 || b < 4) # this is the negation, we obtain the opposite value

# Remember: priority between operators
# exponation has priority over multiplication and division
# but parenthesis has priority over this

(1 + 2) * 3 < a || b > 2 ** 3 / 2 
# first exponentiate the 2^3 = 8, so 8/2 = 4
# is b > 4 = FALSE
# is 3 + 3 = 6, greater than a? FALSE
# so the answer is, FALSE + FALSE, is FALSE

## Data Structures

#vectors, matrices, lists, and datasets

# operator to make a sequence
1:10 # makes a list from 1 - 10 with a step of 1 
# - a vector

10:1 # reverse vector

my_range <- 1:10
typeof(my_range)

# can also be done with
seq(from = 1, to = 15)

seq(from = 1, to = 15, by = 2) # can go in defferent steps

seq(from = 1, to = 10, length.out = 15) # from 1 to 10 with 15 elements evenly spaced

#create a vector by repeating a value/sequence a number of times
rep(1, times = 5)
rep(1:5, each = 5) # repeat each element 5 times

is_native <- c(TRUE, FALSE, TRUE) # this means combine
taxa <- c("plant", "bird", "mammal")
n_ind <- c(10L, 7L, 5L)
taxa_age <- c(2.11, 10.5, 68.8)

# vectors can only be measured in terms of length
length(taxa)
typeof(taxa)
class(taxa)

# assess the whole vector
taxa
# extract only the second element 
taxa[2] # square brackets signify the indice of the vector so you can extract it

# write a sequence from 2 - 4, then take the third value
vec <- 2:8
vec[3]

vec[c(1, 2, 4)] #extract the specific values you want

# extract elements using true and false

vec
my_logical <- c(T, F, T, F, T)
vec[my_logical] # extracts the elements that correspond to only true values held in the logical vector



#############################
# LECTURE 4

# indexing vectors

my_integer <- 1:12
length(my_integer)
int_len <- length(my_integer)

# the length of a vector corresponds to the index of the last variable

my_integer[int_len]

(int_len)  # makes a list starting from the list - 2

my_integer[(int_len- 2):int_len]


####

# modifying vectors

# combining assigning and indexing vectors

work_days <- c("monday", "tuesday", "wednesday", "thursday", "sunday")
work_days
work_days[5] <- "friday" # can modify the fifth element of the vector like this
work_days

scores <- c("good", "good", "n.c", "n.c", "excellent")
scores[3:4] <- "insufficient"
scores # the 2 elements we wanted to change are modified at once

scores <- c("good", "good", "n.c", "n.c", "excellent")
scores_to_fix <- c(FALSE, FALSE, TRUE, TRUE, FALSE)
scores[scores_to_fix] <- "insufficient"


my_integer <- 1:5
my_integer <- c(my_integer, 6:10) # adds the sequence 6 - 10 to the vector
# remember to reassign to save the vector

# removing elements

my_integer <- my_integer[-1] # keep doing this and it will keep applying in the same way
my_integer

my_integer[-(3:7)] # minus a selected range

#####

vec1 <- 0:2
vec2 <- 3:5

vec1 + vec2
vec1/vec2
vec1 * vec2
# operations are carried out element-wise

vec1 * 5 # multiplies all the elements by 5



plants <- c("Rosaceae" = 45L, "Fabaceae" = 30L, "Poaceae" = 56L)
plants["Rosaceae"]

names(plants)[2] # access the second element of the character vector
names(plants)[2] <- "Leguminosae"

names(plants) <- NULL #if you assign null to the names you will remove them.

plants



############
# LECTURE 5

c("hello", 3) # mixing types of variables - is called type conversion and r follows certain rules
#some types are stronger than others and some types are converted

# any data type can be a character, you just need to put it in quotes

# type coercion - character has more power

c(TRUE, FALSE) #if you dont want it to be logical, you want an integer
as.integer(c(TRUE, FALSE))

as.numeric((c(TRUE, FALSE)) # best not to use as it can be very ambiguous in r

                 
as.double(TRUE, FALSE),

# as.* is the family function

as.logical(c(-1, 0, 1, 2)), # if you transform numbers into logicals, 0 is false, all other numbers are true

as.logical("hello", "hi"), # results as NA, as we cannot transform these into logicals
           
as.numeric(c("1", "hello", "3.14")),

as.integer(c("1", "hello", "3.14")),

# is.*() transforms the elements
# is this value logical or a character

is.logical(c(TRUE, FALSE)),
is.integer(c(TRUE, FALSE)),
is.double(c(3.14, 2)) # using double is safer than numeric



######################
# LECTURE 6

# assignment

vec1 <- seq(5, -10, length.out = 1000)
length(vec1)
head(vec1)

length(vec1) == 1000 # is true

vec2 <- vec1[-((length(vec1) - 9):length(vec1))] # remove last ten elements so we have length 990
length(vec2)

length(vec2) == length(vec1) - 10

vec3 <- paste0(LETTERS[1:10], 1:10)
                       
typeof(vec3)


#########
# data structures

# vectors - one dimensional, homogenous 
# matrices - if we want to add another dimension

vec1 <- 1:9
m <- matrix(vec1, nrow=3)
m

m <- matrix(LETTERS[1:9], ncol = 3)
m

t(m) # t means transpose matrix

m <- matrix(LETTERS[1:9], ncol = 3, byrow=T) #automatically the data is filled by columns, so you have to specify
m

# can bind vectors together in a matrix
 
row1 <- 1:5
row2 <- 11:15
row3 <- 101:105

rbind(row1, row2, row3)
# this also titles the rows
# cbind will do the same thing but with columns

ncol(m) # shows the number of rows/columns

dim(m) #dimensions of the matrix , row,column

m[1,] # means extract just the first row
m[ ,1] # extracts just the first column

rownames["r1", ]es(m) <- c("r1", "r2", "r3")
m

m[, 3] <- 6 # access the third column and assign it a six

##################################

# LECTURE 7

# type testing - is.family function
# s.family funtion can explicitely change the type of the function


vec <- 1:9
vec

sum(vec)
m <- matrix(vec, nrow=3)
m
colnames(m) <- c("sp1", "sp2", "sp3") #assigns the colun names to m
rownames(m) <- c("cave1", "cave2", "cave3") # assigns the row names to m

m

colSums(m) # finds the sum of the columns
rowSums(m)

mean(m)
colMeans(m)
m
rowMeans(m)

sd(m) # standard deviation of the matrix

summary(m)

t(m) # transpose the matrix
summary(t(m)) # summarize the transposed matrix to see the quartiles, median, etc of different parts

vect <- c("tree", "grass", "forb", "grass")
vect
class(vect)
fct <- factor(vect)
fct # shows the levels of the vector

lev <- c("tree", "grass", "forb", "liana")
fct <- factor(vect, levels = lev) # change the levels through which we look at the data
fct

summary(fct) #this can show us we are missing a category
# if data is missing or there is an error, N/A will show

vec <- c("Low Temp", "High Temp", "Mid Temp", "Mid Temp", "Low Temp")
factor(vec)
# maybe you want your variables to have an intrinsic order recognised by r

factor(vec, ordered = TRUE)
# something strange
# alphabetical order

lev <- c("LoW Temp", "Mid Temp", "High Temp") # create the levels as you want them in order

factor(vec, levels = lev, ordered = TRUE)

levels(fct)

##lists

#inconsistency in definitions
# one dimensional or multidimensional

student <- "piero"
scores <- c(27, 29, 25, 30)
is_enrolled <- FALSE
my_list <- list(student, scores, is_enrolled)

my_list

class(my_list)
typeof(my_list)
str(my_list)

length(my_list)

list_names <- c("student", "scores", "enrollment")

list_names
my_list
names(my_list) <- list_names
my_list
str(my_list)


my_list <- list(student = student, scores = scores, enrollment = is_enrolled) # names = values
my_list

my_list[1]
class(my_list[[1]]) # must use double square brackets to check
# single square brackets extract a list - not the value contained in the component


my_list["student"] #extracting a list, not a component
my_list[["student"]] # gives the value

my_list[[c(2, 4)]] # this extracts the value of the fourth test within the second component


########################################

##LECTURE 8

# indexing lists

scores <- c(first_test = 26, second_test = 29, third_test = 25, fourth_test = 30)
is_enrolled <- FALSE

my_list <- list(student = student, scores = scores, enrollment = is_enrolled)

my_list[[1]] # two ways to extract the desired value
my_list$student

my_list[1:2]

my_list[[2]][1] # from the second vector extract the first value

my_list[[c(2, 1)]] 

str(my_list) # checks structure of the list

# modifying lists

my_list[["scores"]]["first_test"] <- 27

my_list[["course"]] <- "GCE" #create another component and assing a value

my_list$internship <- FALSE # can also do it like this

length(my_list) # the list has 5 components

my_list[[8]] <- "B2"
# because there is no 6 or 7, there is NULL before 8 - you could overwrite components or have extra components

my_list

names(my_list) # the 8th component has no name

names(my_list)[8] <- "english certification"
names(my_list) # always good to cross check

#removing list components
my_list[[6]] <- NULL
#another possibility is negative indices
# eg my_list[-6]

str(my_list)

# appending lists 

list1 <- list(a1 = 1:10, b1 = LETTERS[1:3])
list2 <- list(a2 = c(2.2, 3.1), b2 = c(FALSE, TRUE))

c(list1, list2)

list(list1, list2)
list(list1 = list1, list2 = list2)

str(list(list1 = list1, list2 = list2))

#dataframes

dat <- data.frame(a = 1:10, b = letters[1:10], c = rep(c(FALSE, TRUE), 5))
dat

dim(dat) #dimensions returns us the no. of rows and columns. Always rows then column

names(dat) <- c("col1", "col2", "col3")
dat

#indexing dataframes
dat[1, ] #extracts the first row - is in itself extracting a dataframe

dat[ , 1] #extracts the first column - just a vector

dat[["col2"]]
dat[, "col2"] # same
dat$col2

# modifying dataframes
# just like lists
dat$col4 <- LETTERS[1:10] #adds a new column

dat <- dat[, -3] #when something is assigned the change is permanent

dat_1 <- data.frame(genus = c("Silene", "Pinus"), has_flower = c(TRUE, FALSE), n = c(10, 2))
dat_2 <- data.frame(genus = "Malus", has_flower = TRUE, n = 1)

dat_3 <- rbind(dat_1, dat_2) #row bind the dataframes together

install.packages("palmerpenguins")
library(palmerpenguins)


############################

# LECTURE 9

# Data Visualization

library(tidyverse)

data(penguins)
head(penguins) # tibble? means it is a dataset formatted particularly to be easy to use

# fct means factor
# dbl is double

glimpse(penguins) #tidyverse function of summary

library(ggplot2)

penguins %>%  # this symbol specifies the dataset is "piped" into the ggplot function
  ggplot()

# functionally the same as
ggplot(penguins)

penguins %>%  # pipe penguins into ggplot
  ggplot(aes(x = flipper_length_mm,   #specifying the cartesian plane for the plot
             y = body_mass_g)) +
  geom_point() + #add some more layers
  labs(title = "Penguin Size, Palmer Station LTER", 
       subtitle = "Flipper length and body mass for Adelie, Chinstrap and Gentoo penguin", 
       x = "Flipper length (mm)", 
       y = "Body mass (g)") +
  theme(panel.background = element_rect(fill ="pink")) # if you fill it white it looks more professional

# must do these things to make a publication quality thesis ^^
# or you can use an already prepared theme

p <- penguins %>% 
ggplot(aes(x = flipper_length_mm,   #specifying the cartesian plane for the plot
           y = body_mass_g)) +
  geom_point() + #add some more layers
  labs(title = "Penguin Size, Palmer Station LTER", 
       subtitle = "Flipper length and body mass for Adelie, Chinstrap and Gentoo penguin", 
       x = "Flipper length (mm)", 
       y = "Body mass (g)") +
  theme_classic()

p + 
  geom_point(aes(color = species))+
  scale_color_manual(values = c("darkorange", "purple", "cyan4"), 
                     name = "Species")
# can use colour brewer theme
p + 
  geom_point(aes(color = species, shape = island))+
  scale_color_brewer(palette = "Set2", #PRGn
                     name = "Species")
  
##

penguins %>%
  ggplot()+
  geom_bar(aes(x = species))

penguins %>%
  ggplot()+
  geom_histogram(aes(x = body_mass_g), 
                 binwidth = 250)


##########

## LECTURE 10
#univariate distributions = bar charts, histograms, density functions

library(tidyverse)
library(palmerpenguins)

data("penguins")

penguins %>% # pipe this into the function
  ggplot() + 
  geom_histogram(aes(x = body_mass_g, #colour and other aesthetica added within the aesthetics function
                     fill = species), #colour controls just the colours of the borders - must use fill
                 binwidth = 250, 
                 color = "black") #if we want a black outline, the command goes outside the aes function

penguins %>%
  ggplot()+
  geom_density(aes(x = body_mass_g, # density function may be a nicer representation than a histogram
                   fill = species), 
               colour = "black", 
               alpha = 0.5) # alpha controls transparency
# now we can see the one behind


###  Bivariate distributions
# eg scatterplots and box and whisker plots

penguins %>%
  ggplot() +
  geom_boxplot(aes(x = species, y = flipper_length_mm, color = species))

## multipanel plots
# split into multiple plots according to a variable

p1 <- penguins %>%
  ggplot() +
  geom_boxplot(aes(x = species, y = flipper_length_mm, color = species)) +
  facet_wrap(vars(year, island)) # separates values out by year and by island

# exporting graphs
# using the export menu is not agood choice, images will be low res
# use functions in r

ggsave(filename = "boxplot.png",  #will always take  the last image
       plot = p1, 
       width = 7, #specifies the size in inches
       height = 7) 

# r studio projects
# using a project folder ensures reproduceability

# specifying working directories is using absolute paths
# using a project file is using a relative path, so you dont have to manually change it to use the code
