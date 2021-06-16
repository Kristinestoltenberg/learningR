#load the package
source(here::here("R/package-loading.R"))

#brief glimpse of the package
glimpse(NHANES)

usethis::use_r("exercises-wrangling")

#select one column by its name, without quotes
select(NHANES, Age)

# Select two or more columns by name, without quotes (remeber, you ca ntry quotationmarks if it dosent work)
select(NHANES, "Age", "Weight", "BMI")

# To *exclude* a column, use minus (-)
select(NHANES, -HeadCirc)

#select several columns together : all with BP
select(NHANES, starts_with("BP"))

#Select columns that end with a pattern.
select(NHANES, ends_with("Day"))

#Select columns that contain a pattern.
select(NHANES, contains("Age"))

#helper function
?select_helpers

# Save the selected columns as a new data frame
# Recall the style guide for naming objects
nhanes_small <- select(NHANES, Age, Gender, Height,
                       Weight, BMI, Diabetes, DiabetesAge,
                       PhysActiveDays, PhysActive, TotChol,
                       BPSysAve, BPDiaAve, SmokeNow, Poverty)

# View the new data frame
nhanes_small

view(nhanes_small)

#rename all columns to snake-case
nhanes_small <- rename_with(nhanes_small, snakecase::to_snake_case)

# View data frame
nhanes_small

#rename column
nhanes_small <- rename(nhanes_small, sex = gender)

# View data frame
nhanes_small

#changing functions with pipe - The keyboard shortcut for the pipe is Ctrl-Shift-M
# These two ways are the same
colnames(nhanes_small)
nhanes_small %>% colnames()

#Let’s try using the pipe with the select() and rename() functions from the previous section
nhanes_small %>%
    select(phys_active) %>%
    rename(physically_active = phys_active)

