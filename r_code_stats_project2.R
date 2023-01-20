## R Stats Project - Piero Zannini Class
## January 2023
## Global Change Ecology and Sustainable Development Goals
## Tarla Murphy, Lola Neuert, Emilija Zubac

# Measurement data of polar bears captured in the Chukchi
# and Southern Beaufort seas, 1981 - 2017

### Data
# Data is available from the Alaska Science Center at https://alaska.usgs.gov/products/data.php?dataid=315
# alternatively from data.world at https://data.world/us-doi-gov/581f789d-efa1-45db-a542-4812bed49004
# Data is made available by the Department of the Interior, US Government

### Data Upload
# set working directory, eg. setwd("~/R_Stats")

# load requiring packages
library(ggplot2)
library(tidyverse)
library(GGally)

# load the dataset
polar <- read.csv("polarbear_data/CS_SB_PBearMeasurementData_1981_2017.csv", header = TRUE)

# take a first look at the dataset
glimpse(polar)
# originally data contains x variables and x observations
# what are the variables about?

# rename columns and change necessary data types
polar <- polar %>% 
rename(agency = Collecting_Agency , population = Population, bearID = BearID, sex = Sex,
       age = Age, total_length = Total_Length, standard_length = Standard_Length, mass = Mass, 
       cubs = Number_of_cubs, heart = Heart_Girth, skull = Skull_Width) %>% 
  mutate(age  = as.integer(age),
         total_length = as.double(total_length),
         standard_length = as.double(standard_length),
         mass = as.double(mass), cubs = as.integer(cubs), 
         heart = as.double(heart), skull = as.double(skull))

# create a subset of only the relevant columns
polar1 <- subset(polar, select = c("agency", "population", "Date", "bearID", "sex", "age", 
                                   "total_length", "standard_length", "mass", "cubs", "heart", "skull"))

summary(polar1)


### to do: 
#  - comment on data: what is the data set about and where does it come from? How many observations and variables are there? Which are the names and types of your variables? What do they represent? 
#  - clean data: removing NAs, changing columns’ names and/or types, creating new columns, removing unnecessary columns, filtering observations, creating additional data frames/matrices/lists/vectors
#  - do an EDA (explorative data analysis): calculate summary statistics of your variables and visualize their univariate and bivariate distributions
#  - formulate at least an hypothesis and test it. You should comment the results of your test(s) and say if your hypothesis is supported or not by your data.

### we have good data on heart


