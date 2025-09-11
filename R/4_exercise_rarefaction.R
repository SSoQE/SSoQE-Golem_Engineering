library(vegan)

# load the dune meadow vegetation data, dune, which has cover class values of 
# 30 species on 20 sites.
# for this, use the data() function and dune as input
data()

# use the specnumber function to calculate how many species each site has
specnumber()

# return only the site with the highest number of species


# calculate the number of observation for each site (not the number of speciation)
# use the rowSums() function for this
rowSums()

# what is the lowest number of observations (lowest sample size) across all sites?
# assign this value to sample_min
sample_min <- 

# use the rarefy() function to perform calculation, and set the number of samples
# to sample_min
# assign the results to rarefied_data
rarefied_data <- rarefy()

# which site has the highest number of sample standardised species?
# which site the lowest?


# plot the rarefaction curves with the rarecurve(function)
rarecurve()


# additional exercise -----------------------------------------------------

# when you set tidy = TRUE in the rarecurve() function, you get a dataframe
# of rarefied curves which you can use to create your own ggplot. 
# please do so and try to recreate the original rarecurve plot as close as 
# possible
