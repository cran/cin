\name{cin-internal}
\alias{gammaHRF}
\alias{intertest}
\alias{truncSum}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{internal cin functions}
\description{
  Internal cin functions
}
\usage{
gammaHRF(TR, paras=NULL, len.seconds=32, onset.seconds=0)
intertest(x,y,k=5)
truncSum(stim, y, hrf, isinterp=F, iscor=F)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{TR}{Repetition time.}
  \item{paras}{Parameters to specify the canonical HRF function, as in
    the Statistical Parametric Mapping package.}
  \item{len.seconds}{Total length of the HRF in seconds.}
  \item{onset.seconds}{Onset time of the first weight.}
  \item{x}{Control response values.}
  \item{y}{Treatment response  values.}
  \item{k}{k-1 control values are compared with 1 treatment.}
  \item{stim}{Stimulus event times.}
  \item{hrf}{Hemodynamic response function weights.}
  \item{isinterp}{Whether to interpolate response values for non-integer
    event times (in scans).}
  \item{iscor}{Whether to summarize using correlation.}
}

\details{
  There are not intended for use by users.   
}

\references{
    Orban, J., and Wolfe, D. (1982). \emph{A class of distribution-free
    two-sample tests based on placements.} Journal of the American
  Statistical Association 77: 666-672.
  
  Luo, X., Small, S., Li, C.R., and Rosenbaum, P. (2012).   \emph{
    Inference with interference between units in an fMRI experiment of
    motor inhibition. 
  } Journal of the American Statistical Association. To appear.
}

\author{
  Xi (Rossi) Luo, Dylan S. Small, Chiang-shan R. Li, and Paul R. Rosenbaum\cr
  Maintainer: Xi (Rossi) LUO \email{xi.rossi.luo@gmail.com} 
}

% \note{
% \section{TODO}{More features will be added very soon.}
% }


% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{nonparametric}
\keyword{ts}% __ONLY ONE__ keyword per line



