10
source(here::here("R/package-loading.R"))

# Basics of R -------------------------------------------------------------


weight_kilos <- 100
weight_kilos
#character vector
c("a","b","c")
#Logic vector
c(TRUE, FALSE, FALSE)
#numeric vector
c(1, 5, 6)
#Factor vector
factor(c("low", "high", "medium", "high"))

head(C02)

#colum names
colnames(CO2)

#structure
str(CO2)

#summary statistics
summary(CO2)

# Object names
day_one  #remember snake case
name <- FALSE  # remember no functions or objects - name it descriptive
name <- 9

# Spacing
x[, 1] #spaces after the comma
x[, 1]
mean (x, na.rm = TRUE) #space after mean
mean (x, na.rm = TRUE)
height <- feet * 12 + inches
df$z  #dollarsign refer to a function
x <- 1:10 # keep one to ten together

# Indenting and brackets
if (y < 0 && debug) {
    message("Y is negative")
}
#there are established conventions for working in R - remember
# reformat code: ctrl+stift+a
