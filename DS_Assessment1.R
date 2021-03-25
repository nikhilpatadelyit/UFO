# File downloaded from BB and inserted into DF

# Question 1:
# Read the dataset and insert into DF
# Missing content replace with NA
ufo_data <- read.csv("ufo.csv", na = "")


# Question 2:
# View the structure of the DF
str(ufo_data)

# Display the first 15 rows from the DF
head(ufo_data, 15)

# Display the count of the entries present in the DF
NROW(ufo_data)


# Question 3:
# Convert current datetime (chr) variable to (date) variable
# currently using dd/mm/yyyy
converted_date <- as.Date(ufo_data$datetime, "%m/%d/%Y")
converted_date
# View the structure of the DF (chr is updated to date) for datetime var
str(converted_date)


# Question 4:
# Update the current datetime var wih new date variable
# in ufo DF
ufo_data$datetime <- converted_date

# View the structure of the updated DF
str(ufo_data)


# Question 5:
# Display the column names of the UFO Df
names(ufo_data)

# Modifying the variable names from the DF to a new names as shown below:
# duration..seconds.    to    DurationSeconds
# duration..hours.min.  to    DurationHrsMins
# date.posted           to    DatePosted
names(ufo_data)[6] <- "DurationSeconds"
names(ufo_data)[7] <- "DurationHrsMins"
names(ufo_data)[9] <- "DatePosted"

# Display the updated column names of the UFO Df
names(ufo_data)
# Thus the variable names are modified accordingly

# Question 6:
# Convert the var nanm for latitude to numeric using as.numeric
ufo_data$latitude <- as.numeric(ufo_data$latitude)

# View the structure of the DF with the updated variable
str(ufo_data)

# Question 7:
# Importing the libraries & mice package to show the missing values
install.packages("mice")
library(mice)

# Plotting the DF
md.pattern(ufo_data)

# Saved the plot generted to missingvars.png

# Importing the libraries & VIM package to show the missing values
#install.packages("VIM")
#library(VIM)

#missing_values <- aggr(ufo_data, prop = FALSE, numbers = TRUE)
# Show summary of the content of missing_values
summary(missing_values)

# Question 8:
# # Using the subset function
# Sorting the UFO DF firstly by shape and then by city
attach(ufo_data)
sorted_data <- ufo_data[order(shape, city),]
sorted_data

# Extracting the required columns
include_list <- names(sorted_data) %in% c("datetime", "city", "country", "shape")
include_list

# Update the sorted_data to new DF
sorted_ufo_data <- sorted_data[(include_list)]
sorted_ufo_data
str(sorted_ufo_data)

# Display the 15 entries from the DF
head(sorted_ufo_data, 15)

# Question 9:
attach(ufo_data)
# finding entries in the UFO data frame where the country 
# equals “gb” and the shape variable equals “disk”
ufo_gb_disk <- subset(ufo_data, country == 'gb'  & shape == 'disk', )
ufo_gb_disk

# Display the 15 entries from the DF
head(ufo_gb_disk, 15)

# Question 10:
# Save the modifeid files with the new names
write.csv(ufo_data, file = "modified_ufo.csv")
write.csv(ufo_gb_disk, file = "ufo_gb.csv")
write.csv(sorted_ufo_data, file = "sorted_ufo.csv")

# Finally Uploaded all the script in the GIT_HUB

























