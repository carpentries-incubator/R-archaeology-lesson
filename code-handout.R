
### Creating objects in R

















### Challenge
##
## What are the values after each statement in the following?
##
## mass <- 47.5            # mass?
## age  <- 122             # age?
## mass <- mass * 2.0      # mass?
## age  <- age - 20        # age?
## mass_index <- mass/age  # mass_index?















### Vectors and data types





















## ## We’ve seen that atomic vectors can be of type character, numeric, integer, and
## ## logical. But what happens if we try to mix these types in a single
## ## vector?
## 
## ## What will happen in each of these examples? (hint: use `class()` to
## ## check the data type of your object)
## num_char <- c(1, 2, 3, "a")
## 
## num_logical <- c(1, 2, 3, TRUE)
## 
## char_logical <- c("a", "b", "c", TRUE)
## 
## tricky <- c(1, 2, 3, "4")
## 
## ## Why do you think it happens?
## 
## 
## ## How many values in `combined_logical` are `"TRUE"` (as a character) in the
## ## following example:
## combined_logical <- c(num_logical, char_logical)
## 
## ## You've probably noticed that objects of different types get
## ## converted into a single, shared type within a vector. In R, we call
## ## converting objects from one class into another class
## ## _coercion_. These conversions happen according to a hierarchy,
## ## whereby some types get preferentially coerced into other types. Can
## ## you draw a diagram that represents the hierarchy of how these data
## ## types are coerced?















### Challenge (optional)
##
## * Can you figure out why `"four" > "five"` returns `TRUE`?





heights <- c(63, 69, 60, 65, NA, 68, 61, 70, 61, 59, 64, 69, 63, 63, NA, 72, 65, 64, 70, 63, 65)

# 1.
heights_no_na <- heights[!is.na(heights)]
# or
heights_no_na <- na.omit(heights)
# or
heights_no_na <- heights[complete.cases(heights)]

# 2.
median(heights, na.rm = TRUE)

# 3.
heights_above_67 <- heights_no_na[heights_no_na > 67]
length(heights_above_67)

## ### Challenge
## 1. Using this vector of heights in inches, create a new vector with the NAs removed.
##
##    heights <- c(63, 69, 60, 65, NA, 68, 61, 70, 61, 59, 64, 69, 63, 63, NA, 72, 65, 64, 70, 63, 65)
##
## 2. Use the function `median()` to calculate the median of the `heights` vector.
##
## 3. Use R to figure out how many people in the set are taller than 67 inches.
### Loading the survey data

## download.file(url = "https://zenodo.org/record/6478181/files/ceramics_data.csv?download=1",
##               destfile = "data_raw/ceramics_data.csv")














## Challenge
## Based on the output of `str(surveys)`, can you answer the following questions?
##
## * What is the class of the object `surveys`?
## * How many rows and how many columns are in this object?



## Indexing and subsetting data frames









### Challenges:
###
### 1. Create a `data.frame` (`surveys_200`) containing only the
###    data in row 200 of the `surveys` dataset.
###
### 2. Notice how `nrow()` gave you the number of rows in a `data.frame`?
###
###      * Use that number to pull out just that last row in the data frame
###      * Compare that with what you see as the last row using `tail()` to make
###        sure it's meeting expectations.
###      * Pull out that last row using `nrow()` instead of the row number
###      * Create a new data frame object (`surveys_last`) from that last row
###
### 3. Use `nrow()` to extract the row that is in the middle of the
###    data frame. Store the content of this row in an object named
###    `surveys_middle`.
###
### 4. Combine `nrow()` with the `-` notation above to reproduce the behavior of
###    `head(surveys)`, keeping just the first through 6th rows of the surveys
###    dataset.


### Factors





diagnostic <- factor(c("rim", "base", "base", "rim"))







### Challenges:
###
### 1. Change the columns `manufacture_technique` and `decoration_type` in the `surveys` data frame into a
###    factor.
###
### 2. Using the functions you learned before, can you find out...
###
###      * How many artefacts were manufactured using a slab technique?
###      * How many different decoration types are in the `decoration_type` column?




year_fct <- factor(c(1990, 1983, 1977, 1998, 1990))
as.numeric(year_fct)               # Wrong! And there is no warning...
as.numeric(as.character(year_fct)) # Works...
as.numeric(levels(year_fct))[year_fct]    # The recommended way.

## bar plot of the number of females and males captured during the experiment:
plot(surveys$diagnostic)







## Challenges
##
## * Rename "base" and "rim" to "Base" and "Rim" respectively.
## * Now that we have renamed the factor level to "undetermined", can you recreate the
##   barplot such that "Unknown" is first (before "Base")



## ## Challenge:
## ##  There are a few mistakes in this hand-crafted `data.frame`,
## ##  can you spot and fix them? Don't hesitate to experiment!
## animal_data <- data.frame(
##       animal = c(dog, cat, sea cucumber, sea urchin),
##       feel = c("furry", "squishy", "spiny"),
##       weight = c(45, 8 1.1, 0.8)
##       )



## ## Challenge:
## ##   Can you predict the class for each of the columns in the following
## ##   example?
## ##   Check your guesses using `str(country_climate)`:
## ##   * Are they what you expected? Why? why not?
## ##   * What would you need to change to ensure that each column had the
## ##     accurate data type?
## country_climate <- data.frame(country = c("Canada", "Panama", "South Africa", "Australia"),
##                                climate = c("cold", "hot", "temperate", "hot/temperate"),
##                                temperature = c(10, 30, 18, "15"),
##                                northern_hemisphere = c(TRUE, TRUE, FALSE, "FALSE"),
##                                has_kangaroo = c(FALSE, FALSE, FALSE, 1))
## ## Pipes Challenge:
## ##  Using pipes, subset the data to include artefacts collected
## ##  before 1995, and retain the columns `year`, `diagnostic`, and `diameter.`











## ## Mutate Challenge:
## ##  Create a new data frame from the `surveys` data that meets the following
## ##  criteria: contains only the `period` column and a new column called
## ##  `length_cm` containing the `length` values converted to centimeters.
## ##  In this `length_cm` column, there are no `NA`s and all values are less
## ##  than 3.
## 
## ##  Hint: think about how the commands should be ordered to produce this data frame!































## ## Count Challenges:
## ##  1. How many artefacts were caught in each `recovery_method` surveyed?
## 
## ##  2. Use `group_by()` and `summarize()` to find the mean, min, and max
## ## length for each ceramic type (using `period`). Also add the number of
## ## observations (hint: see `?n`).
## 
## ##  3. What was the widest artefact measured in each year? Return the
## ##  columns `year`, `decoration_type`, `period`, and `diameter`.



















## ## Reshaping challenges
## 
## ## 1. Spread the `surveys` data frame with `year` as columns, `plot_id` as rows, and the number of decoration_types per plot as the values. You will need to summarize before reshaping, and use the function `n_distinct()` to get the number of unique decoration_types within a particular chunk of data. It's a powerful function! See `?n_distinct` for more.
## 
## ## 2. Now take that data frame and `gather()` it again, so each row is a unique `plot_id` by `year` combination.
## 
## ## 3. The `surveys` data set has two measurement columns: `length` and `diameter`. This makes it difficult to do things like look at the relationship between mean values of each measurement per year in different plot types. Let's walk through a common solution for this type of problem. First, use `gather()` to create a dataset where we have a key column called `measurement` and a `value` column that takes on the value of either `length` or `diameter`. *Hint*: You'll need to specify which columns are being gathered.
## 
## ## 4. With this new data set, calculate the average of each `measurement` in each `year` for each different `recovery_method`. Then `spread()` them into a data set with a column for `length` and `diameter`. *Hint*: You only need to specify the key and value columns for `spread()`.





## ### Create the dataset for exporting:
## ##  Start by removing observations for which the `period`, `diameter`,
## ##  `length`, or `diagnostic` data are missing:
## surveys_complete <- surveys %>%
##     filter(period != "",        # remove missing period
##            !is.na(diameter),                 # remove missing diameter
##            !is.na(length),        # remove missing length
##            diagnostic != "")                      # remove missing diagnostic
## 
## ##  Now remove rare ceramic_type in two steps. First, make a list of ceramic types which
## ##  appear at least 50 times in our dataset:
## ceramic_type_counts <- surveys_complete %>%
##     count(period) %>%
##     filter(n >= 50) %>%
##     select(period)
## 
## ##  Second, keep only those ceramic_type:
## surveys_complete <- surveys_complete %>%
##     filter(period %in% ceramic_type_counts$period)
### Data Visualization with ggplot2

















## install.packages("hexbin")
## library(hexbin)

## surveys_plot +
##  geom_hex()

## ### Challenge with hexbin
## ##
## ## To use the hexagonal binning with **`ggplot2`**, first install the `hexbin`
## ## package from CRAN:
## 
## install.packages("hexbin")
## library(hexbin)
## 
## ## Then use the `geom_hex()` function:
## 
## surveys_plot +
##     geom_hex()
## 
## ## What are the relative strengths and weaknesses of a hexagonal bin
## ## plot compared to a scatter plot?











## ### Challenge with scatter plot:
## ##
## ##  Use what you just learned to create a scatter plot of `diameter`
## ## over `period` with the plot types showing in different colors.
## ## Is this a good way to show this type of data?





## ## Challenge with boxplots:
## ##  Start with the boxplot we created:
## ggplot(data = surveys_complete, mapping = aes(x = period, y = diameter)) +
##   geom_boxplot(alpha = 0) +
##   geom_jitter(alpha = 0.3, color = "tomato")
## 
## ##  1. Replace the box plot with a violin plot; see `geom_violin()`.
## 
## ##  2. Represent diameter on the log10 scale; see `scale_y_log10()`.
## 
## ##  3. Create boxplot for `length` overlaid on a jitter layer.
## 
## ##  4. Add color to the data points on your boxplot according to the
## ##  plot from which the sample was taken (`plot_id`).
## ##  *Hint:* Check the class for `plot_id`. Consider changing the class
## ##  of `plot_id` from integer to factor. Why does this change how R
## ##  makes the graph?
## 





























## ### Plotting time series challenge:
## ##
## ##  Use what you just learned to create a plot that depicts how the
## ##  average diameter of each period changes through the years.
## 









## install.packages("patchwork")





## ### Final plotting challenge:
## ##  With all of this information in hand, please take another five
## ##  minutes to either improve one of the plots generated in this
## ##  exercise or create a beautiful graph of your own. Use the RStudio
## ##  ggplot2 cheat sheet for inspiration:
## ##  https://www.rstudio.com/wp-content/uploads/2015/08/ggplot2-cheatsheet.pdf
## SQL databases and R

## install.packages(c("dbplyr", "RSQLite"))



library(dplyr)
library(dbplyr)
ceramics <- DBI::dbConnect(RSQLite::SQLite(), "data_raw/ceramics_data.sqlite")

src_dbi(ceramics)

tbl(ceramics, sql("SELECT year, period, plot_id FROM surveys"))

surveys <- tbl(ceramics, "surveys")
surveys %>%
    select(year, period, plot_id)



















## with dplyr syntax
ceramic_types <- tbl(ceramics, "ceramic_types")

left_join(surveys, ceramic_types) %>%
  filter(manufacture_technique == "Rodent") %>%
  group_by(manufacture_technique, year, plot_id) %>%
  tally() %>%
  collect()

## with SQL syntax
query <- paste("
SELECT a.year, b.manufacture_technique,count(*) as count
FROM surveys a
JOIN ceramic_types b
ON a.period = b.period
AND b.manufacture_technique = 'Rodent'
GROUP BY b.manufacture_technique, a.year, a.plot_id",
sep = "" )

tbl(ceramics, sql(query))



### Challenge
## Write a query that returns the number of rodents observed in each
## plot in each year.

##  Hint: Connect to the ceramic_types table and write a query that joins
##  the ceramic_types and survey tables together to exclude all
##  non-rodents. The query should return counts of rodents by year.

## Optional: Write a query in SQL that will produce the same
## result. You can join multiple tables together using the following
## syntax where foreign key refers to your unique id (e.g.,
## `period`):

## SELECT table.col, table.col
## FROM table1 JOIN table2
## ON table1.key = table2.key
## JOIN table3 ON table2.key = table3.key


## ceramic_types <- tbl(ceramics, "ceramic_types")
## genus_counts <- left_join(surveys, plots) %>%
##   left_join(ceramic_types) %>%
##   filter(manufacture_technique == "Rodent") %>%
##   group_by(plot_type, decoration_type) %>%
##   tally() %>%
##   collect()

### Challenge

## Write a query that returns the total number of rodents in each
## decoration_type caught in the different recovery methods.

##  Hint: Write a query that joins the ceramic_types, plot, and survey
##  tables together.  The query should return counts of decoration_type by plot
##  type.



download.file("https://zenodo.org/record/6501593/files/ceramic_types.csv?download=1",
              "data_raw/ceramic_types.csv")
download.file("https://zenodo.org/record/6501593/files/surveys.csv?download=1",
              "data_raw/surveys.csv")
download.file("https://zenodo.org/record/6501593/files/plots.csv?download=1",
              "data_raw/plots.csv")
library(tidyverse)
ceramic_types <- read_csv("data_raw/ceramic_types.csv")
surveys <- read_csv("data_raw/surveys.csv")
plots <- read_csv("data_raw/plots.csv")

my_db_file <- "data/portal-database-output.sqlite"
my_db <- src_sqlite(my_db_file, create = TRUE)

my_db



### Challenge

## Add the remaining ceramic_types table to the my_db database and run some
## of your queries from earlier in the lesson to verify that you
## have faithfully recreated the ceramics database.
