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

# remove NAs

cubs_male30<- polar1$cubs %>% replace_na(30) # change male NAs to 30 in the cubs column (as they obviously do not birth cubs)

polar2 <- subset(polar, select = c("agency", "population", "Date", "bearID", "sex", "age", 
                                "total_length", "standard_length", "mass", "heart", "skull")) # create a new subset deleting the old cubs column
polar3 <- cbind(polar2, cubs_male30) # add in the new column

polar4 <- na.omit(polar3) # omit all NAs
                         
summary(polar4) # now all NAs are gone

#  simple graphs

# simple graphs

# density plot sex vs age
polar4 %>% 
  ggplot() +
  geom_density(aes(x = age, fill = sex), color = "black", alpha = 0.3) +
  labs(title = "Polarbear age distribution for females and males", 
       subtitle = "Measurements from Chukchi and Southern Beaufort seas, 1981 - 2017", 
       x = "Age", y = " Density", fill = "Sex") +
  theme(panel.background = element_rect(fill = "white"))

# density plot sex vs mass
polar4 %>% 
  ggplot() +
  geom_density(aes(x = mass, fill = sex), color = "black", alpha = 0.3) + 
  labs(title = "Polarbear mass distribution for females and males", 
       subtitle = "Measurements from Chukchi and Southern Beaufort seas, 1981 - 2017", 
       x = "Mass (in kg)", y = " Density", fill = "Sex") +
  theme(panel.background = element_rect(fill = "white"))

# density plot sex vs total length
polar4 %>% 
  ggplot() +
  geom_density(aes(x = total_length, fill = sex), color = "black", alpha = 0.3) +
  labs(title = "Polarbear length distribution for females and males", 
       subtitle = "Measurements from Chukchi and Southern Beaufort seas, 1981 - 2017", 
       x = "Total Length", y = " Density", fill = "Sex") +
  theme(panel.background = element_rect(fill = "white"))

# boxplot sex vs age
polar4 %>% 
  ggplot() +
  geom_boxplot(aes(x = sex, y  = age)) +
  labs(title = "Polarbear age distribution for females and males", 
       subtitle = "Measurements from Chukchi and Southern Beaufort seas, 1981 - 2017", 
       x = "Sex", y = "Age (in years)") +
  theme(panel.background = element_rect(fill = "white"))

# boxplot sex vs mass
polar4 %>% 
  ggplot() +
  geom_boxplot(aes(x = sex, y  = mass)) +
  labs(title = "Polarbear mass distribution for females and males", 
       subtitle = "Measurements from Chukchi and Southern Beaufort seas, 1981 - 2017", 
       x = "Sex", y = "Mass (in kg)") +
  theme(panel.background = element_rect(fill = "white"))

# boxplot sex vs total length
polar4 %>% 
  ggplot() +
  geom_boxplot(aes(x = sex, y  = total_length)) +
  labs(title = "Polarbear length distribution for females and males", 
       subtitle = "Measurements from Chukchi and Southern Beaufort seas, 1981 - 2017", 
       x = "Sex", y = "Length (in cm)") +
  theme(panel.background = element_rect(fill = "white"))


# skull width correlation to sex
polar4 %>% 
   ggplot(aes(x = sex, y = skull)) +
   geom_boxplot()
polar4 %>% 
    ggplot() +
    geom_boxplot(aes(x = sex, y = skull, colour = sex))
 polar4 %>% 
    ggplot() +
    geom_boxplot(aes(x = sex, y = skull, fill = sex))
 polar4 %>% 
    ggplot() +
    geom_boxplot(aes(x = sex, y = skull, color = sex, fill = sex))
#geom_violin for sex corelating to total length but no numbers
 polar4 %>% 
       ggplot(aes(x = sex, y = total_length)) +
       geom_violin()
  polar4 %>% 
       ggplot() +
       geom_violin(aes(x = sex, y = total_length, color = sex, fill = sex))
### to do: 
#  - comment on data: what is the data set about and where does it come from? How many observations and variables are there? Which are the names and types of your variables? What do they represent? 
#  - clean data: removing NAs, changing columns’ names and/or types, creating new columns, removing unnecessary columns, filtering observations, creating additional data frames/matrices/lists/vectors
#  - do an EDA (explorative data analysis): calculate summary statistics of your variables and visualize their univariate and bivariate distributions
#  - formulate at least an hypothesis and test it. You should comment the results of your test(s) and say if your hypothesis is supported or not by your data.

### graphs: 
# histogram of average number of accompanying cubs per mature female
# what is the age of the females in correlation to their number of cubs
# function of age and length: show growing phase
# age distribution 
# skull width correlation to sex
# heart girth correlation to age and sex --> if we figure out how they measured the hearts
# mass correlation with sex
# 


# histogram of average number of accompanying cubs per mature female
install.packages("naniar")
library(naniar) # this package allows us to change values to nas

polar5 <- (polar4$cubs_male30[polar4$cubs_male30==30] <- "NA") # 30s in the cubs column are replaced with NAs

plot(polar4$cubs_male30)
