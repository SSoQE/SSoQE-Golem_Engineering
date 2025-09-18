library(iNEXT)

# load spider data consisting of abundance data from two canopy manipulation treatments 
# (“Girdled” and “Logged”) of hemlock trees (Ellison et al. 2010)
data(spider)

# use the iNEXT() function to perform classical and coverage rarefaction. 
# set q = 0 (Hill Number, species richness) and datatype = "abundance"
# assign the results to dat_rare
dat_rare <- iNEXT(spider, q = 0, datatype = "abundance")

# plot the results for classical (type = 1) and for coverage rarefaction (type = 3)
# for this, use the ggiNEXT() function
ggiNEXT(dat_rare, type = 1)
ggiNEXT(dat_rare, type = 3)

# you can access the size_based (classical) and coverage_based rarefaction results
# from dat_rare with $iNextEst
# take a look at it
dat_rare$iNextEst

