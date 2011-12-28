\name{cin}
\alias{cin}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{inference under interference}
\description{
  Test for treatment effects under interference for fMRI time series
}
\usage{
cin(X, k=5, type=c("sum", "correlation"), weight=NULL, TR=NULL, interp=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{X}{Input list of blocks (see reference), where each block could
    be one subject in one scan session.  Each atom in this list is also
    a list of 3 vectors in the order: fMRI response time series, control stimulus
    events and treatment stimulus events (both in scans). An example of
    such input with one block could be \code{list(list(fmri=fmri, stimc=stimc,
      stimt=stimt))}  where \code{fmri}, \code{stimc}, and \code{stimt}
    are  all \code{R} numerical vectors.}
  \item{k}{\code{k-1} controls and \code{1} treatment are compared.
    Default 5.}
  \item{type}{Method to summarize the response times series for each
    event, weighted summation or correlation with \code{weight}. Dealt sum.}
  \item{weight}{Weight used to summarize the time series points after
    each control or treatment event.}
  \item{TR}{Repetition Time used to generate \code{weight} from
    Canonical HRF (see reference) if \code{weight}
    is not specified.}
  \item{interp}{Whether interpolation of the fMRI time series will take
    place to produce observations at those event times. If FALSE, the
    event times will be rounded to nearest scans. Default FALSE.}
}


\details{
  Performs causal inference test fMRI time series.  The test is based on
  placement statistics (Orban and Wolfe, 1982).  The test does not require model
  assumptions, and can provide valid inference on treatment effects even
  if there are interference between randomized stimuli.

  Current implementation simply consolidates the test statistics from each
  subjects and each session.  More complicated ways of aggregating these
  effects will be implemented in the future release. 
}

\value{
  An object with S3 class \code{"cin"}.   You can also use it as a
  regular R list with the following fields:
  \item{Score}{Actual test score. The test statistics is
    \code{Dev}.}
  \item{Exp}{Expected test score.}
  \item{Var}{Expected variance of test score.}
  \item{Dev}{Deviance or z-score.}
  \item{p.value}{One-side p-value for \code{Dev}.}
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

\author{Xi (Rossi) Luo, Dylan S. Small, Chiang-shan R. Li, and Paul R. Rosenbaum\cr
  Maintainer: Xi (Rossi) LUO \email{xi.rossi.luo@gmail.com} }

% \note{
% \section{TODO}{More features will be added very soon.}
% }

\examples{
## simulation from the null
fmri.ts <- arima.sim(list(order = c(1,1,0), ar = 0.7), n = 1000)
events <- sample(1000, 400)
stimt <- sample(events, 100)
stimc <- setdiff(events, stimt)
cin(list(list(fmri=fmri.ts, stimc=stimc, stimt=stimt)), TR=2)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{nonparametric}
\keyword{ts}% __ONLY ONE__ keyword per line
