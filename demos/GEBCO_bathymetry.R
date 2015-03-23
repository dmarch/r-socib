######################################################################################
# Example to plot GEBCO bathymetry from SOCIB Thredds Server and NetCDF file
#
# Author: David March, IMEDEA/SOCIB
# Email: david@imedea.uib-csic.es
# Website: https://github.com/dmarch/r-socib
# Last revision: 23-March-2015
#
# Keywords: bathymetry, GEBCO, slope, aspect, hillshade, raster
#
# Copyright 2015 SOCIB
# The script is distributed under the terms of the GNUv3 General Public License
######################################################################################


## Load libraries and functions
library(raster)
source("../common/esriOcean.R") #color palette from r-cookbook/color/esriOcean.R

## Locate and import a local NetCDF file (gridded typology)
file <- "../data/MED_gebco.nc" # Opendap does not work in Windows, but you can download the netCDF from "http://thredds.socib.es/thredds/fileServer/ancillary_data/bathymetry/MED_gebco.nc"
data <- raster(file) # that's it! you have your gebco in raster format
data # inspect raster properties
plot(data)

## create hillshae with terrain analysis
slope <- terrain(data, opt='slope')
aspect <- terrain(data, opt='aspect')
hill <- hillShade(slope, aspect, 45, 270)

## Plot
png(filename="gebco.png",width=2000, height=1766, res= 150)
plot(hill, col=grey(0:100/100), legend=FALSE)
plot(data*(-1), breaks=esri.ocean(scale="medium",breaks=TRUE),
     col=esri.ocean(scale="medium", alpha=0.5),
     legend=FALSE, add=TRUE)
dev.off()