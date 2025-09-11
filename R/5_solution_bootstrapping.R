library(tidyverse)


# load the spider data from the iNext package (the package is only used for the
# dataset here but will return later)
# the data consists of abundance data from two canopy manipulation treatments 
# (“Girdled” and “Logged”) of hemlock trees (Ellison et al. 2010)
data(spider, package = "iNEXT")



# girdled -----------------------------------------------------------------


# create a character vector with species names (species1, species2...) for the
# Girdled assemblage spider$Girdled
# for this, use the paste0() function and assign it to girdled_names
girdled_names <- paste0("species", 1:length(spider$Girdled))

# the Girdled assemblages has size 168 sum(spider$Girdled) and a species richness
# of 26 length(spider$Girdled). The Logged assemblage has size 252 and a species
# richness of 37. 
# We are going to use the size of the less intensely sampled assemblage (Girdled)
# for the sampling standardisation

# some species are sampled more often in each assemblages (i.e., they have higher
# abundance) and some less. We want to keep this information when resampling/ bootstrapping
# and therefore use the abundance of each species in girdled_names as their sampling probability

# use the sample() function to resample the girdled species (girdled_names) to size 168
# with replacement (replace = TRUE), and use the abundance of each Girdled species
# as their sampling probability prob. 
# if you have done so, use a pipe %>% to calculate the species richness with 
# unique() %>% length()
sample(girdled_names, 
       size = 168, replace = TRUE, 
       prob = spider$Girdled) %>% 
  unique() %>% 
  length() 

# now we want to do this many times. For this, we can use the replicate() function
# which takes the number of replicates as the first argument and the function/ call it is
# supposed to iterate as the second argument. Use the code from above as the second argument
# and replicate it 1000 times. Save results into the vector called spR_girdled
spR_girdled <- replicate(1000, 
                         sample(girdled_names, 
                                size = 168, replace = TRUE, 
                                prob = spider$Girdled) %>% 
                           unique() %>% 
                           length())

# calculate the mean and save it as mean_girdled
mean_girdled <- mean(spR_girdled)

# calculate the standard deviation and save it as sd_girdled
sd_girdled <- sd(spR_girdled)


# calculate the lower confidence interval by mean - 1.96 * sd, 
# and the upper confidence interval by mean + 1.96 * sd
mean_girdled - 1.96 * sd_girdled
mean_girdled + 1.96 * sd_girdled



# logged ------------------------------------------------------------------


# now do the same for the logged assemblage and compare your confidence intervals. 
# Make sure to use the same standardizing size of 168
logged_names <- paste0("species", 1:length(spider$Logged))

spR_logged <- replicate(1000, 
                         sample(logged_names, 
                                size = 168, replace = TRUE, 
                                prob = spider$Logged) %>% 
                           unique() %>% 
                           length())

mean_logged <- mean(spR_logged)

sd_logged <- sd(spR_logged)

mean_logged - 1.96 * sd_logged
mean_logged + 1.96 * sd_logged


# additional exercise -----------------------------------------------------

# create a ggplot() that compares the observed species richness of both girled 
# and logged assemblages with the species richness estimated by rarefaction and
# species richness estimated by bootstrapping

# exercise 2
# change the number of bootstrapping samples and see how the corresponding
# confidence interval changes
