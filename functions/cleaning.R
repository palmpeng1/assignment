## ---------------------------
##
## Script name: Cleaning.r
##
## Purpose of script: 
##      Cleaning up the raw penguin data set. 
##
## ---------------------------


#function to 'make sure the column names are 'clean' and uniform, such as lower case
clean_columns <- function(penguins_data) {
  penguins_data %>%
    clean_names()
}

#function to shorten the species names
shorten_species <- function(penguins_data) {
  penguins_data %>%
    mutate(species = case_when(
      species == "Adelie Penguin (Pygoscelis adeliae)" ~ "Adelie",
      species == "Chinstrap penguin (Pygoscelis antarctica)" ~ "Chinstrap",
      species == "Gentoo penguin (Pygoscelis papua)" ~ "Gentoo"
    ))
}


#function to remove empty columns or rows
remove_empty_columns_rows <- function(penguins_data) {
  penguins_data %>%
    remove_empty(c("rows", "cols"))
}


#function to subset the data based on the list of column names
subset_columns <- function(penguins_data, column_names) {
  penguins_data %>%
    select(all_of(column_names))
}


#function to remove rows which contain NA values
remove_NA <- function(penguins_data) {
  penguins_data %>%
    na.omit()
}
