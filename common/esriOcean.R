esri.ocean <- function(scale="small", breaks=FALSE, alpha=1){
  # This function provides color palette and breakpoints used in the ESRI Ocean Basemap
  # Source: http://blogs.esri.com/esri/arcgis/2012/08/02/esri-ocean-basemap-color-style-available-for-download/
  
  if(alpha<0 | alpha>1) stop("alpha is defined between 0 and 1")
  
  if (scale=="medium"){
    
    # Define ESRI Ocean palette (Medium scale)
    red <- c(56,43,66,82,98,134,149,170,181,191,209)
    green <- c(91,102,124,143,159,179,188,207,215,224,233)
    blue <- c(140,166,179,204,217,235,230,242,247,255,255)
    breakpoints <- c(-9500,-8500,-7000,-6000,-4500,-3000,-1000.-400.-150,-35,0)
  }
  if (scale=="small"){
    # Define ESRI Ocean palette (Small scale)
    red <- c(41,89,115,133,148,166,186)
    green <- c(97,148,166,179,194,206,222)
    blue <- c(156,204,224,235,247,245,255)
    breakpoints <- c(-7999,-6011,-5015,-4071,-1349,-121,0)
  }
  cols<- adjustcolor(rgb(red,green,blue, max = 255),alpha.f=alpha)
  out<- if (breaks==FALSE) cols else breakpoints
  return(out)
}




