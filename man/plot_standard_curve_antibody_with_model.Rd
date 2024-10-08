% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/standard_curves.R
\name{plot_standard_curve_antibody_with_model}
\alias{plot_standard_curve_antibody_with_model}
\title{plot standard curve of a certain antibody with fitted model}
\usage{
plot_standard_curve_antibody_with_model(
  plate,
  antibody_name,
  model,
  data_type = "Median",
  decreasing_dilution_order = TRUE,
  log_scale = c("all"),
  plot_asymptote = TRUE,
  verbose = TRUE
)
}
\arguments{
\item{plate}{Plate object}

\item{antibody_name}{Name of the antibody for which we want to plot the standard curve - the same for which the model was fitted}

\item{model}{nplr object with the model}

\item{data_type}{Data type of the value we want to plot - the same datatype as in the plate file. By default equals to \code{Median}}

\item{decreasing_dilution_order}{If \code{TRUE} the dilutions are plotted in decreasing order, \code{TRUE} by default.}

\item{log_scale}{Which elements on the plot should be displayed in log scale. By default \code{"all"}. If \code{NULL} or \code{c()} no log scale is used, if \code{"all"} or \code{c("dilutions", "MFI")} all elements are displayed in log scale.}

\item{plot_asymptote}{If \code{TRUE} the asymptotes are plotted, \code{TRUE} by default}

\item{verbose}{If \code{TRUE} prints messages, \code{TRUE} by default}
}
\value{
a ggplot object with the plot
}
\description{
Function plots the values of standard curve samples and the fitted model.
}
\examples{

plate_filepath <- system.file("extdata", "CovidOISExPONTENT_CO.csv", package = "PvSTATEM", mustWork = TRUE) # get the filepath of the csv dataset
plate <- read_data(plate_filepath)


# temporary replacement for the missing layout file
dilution_factors <- c(1/50, 1/100, 1/200, 1/400, 1/800, 1/1600, 1/3200, 1/6400, 1/12800, 1/25600, 1/102400)
for (i in seq_along(plate$standard_curve)) {
 sample <- plate$standard_curve[[i]]
 sample$sample_type$dilution_factor <- dilution_factors[i]
}

model <- create_standard_curve_model_antibody(plate, antibody_name = "RBD_wuhan_IPP")
plot_standard_curve_antibody_with_model(plate, antibody_name = "RBD_wuhan_IPP", model)


}
