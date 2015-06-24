\name{BD.plot}
\alias{BD.plot}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
B-D representation of the Bottom Up Unbalanced Haar Wavelet Expansion of a series
}
\description{
Function for graphical representation of the Bottom Up Unbalanced Haar Wavelet Expansion (here after BUUHWE) of a series, in the \emph{Breakpoints-Details} plane (B-D plane).
}
\usage{
BD.plot(x, y = NULL, BUUHWE.out.x = BUUHWE(x), BUUHWE.out.y = BUUHWE(y), 
French = FALSE, col = c('black','red'))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
a numeric vector (a series) whose BUUHWE expansion has to be computed and represented and the B-D plane 
}
  \item{y}{
an optional second numeric vector (a series) whose \code{BUUHWE} expansion has to be computed and superimposed to the one of x in the B-D plane. \code{length(y)} must be equal to \code{length(x)}.
}
  \item{BUUHWE.out.x}{
output of \code{BUUHWE(x)}, included as an optional argument for saving computation time within the function if it has already been computed and saved outside the function; otherwise BUUHWE transform of x is compute at the call of function \code{BD.plot}.
}
  \item{BUUHWE.out.y}{
output of \code{BUUHWE(y)}, included as an optional argument for saving computation time within the function if it has already been computed and saved outside the function; otherwise the BUUHWE transform of y is computed by \code{BUUHWE} at the call of function \code{BD.plot}.
}
  \item{French}{
logical. Should labels be written in french ? (default=english)
}
  \item{col}{
 vector of size one or two, indicating the colors for representing series x and - if needed -series y in the B-D plane. Default is black for series x and red for series y.
}
}
\details{
See References below, in particular \emph{Timmermans (2012)}, Chapter 1, or \emph{Timmermans and von Sachs (2010)}. 
}
\value{
This function is invoked for its side effect which is to produce a graphical representation of the expansion of a series in its unbalanced Haar wavelet basis. The  series is plotted in the plane that is defined by the values of its breakpoints and its detail coefficients. Points are numbered according to their rank in the hierarchy.
}
\references{

The main references are 
\itemize{
\item Timmermans C., 2012,  Bases Giving Distances. A new paradigm for investigating functional data with applications for spectroscopy. PhD thesis, Universite catholique de Louvain. \url{http://hdl.handle.net/2078.1/112451}
 
 \item Timmermans C. and von Sachs R., 2015, A novel semi-distance for investigating dissimilarities of curves with sharp local patterns, Journal of Statistical Planning and Inference, 160, 35-50. \url{http://hdl.handle.net/2078.1/154928}
 
 \item Fryzlewicz P. and Timmermans C., 2015, SHAH: Shape Adaptive Haar wavelets for image processing. Journal of Computational and Graphical Statistics. (accepted - published online 27 May 2015) \url{http://stats.lse.ac.uk/fryzlewicz/shah/shah.pdf}
 
 \item Timmermans C., Delsol L. and von Sachs R., 2013, Using BAGIDIS in nonparametric functional data analysis: predicting from curves with sharp local features, Journal of Multivariate Analysis, 115, p. 421-444. \url{http://hdl.handle.net/2078.1/118369}
 }
 
 Other references include
\itemize{
\item Girardi M. and Sweldens W., 1997, \emph{A new class of unbalanced Haar wavelets that form an unconditional basis for Lp on general measure spaces},  J. Fourier Anal. Appl. 3,  457-474
\item Fryzlewicz P., 2007, \emph{Unbalanced Haar Technique for Non Parametric Function Estimation}, Journal of the American Statistical Association, 102, 1318-1327.
\item Timmermans C., von Sachs, R. , 2010,  \emph{BAGIDIS, a new method for statistical analysis of differences between curves with sharp patterns} (ISBA Discussion Paper 2010/30). 
 Url : \url{http://hdl.handle.net/2078.1/91090}
 \item Timmermans, C. , Fryzlewicz, P., 2012, \emph{SHAH: Shape-Adaptive Haar Wavelet Transform For Images With Application To Classification} (ISBA Discussion Paper 2012/15).
Url: \url{http://hdl.handle.net/2078.1/110529}
}


}




\author{
Catherine Timmermans, Institute of Statistics, Biostatistics and Actuarial Sciences, UCLouvain, Belgium. 

Contact: \email{catherine.timmermans@uclouvain.be}
}
\note{
Another way to represent the BUUHWE transform of a series is trough function  \code{\link{BUUHWE.plot}}.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{BUUHWE}}, \code{\link{BUUHWE.plot}}
}
\examples{
 x= c(1,7,3,0,-2,6,4,0,2)
 BD.plot(x)
 }
