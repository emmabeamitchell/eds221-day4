

#nested for loops ----
file_prefix <- c("temp", "ph", "salinity")
file_suffix <- c(1, 2, 3, 4)


for (i in 1:length(file_prefix)) {
 for (j in 1:length(file_suffix)) {
   print(paste0(file_prefix[i], "_", file_suffix[j]))
 }
}

#another nested for loops example 

odds <- c(1, 3, 5)
evens <- c(2,4,6,8)

for (i in seq_along(odds)) {
  for (j in seq_along(evens)) {
    print(odds[i] * evens [j])
  }
}



#make your own function ----
    ## function_name <- function(variable) {
    ## variable title <- variables listed
    ## return(variable title) 
    ## }

    
exclaim_age <- function(age) {
  print (paste("I am", age, "years old!"))
}

exclaim_age(age = 10)

## make a function example ----
birddog_sum <- function(bird, dog) {
  pets <- bird + dog
  return(pets)
}

##use the function we made
birddog_sum(bird = 2, dog = 5)

## use a function to double any value we give it ----

double_it <- function(x) {
  print( 2 * x)
}

double_it(4)
double_it(1:4)

## print vs return ----
# return (should always return it, so it is saved so we can use the output)
find_max <- function(val1, val2) {
  if(val1 > val2){
    return(val1)
  } else if (val2 > val1) {
    return(val2)
  }
}

find_max(7,3)

#print
find_max <- function(val1, val2) {
  if(val1 > val2){
    return(val1)
  } else if (val2 > val1) {
    print(val2)
  }
}

find_max(7,3)
5 * find_max(7,3) ## <- if you do this, the intermediary steps will not be stored 

# make your own for loop


consecutive_halfmile <- c(1, 1.1, 1.2, 1.1, 1.4, 1.5, 1.6, 1.4)

for (i in 1:length(consecutive_halfmile)) {
  print(paste0(consecutive_halfmile[i] + consecutive_halfmile[i + 1]))
  }


## more function examples

animal_age <- function(animal, age){
  if(animal == "dog") {
    print(age * 7)
  } else if (animal == "goat")
    print(age * 4.7)
}

animal_age(animal = "dog", age = 8)
animal_age(animal = "cow", age = 2) ## is wrong but doesn't show an error
animal_age(animal = "dog", age = "yellow") ##shows an error


## functions using data frames ----


#make the data frame (one vecor directly associated with another (rows and columns))
dog_choice <- data.frame(dog_names = c("khora",
                                       "teddy",
                                       "waffle",
                                       "banjo"),
                         food = c("everything", 
                                  "salmon",
                                  "pancakes", 
                                  "chicken"))


library(tidyverse)

my_sub <- dog_choice |>
  dplyr::filter(dog_names == "khora") ##make a subset with filter to look for specific names

print(paste("my name is", my_sub$dog_names, "and I like to eat", my_sub$food))
## make it print a phrase using that subset

##turn all of that into a function
dog_menu <- function(name){
  my_sub <- dog_choice |>
    dplyr::filter(dog_names == name)
  print(paste("my name is", my_sub$dog_names, "and I like to eat", my_sub$food))
}

##now works on all dog names
dog_menu("khora")
dog_menu("teddy")


## create our own messages (using animal_age function we made)

if(animal %in% c("dog", "goat")) ##checks if our input is actually dog or goat

 if(!animal %in% c("dog", "goat")) ## checks if input is not dog or goat
  
   
 if(!animal %in% c("dog", "goat")) {
     stop("oops! animal must be a dog or goat")
   }  
 
if(is.numeric(age) == FALSE) {
  stop("Oops! age must be a number greater than zero")
}  

if(age <= 0) {
  stop("Age must be greater than zero")
}
   
animal_age <- function(animal, age){
  if(animal == "dog") {
    print(age * 7)
  } else if (animal == "goat")
    print(age * 4.7) {
if(!animal %in% c("dog", "goat")) {
  stop("oops! animal must be a dog or goat")
}  

if(is.numeric(age) == FALSE) {
  stop("Oops! age must be a number greater than zero")
}  

if(age <= 0) {
  stop("Age must be greater than zero")
}
}
## need to go back and make this work

animal_age(animal = "dog", age = 8)
animal_age(animal = "cow", age = 2) ## is wrong but doesn't show an error
animal_age(animal = "dog", age = "yellow") ##shows an error


##another example 
calc_windpower <- function(rho, radius, windspeed){
  if (windspeed > 130) {
    warning("wow, that's fast! are you sure?")
  }
  if (rho > 1.225){
    warning("that air density is suspicious, are you sure?")
  }
  if (radius < 0){
    stop("rotor radius must be a positive value (meters)")
  }
 print (0.3 * rho * pi * (radius^2) * (windspeed^3))
}

calc_windpower(rho = 2, radius = -1, windspeed = 50)
