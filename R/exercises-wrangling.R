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

#filtering data by row
nhanes_small %>%
    filter(sex == "female")

