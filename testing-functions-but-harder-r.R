library(tidyverse)
rm(list = ls())
gw_rate <- function(site) {
  if(!site %in% c("mountain", "prairie", "desert", "beach")) {
    warning("site not included")
  }
  gw_depths <- data.frame(sitename = c("mountain", 
                                       "prairie",
                                       "desert",
                                       "beach"),
                          depth = c(32, 41, 63, 2),
                          slope = c(11.2, 0.4, 0.8, 2.6))
  site_select <- filter(gw_depths, sitename == site)
  
  transport_rate <- 1.4 * site_select$slope + 3.6 * site_select$depth
  return(transport_rate)
}

gw_rate(site = "mountain")

rm(list = ls())


# Build & check the minimum function
logistic_growth <- function(N0, K, r, time) {
  Nt <- K / (1 + ((K - N0) / N0) * exp(-r * time))
  print(Nt)
}

# Do the values check out when you test this? 
logistic_growth(N0 = 100, K = 6000, r = 0.27, time = 40)

# Create a vector of times:
time_vec <- seq(from = 0, to = 50, by = 0.1)

# Apply the logistic growth function to that vector of times (& store):
pop_35 <- logistic_growth(N0 = 100, K = 6000, r = 0.27, time = time_vec)

# Bind together the time_vec and population:
pop_time_35 <- data.frame(time_vec, pop_35)

# Always take a look at it
# View(pop_time_35)

# Alternatively with an inner for loop: 

# Create a vector of times:
time_vec <- seq(from = 0, to = 50, by = 0.1)

# Apply the logistic growth function to that vector of times (& store):
pop_35 <- logistic_growth(N0 = 100, K = 6000, r = 0.27, time = time_vec)

# Bind together the time_vec and population:
pop_time_35 <- data.frame(time_vec, pop_35)

# Always take a look at it
# View(pop_time_35)

# Alternatively with an inner for loop: 
pop_1_vec <- vector(mode = "numeric", length = length(time_vec))

pop_time_1 <- for(i in seq_along(time_vec)) {
  population <- logistic_growth(N0 = 100, K = 6000, r = 0.27, time = time_vec[i])
  pop_1_vec[i] <- population
}


ggplot(data = pop_time_1, aes(x = time_vec, y = pop_1_vec)) + geom_line()

r_seq <- seq(from = 0.2, to = 0.4, by = 0.01)

out_matrix <- matrix(nrow = length(time_vec), ncol = length(r_seq))

for (i in seq_along(r_seq)) { #outer loop of growth rates
  for(j in seq_along(time_vec)) { # inner loops of time steps
  population <- logistic_growth(N0 = 100, K = 6000, r = r_seq[i], time = time_vec[j])
  out_matrix[j,i]<- population 
  }
}

### j first because j is row (j = time) and i is the columns (growth rate)

out_df <- data.frame(out_matrix, time = time_vec)
colnames(out_df) <- c(paste0("growth_rate_", r_seq), "time")


out_df_long <- out_df |>
  pivot_longer(cols = -time, names_to = "growth_rate", values_to = "population_size")


ggplot(data = out_df_long, aes(x = time, y = population_size)) + 
  geom_line(aes(color = growth_rate), show.legend = FALSE) +
  theme_minimal() 

