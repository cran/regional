% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/reg_inhomogeneity.R
\name{reg_inhomogeneity}
\alias{reg_inhomogeneity}
\title{Inhomogeneity}
\usage{
reg_inhomogeneity(
  region,
  raster,
  dist_fun = "euclidean",
  sample_size = 1,
  unit = "log2"
)
}
\arguments{
\item{region}{An object of class \code{sf} with a \code{POLYGON} or \code{MULTIPOLYGON} geometry type}

\item{raster}{An object of class SpatRaster (terra)}

\item{dist_fun}{Distance measure used. This function uses the \code{philentropy::distance} function in the background. Run \code{philentropy::getDistMethods()} to find possible distance measures.}

\item{sample_size}{Proportion of the cells inside of each region to be used in calculations. Value between 0 and 1.
It is also possible to specify an integer larger than 1, in which case the specified number of cells
of each region will be used in calculations.}

\item{unit}{a character string specifying the logarithm unit that should be used to
compute distances that depend on log computations.}
}
\value{
A vector with the inhomogeneity values
}
\description{
Inhomogeneity measures a degree of mutual dissimilarity
between values of all cells in a region. This value is between 0 and 1,
where small value indicates that values of all cells in the region
represent consistent patterns so the cluster is pattern-homogeneous.
}
\examples{
\dontrun{
  library(terra)
  if (requireNamespace("sf", quietly = TRUE)) {
    library(sf)
    volcano = rast(system.file("raster/volcano.tif", package = "regional"))
    vr = read_sf(system.file("regions/volcano_regions.gpkg", package = "regional"))
    vr$inh = reg_inhomogeneity(vr, volcano, sample_size = 1)

    mean(vr$inh)

    plot(volcano)
    plot(vect(vr), add = TRUE)
    plot(volcano)
    plot(vr["inh"], add = TRUE)
 }
}
}
