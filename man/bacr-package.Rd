\name{bacr-package}
\alias{bacr-package}
\alias{bacr}
\docType{package}
\title{
Bayesian Adjustment for Confounding
}
\description{
This package implements the Bayesian Adjustment for Confounding (BAC) algorithm for estiamting the Average Causal Effect (ACE) in Generalized Linear Models. It accounts for uncertainty in confounder and effect modifier
selection and allows estimation of the ACE for the whole population or for a specific subpopulation. 
}
\details{
\tabular{ll}{
Package: \tab bacr\cr
Type: \tab Package\cr
Version: \tab 1.0.1\cr
Depends: \tab R(>= 2.13.0), graphics, stats, MCMCpack\cr
Date: \tab 2016-10-23\cr
License: \tab GPL-2
}

}
\author{
Chi Wang

Maintainer: Chi Wang <chi.wang@uky.edu>
}
\references{
 Wang C, Dominici F, Parmigiani G, Zigler CW.
  Accounting for Uncertainty in Confounder and Effect Modifier
Selection When Estimating Average Causal Effects in Generalized
Linear Models.\cr
  \emph{Biometrics, 71(3): 654-665, 2015.}
}
\keyword{BAC}

\examples{
######## Note that the example below is for illustration purpose only. ####
######## In practice, larger number of iterations will be needed.##########
##### simulate data ############
n = 200; m = 4
V = matrix(rnorm(n*m),ncol=m)
X = rbinom(n, size=1, prob=exp(V[,1])/(1+exp(V[,1])))
beta = c(1,1,1,0.5)
temp0 = cbind(rep(0,n), V[,1:3]) %*% beta
temp1 = cbind(rep(1,n), V[,1:3]) %*% beta
Y0 = rbinom(n, size=1, prob=exp(temp0)/(1+exp(temp0)))
Y1 = rbinom(n, size=1, prob=exp(temp1)/(1+exp(temp1)))
Y = Y0
Y[X==1] = Y1[X==1]
Z = as.data.frame(cbind(Y, X, V))
names(Z) = c("Y", "X", paste("V", 1:m, sep=""))
##### run BAC  ################# 
result = bac(data=Z, exposure="X", outcome="Y", confounders=paste("V", 1:m, sep=""), 
            interactors=NULL, familyX="binomial", familyY="binomial", omega=Inf, 
            num_its=5, burnM=1, burnB=1, thin=1)
##### summarize results ########
summary(result)
plot(result)

### Adding interaction terms #############
beta = c(1,1,1,1,1)
temp0 = cbind(rep(0,n), V[,1:3], rep(0,n)*V[,3]) %*% beta
temp1 = cbind(rep(1,n), V[,1:3], rep(1,n)*V[,3]) %*% beta
Y0 = rbinom(n, size=1, prob=exp(temp0)/(1+exp(temp0)))
Y1 = rbinom(n, size=1, prob=exp(temp1)/(1+exp(temp1)))
Y = Y0
Y[X==1] = Y1[X==1]
Z = as.data.frame(cbind(Y, X, V))
names(Z) = c("Y", "X", paste("V", 1:m, sep=""))
result = bac(data=Z, exposure="X", outcome="Y", confounders=paste("V", 1:m, sep=""), 
            interactors=paste("V", 1:m, sep=""), familyX="binomial", familyY="binomial", 
            omega=Inf, num_its=5, burnM=1, burnB=1, thin=1)
summary(result)
plot(result)

##### Estimate the ACE in the exposed subgroup  #################
result = bac(data=Z, exposure="X", outcome="Y", confounders=paste("V", 1:m, sep=""), 
            interactors=paste("V", 1:m, sep=""), familyX="binomial", familyY="binomial", 
            omega=Inf, num_its=5, burnM=1, burnB=1, thin=1, population=(X==1))
summary(result)
plot(result)
}
