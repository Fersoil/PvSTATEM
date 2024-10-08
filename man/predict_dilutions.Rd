% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/standard_curves.R
\name{predict_dilutions}
\alias{predict_dilutions}
\title{predict dilutions using fitted model}
\usage{
predict_dilutions(
  plate,
  antibody_name,
  model,
  data_type = "Median",
  verbose = TRUE
)
}
\arguments{
\item{plate}{Plate object}

\item{antibody_name}{Name of the antibody for which we want to predict the dilutions}

\item{model}{nplr object with the model}

\item{data_type}{Data type using which the model was fitted - the same datatype as in the plate file. By default equals to \code{Median}}

\item{verbose}{If \code{TRUE} prints messages, \code{TRUE} by default}
}
\value{
data frame with columns: \code{Location}, \code{Sample}, \code{MFI}, \code{dilution}
}
\description{
Function predicts the dilutions of the samples, based on the MFI values and the fitted model.
}
