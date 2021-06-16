# Load the packages
source(here::here("R/package-loading.R"))

# Check column names
colnames(NHANES)

# Look at contents
str(NHANES)
glimpse(NHANES)

# See summary
summary(NHANES)

# Look over the dataset documentation
?NHANES

#9.9 Exercise: Practice what we’ve learned
#Tip: Recall that renaming is in the form new = old
nhanes_small %>%
    select(tot_chol, bp_sys_ave, poverty)

nhanes_small %>%
    rename(diabetes_diagnosis_age = diabetes_age)

nhanes_small %>%
    select(bmi, contains("age"))

physical_activity <- select(nhanes_small, phys_active_days, phys_active)
rename(physical_activity, days_phys_active = phys_active_days)

nhanes_small %>%
    select(phys_active_days, phys_active) %>%
    rename(days_phys_active = phys_active_days)

#9.10 filtering data by row
nhanes_small %>%
    filter(sex == "female")
nhanes_small %>%
    filter(sex != "female")

#filtering by BMI equals 25
nhanes_small %>%
    filter(bmi == 25)

# BMI on 25 or larger
nhanes_small %>%
    filter(bmi >= 25)

## When BMI is 25 and larger AND sex is female
nhanes_small %>%
    filter(bmi >= 25 & sex == "female")

# When BMI is above 25 OR sex is female
nhanes_small %>%
    filter(bmi > 25 | sex == "female")

# Arranging data by age in ascending order
nhanes_small %>%
    arrange(age)

# Arranging data by sex (happens alphabetical order, so females first)
nhanes_small %>%
    arrange(sex)

# Arranging data by age in descending order
nhanes_small %>%
    arrange(desc(age))

# Arranging data by sex then age in ascending order
nhanes_small %>%
    arrange(sex, age)

#test with decending sex and age in ascending
nhanes_small %>%
    arrange(desc(sex), age)

#9.12 Transform or add columns
#transform hight cm into meters

nhanes_small %>%
    mutate(height = height / 100)

#We can also create a new column (e.g., log transforming height):

nhanes_small %>%
    mutate(logged_height = log(height))

#add multiple modifications or additions with mutate() by separating them with ,

nhanes_small %>%
    mutate(height = height / 100,
           logged_height = log(height))

#We can also have different values based on logic conditions using if_else().

nhanes_small %>%
    mutate(heighly_active = if_else(phys_active_days >= 5, "yes", "no"))

#Recall that the original dataset doesn’t change. If we want the added variable to be saved, we must assign it to something with <-

nhanes_update <- nhanes_small %>%
    mutate(height = height / 100,
           logged_height = log(height),
           if_else(phys_active_days >= 5, "yes", "no"))

str(nhanes_update)

#9.14 Split-apply-combine: Summarizing data - summary statistics
#Let’s calculate the maximum value of the BMI variable
nhanes_small %>%
    summarise(max_bmi = max(bmi))

#NA betyder missing value

nhanes_small %>%
    summarise(max_bmi = max(bmi, na.rm = TRUE))

# calculate missing values
nhanes_small %>%
    summarise(sum.na = sum(is.na(bmi)))

#Se på output efter kørsel af denne og se på NA under hver kolonne
summary(nhanes_small)

#To calculate another summary statistic, you would add another summary column using ,
nhanes_small %>%
    summarise(max_bmi = max(bmi, na.rm = TRUE),
              min_bmi = min(bmi, na.rm = TRUE))

#9.16 Exercise: Calculate some basic statistics
# 1.
nhanes_small %>%
    summarise(mean_weight = mean(weight, na.rm = TRUE),
              mean_age = mean(age, na.rm =TRUE))

# 2.
nhanes_small %>%
    summarise(max_height = max(height, na.rm = TRUE),
              min_height = min(height, na.rm = TRUE))

# 3.
nhanes_small %>%
    summarise(median_age = median(age, na.rm = TRUE),
                 median_phys_active_days = median(phys_active_days, na.rm = TRUE))

#9.17 Summary statistics by a group
#Let’s use these functions to find out the mean age and BMI between those with and without diabetes
nhanes_small %>%
    group_by(diabetes) %>%
    summarise(mean_age = mean(age, na.rm = TRUE),
              mean_bmi = mean(bmi, na.rm = TRUE))

#get rid of NA (missing answer)
# Recall ! means "NOT", so !is.na means "is not missing"
nhanes_small %>%
    filter(!is.na(diabetes)) %>%
    group_by(diabetes) %>%
    summarise(mean_age = mean(age, na.rm = TRUE),
              mean_bmi = mean(bmi, na.rm = TRUE))

#Since we don’t need the dataset grouped anymore, it’s good practice to end the grouping with ungroup().
nhanes_small %>%
    filter(!is.na(diabetes)) %>%
    group_by(diabetes, sex) %>%
    summarise(mean_age = mean(age, na.rm = TRUE),
              mean_bmi = mean(bmi, na.rm = TRUE)) %>%
    ungroup()
