% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/standard_curves.R
\name{create_standard_curve_model_antibody}
\alias{create_standard_curve_model_antibody}
\title{create model for standard curve of a certain antibody}
\usage{
create_standard_curve_model_antibody(
  plate,
  antibody_name,
  data_type = "Median",
  npars = 5,
  verbose = TRUE
)
}
\arguments{
\item{plate}{Plate object}

\item{antibody_name}{Name of the antibody for which we want to create the model}

\item{data_type}{Data type of the value we want to use to fit the model - the same datatype as in the plate file. By default equals to \code{Median}}

\item{npars}{Number of parameters to fit the model, by default 5 - the maximum value. \code{npars} also accepts a number of parameters to fit the model - an integer between 2 and 5, accepts also value \code{"all"}, which chooses best models from those with different number of parameters.}

\item{verbose}{If \code{TRUE} prints messages, \code{TRUE} by default}
}
\value{
nplr object with the model
}
\description{
function for now uses the \code{nplr} package to fit the model. The model is fitted using the formula:

$$y = B + \\frac{T - B}{(1 + 10^{b*(x_{mid} - x)})^s}$$,
where:
\itemize{
\item $y$ is the predicted value, MFI in our case,
\item $x$ is the independent variable, dilution in our case,
\item $B$ is the bottom plateau - the right horizontal asymptote,
\item $T$ is the top plateau - the left horizontal asymptote,
\item $b$ is the slope of the curve at the inflection point,
\item $x_{mid}$ is x-coordinate at the inflection point,
\item $s$ is the assymetric coefficient.
This equation is refered as the Richards' equation. More information about the model can be found in the \code{nplr} package documentation.
By default, \code{nplr} model transforms the x values using the log10 function.
}
}
