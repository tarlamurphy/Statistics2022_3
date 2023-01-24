## R Stats Project - Piero Zannini Class
## January 2023
## Global Change Ecology and Sustainable Development Goals
## Tarla Murphy, Lola Neuert, Emilija Zubac

# Measurement data of polar bears captured in the Chukchi and Southern Beaufort seas, 1981 - 2017

### Data
# Data is available from the Alaska Science Center at https://alaska.usgs.gov/products/data.php?dataid=315
# alternatively from data.world at https://data.world/us-doi-gov/581f789d-efa1-45db-a542-4812bed49004
# Data is made available by the Department of the Interior, US Government
# information on the methods used during capture and measurement can be found at 
# Rode, K.D., 2020, Measurement data of Polar Bears captured in the Chukchi and southern Beaufort Seas, 1981-2017
# U.S. Geological Survey data release, https://doi.org/10.5066/P9TVK3PX.

### Data Upload
# set working directory, eg. setwd("~/R_Stats")

# load requiring packages
library(ggplot2)
library(tidyverse)
library(GGally)

# load the dataset
polar <- read.csv("data/polar.csv", header = TRUE)

# take a first look at the dataset
glimpse(polar)

# originally the data contained 22 columns,of which a few held no data however, in 3174 rows
# the variables showed measurements of captured polarbears, including the collecting agency, 
# the population group, the date of capture, the BearID (some of the bears were captured multiple times througout the years),
# the bears sex, age, length (standard and total),
# the bears heart girth, skull width, tail length, mass, 
# a score that represents their physical condition
# the number of cubs that accompanied them when they were captured, the cubs age
# the bears gut fill, litter mass
# their fat amount, gut fill, snout length, resistence, body fat percentage (but all these contained no data)

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

# show a summary to see where NAs can be found in the dataset
# as well as look at some statistical parameters, including minimum value, 1st quantile, median, mean, 3rd quantile and maximum value
summary(polar1)

# remove NAs
# however the NAs in the cub column cannot simply be removed, as no cubs accompany male bears our young (immature) females
cubs_male30<- polar1$cubs %>% replace_na(30) # change male/young female NAs to 30 in the cubs column 
# (as this value is unrealistic and cannot be mistaken with any real cub count)

# now subset the columns without the old cubs column
polar2 <- subset(polar, select = c("agency", "population", "Date", "bearID", "sex", "age", 
                                "total_length", "standard_length", "mass", "heart", "skull"))
 # add in the new column with the NAs changed to 30
polar3 <- cbind(polar2, cubs_male30)

# now omit all NAs in the dataset
polar4 <- na.omit(polar3) 


### to do: 
#  - comment on data: what is the data set about and where does it come from? How many observations and variables are there? Which are the names and types of your variables? What do they represent? 
#  - clean data: removing NAs, changing columns’ names and/or types, creating new columns, removing unnecessary columns, filtering observations, creating additional data frames/matrices/lists/vectors
#  - do an EDA (explorative data analysis): calculate summary statistics of your variables and visualize their univariate and bivariate distributions
#  - formulate at least an hypothesis and test it. You should comment the results of your test(s) and say if your hypothesis is supported or not by your data.

### graphs ?
# histogram of average number of accompanying cubs per mature female
# what is the age of the females in correlation to their number of cubs
# function of age and length: show growing phase
# age distribution 
# skull width correlation to sex
# heart girth correlation to age and sex --> if we figure out how they measured the hearts
# mass correlation with sex

#  simple graphs
dens_age + dens_mass + dens_length +
  box_age + box_mass + box_length
  
dens_age <- polar4 %>% 
  ggplot() +
  geom_density(aes(x = age, fill = sex), color = "black", alpha = 0.3) +
  labs(title = "Polarbear age distribution for females & males", 
       subtitle = "Measurements from Chukchi and Southern Beaufort seas, 1981 - 2017", 
       x = "Age", y = " Density", fill = "Sex") +
  theme(panel.background = element_rect(fill = "white"))

dens_mass <- polar4 %>% 
  ggplot() +
  geom_density(aes(x = mass, fill = sex), color = "black", alpha = 0.3) + 
  labs(title = "Polarbear mass distribution for females & males", 
       subtitle = "Measurements from Chukchi and Southern Beaufort seas, 1981 - 2017", 
       x = "Mass (in kg)", y = " Density", fill = "Sex") +
  theme(panel.background = element_rect(fill = "white"))

dens_length <- polar4 %>% 
  ggplot() +
  geom_density(aes(x = total_length, fill = sex), color = "black", alpha = 0.3) +
  labs(title = "Polarbear length distribution for females and males", 
       subtitle = "Measurements from Chukchi and Southern Beaufort seas, 1981 - 2017", 
       x = "Total Length (in cm)", y = " Density", fill = "Sex") +
  theme(panel.background = element_rect(fill = "white"))

box_age <- polar4 %>% 
  ggplot() +
  geom_boxplot(aes(x = sex, y  = age)) +
  labs(title = "Polarbear age distribution for females and males", 
       subtitle = "Measurements from Chukchi and Southern Beaufort seas, 1981 - 2017", 
       x = "Sex", y = "Age (in years)") +
  theme(panel.background = element_rect(fill = "white"))

box_mass <- polar4 %>% 
  ggplot() +
  geom_boxplot(aes(x = sex, y  = mass)) +
  labs(title = "Polarbear mass distribution for females and males", 
       subtitle = "Measurements from Chukchi and Southern Beaufort seas, 1981 - 2017", 
       x = "Sex", y = "Mass (in kg)") +
  theme(panel.background = element_rect(fill = "white"))

box_length <- polar4 %>% 
  ggplot() +
  geom_boxplot(aes(x = sex, y  = total_length)) +
  labs(title = "Polarbear length distribution for females and males", 
       subtitle = "Measurements from Chukchi and Southern Beaufort seas, 1981 - 2017", 
       x = "Sex", y = "Length (in cm)") +
  theme(panel.background = element_rect(fill = "white"))

#geom_violin for sex correlating to total length but no numbers (better boxplot)
 polar4 %>% 
       ggplot(aes(x = sex, y = total_length)) +
       geom_violin()
  polar4 %>% 
       ggplot() +
       geom_violin(aes(x = sex, y = total_length, color = sex, fill = sex))


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


#density plot of age distribution in the whole population observed
> polar4 %>% 
+     ggplot() +
+     geom_density(aes(x = age))
#bar plot for age distribution in the whole population observed (prettier)
> polar4 %>% 
+     ggplot() +
+     geom_bar(aes(x = age))

#violin plot for age distirbution with males and with females
> polar4 %>% 
+     ggplot() +
+     geom_density(aes(x = age))
> polar4 %>% 
+     ggplot() +
+     geom_violin(aes(x = sex, y = age, color = sex, fill = sex))


# histogram of average number of accompanying cubs per mature female
install.packages("naniar")
library(naniar) # this package allows us to change values to nas

polar5 <- (polar4$cubs_male30[polar4$cubs_male30==30] <- "NA") # 30s in the cubs column are replaced with NAs

# histogram of average number of accompanying cubs per mature female
install.packages("naniar")
library(naniar) # this package allows us to change values to nas

polar5 <- (polar4$cubs_male30[polar4$cubs_male30==30] <- "NA") # set the 30s as NAs

library(dplyr) # needed for filtering

polar5 <- polar4 %>% 
  select(bearID, cubs_male30, age, total_length, standard_length, mass, heart, skull) %>%
  filter(cubs_male30 != "NA") # filter out the NAs so we only have rows for mature females

colnames(polar5)[2] <- "cubs" # change the column names for cubs

# create hypothesis

# our first hypothesis concerns the correlation between Total length of Polarbears and their Mass
# H0 is stated as: Total length and Mass are not positively correlated,
# and H1 is stated as: Total length and Mass are positively correlated
# to test this we use the function cor.test, and specify greater as the alternative
cor.test(polar4$total_length, polar4$mass, alternative = "greater")
# the Pearson's product-moment correlation shows a p-value of less than 0.05, meaning the correlation is significant
# the correlation value is 0.86, showing a strong positive correlation between length and mass of polarbears
# this means we can reject H0 and accept H1

# create plot to show correlation, with geom_smooth adding the correlation as a linear model??
ggplot(data = polar4) + 
  geom_point(aes(x = total_length, y = mass), alpha = 0.3) + 
  geom_smooth(aes(x = total_length, y = mass), method = "lm") +
  labs(title = "Polarbear length and mass correlation", 
       subtitle = "Measurements from Chukchi and Southern Beaufort seas, 1981 - 2017", 
       x = "Total Length (in cm)", y = "Mass (in kg)") +
  theme(panel.background = element_rect(fill = "white"))

# our second hypothesis tries to correlate the number of cubs in mature female polarbears with their mass
# H0 is stated as: there is no positive correlation between number of cubs and mass 
# H1 is stated as: there is a positive correlation between number of cubs and mass
# we again use function cor.test
cor.test(polar5$cubs, polar5$mass, alternative = "greater")
# this time the Pearson's correlation gave a p-value of 0.9
# as this is not smaller than 0.05, the test of correlation was not significant
# the correlation comes out to be -0.16
# we therefore can neither reject nor accept H1

# now we create a plot that shows the non-significant correlation
ggplot(data = polar5) + 
  geom_point(aes(x = cubs, y = mass), alpha = 0.3) + 
  geom_smooth(aes(x = cubs, y = mass), method = "lm") +
  labs(title = "Mature female Polarbears: correlation of number of cubs and mass", 
       subtitle = "Measurements from Chukchi and Southern Beaufort seas, 1981 - 2017", 
       x = "Number of cubs", y = "Mass (in kg)") +
  theme(panel.background = element_rect(fill = "white"))


