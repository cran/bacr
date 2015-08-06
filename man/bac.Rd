\name{bac}
\alias{bac}
\title{
Bayesian Adjustment for Confounding (BAC)
}
\description{
Estimating the Average Causal Effect (ACE) based on the BAC algorithm
}
\usage{
bac(data, exposure, outcome, confounders, interactors, 
    familyX, familyY, omega = Inf, num_its, burnM, burnB,
    thin, population = NULL)
}
\arguments{
  \item{data}{
a data from containing the input data. 
}
  \item{exposure}{
the exposure variable
}
  \item{outcome}{
the outcome variable
}
  \item{confounders}{
a vector of potential confounder variable names
}
  \item{interactors}{
a vector of the names of potential confounders that may interact with the exposure
}
  \item{familyX}{
the family of the exposure model. Currently, it allows \code{guassian}, \code{binomial}, and \code{poisson}.
}
  \item{familyY}{
the family of the outcome model. Currently, it allows \code{guassian}, \code{binomial}, and \code{poisson}.
}
  \item{omega}{
a dependent parameter, which is the prior odds of including a predictor in the outcome model, given that the same predictor is in the exposure model. The default value if \code{Inf}, which forces predictors in the exposure model to be included in the outcome model.
}
  \item{num_its}{
number of MCMC iterations excluding the burn-in iterations.
}
  \item{burnM}{
number of burn-in iterations when sampling the exposure and outcome models.
}
  \item{burnB}{
number of burn-in iterations when sampling model coefficients based on a given outcome model.
}
  \item{thin}{
the thinning parameter when sampling model coefficients based on a given outcome model.
}
  \item{population}{
the population for which the ACE is based on. It can be either unspecified or a vector of TRUE and FALSE. If unspecified, the function will estimate the ACE for the whole population. If specified, the function will estimate the ACE for the subpopulation defined by the individuals indicated by TRUE. 
}
}
\details{
The function may run slowly for data with large sample size or many potential confounders. The
users are suggested to choose small number of iterations first, evaluate the computational speed,
then increase the number of iterations. Note that this function assumes a non-informative prior for outcome model coefficients and does not handle informative priors. 
}
\value{
a list variable, which contains
  \item{data}{
a data from containing the input data. 
}
\item{MX}{
a matrix of MCMC samples of exposure models. 
}
\item{MY}{
a matrix of MCMC samples of outcome models. 
}
\item{models}{
a list variable containing unique outcome models in the MCMC sample and the appearence frequencies. 
}
  \item{exposure}{
the exposure variable.
}
  \item{outcome}{
the outcome variable.
}
  \item{confounders}{
a vector of potential confounder variable names.
}
  \item{interactors}{
a vector of the names of potential confounders that may interact with the exposure.
}
  \item{predictorsY}{
All the possible predictors of the outcome.
}
  \item{ACE}{
a vector of MCMC samples of the ACE.
}
  \item{para}{
a list of model parameters
}
}
\references{
 Wang C, Dominici F, Parmigiani G, Zigler CW. (2015).
  Accounting for Uncertainty in Confounder and Effect Modifier
Selection When Estimating Average Causal Effects in Generalized
Linear Models.
  \emph{Biometrics, to appear}.
}
\author{
Chi Wang
}


\seealso{
 \code{\link{plot.bacr}}, \code{\link{summary.bacr}}
}
