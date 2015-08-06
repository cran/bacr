\name{summary.bacr}
\alias{summary.bacr}
\title{
Summary Method for Class 'bacr'
}
\description{
Summarize results from running the \code{bac} function
}
\usage{
\method{summary}{bacr}(object, \dots)
}
\arguments{
  \item{object}{
A \code{bacr} object
}
\item{\dots}{
arguments passed to or from other methods.
}
}
\value{
a list variable, which contains
  \item{posterior.mean}{Posterior mean of the ACE}
  \item{CI}{95\% posterior interval of the ACE}
  \item{PIP}{A vector of posterior inclusion probabilities for potential
  confounders}
}
\author{
Chi Wang
}
\seealso{
 \code{\link{bac}}, \code{\link{plot.bacr}}
}
