library(vegan)

# load the dune meadow vegetation data, dune, which has cover class values of 
# 30 species on 20 sites.
# for this, use the data() function and dune as input
data(dune)

# use the specnumber function to calculate how many species each site has
specnumber(dune)

# return only the site with the highest number of species
which.max(specnumber(dune))

# calculate the number of observation for each site (not the number of species)
# use the rowSums() function for this
rowSums(dune)

# what is the lowest number of observations (lowest sample size) across all sites?
# assign this value to sample_min
sample_min <- min(rowSums(dune))

# use the rarefy() function to perform calculation, and set the number of samples
# to sample_min
# assign the results to rarefied_data
rarefied_data <- rarefy(dune, sample = min(rowSums(dune)))

# which site has the highest number of sample standardised species?
# which site the lowest?
which.max(rarefied_data)
which.min(rarefied_data)


# plot the rarefaction curves with the rarecurve(function)
rarecurve(dune, sample = min(rowSums(dune)))


# additional exercise -----------------------------------------------------

# when you set tidy = TRUE in the rarecurve() function, you get a dataframe
# of rarefied curves which you can use to create your own ggplot. 
# please do so and try to recreate the original rarecurve plot as close as 
# possible
