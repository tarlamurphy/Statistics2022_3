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

polar <- read.csv("polar.csv", header = TRUE)
head(polar)

# Initial Data Clean-up

typeof(polar$Age) #result is character
typeof(polar$Total_Length) #appears that the variables are all characters

age <- as.double(polar$Age) # turn the variable from a character to an integer
length <- as.double(polar$Total_Length) # must assign it to an object
mass <- as.double(polar$Mass)
cubs <- as.double(polar$Number_of_cubs)
heart <- as.double(polar$Heart_Girth)
skull <- as.double(polar$Skull_Width)

# subset to remove excess columns
polar1 <- subset(polar, select = c("Collecting_Agency","Population", "BearID", "Sex", "Age", "Total_Length",
                 "Heart_Girth", "Skull_Width", "Mass", "Number_of_cubs"))

summary(polar1)
# 3174 entries
#hiiaa this is me
