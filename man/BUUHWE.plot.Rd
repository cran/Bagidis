\name{BUUHWE.plot}
\alias{BUUHWE.plot}

\title{
Graphical representation of the Bottom Up Unbalanced Haar Wavelet Expansion of a series.
}
\description{
Function for graphical representation of the Bottom Up Unbalanced Haar Wavelet Expansion of a series, as obtained from function \code{\link{BUUHWE}}.
}
\usage{
BUUHWE.plot(BUUHWE.out, row.max = length(BUUHWE.out$series), 
French = FALSE, Color = TRUE)
}

\arguments{
  \item{BUUHWE.out}{
output of function \code{\link{BUUHWE}}.
}
  \item{row.max}{
integer. Number of basis vectors to be represented. By default, all vectors  are shown.
}
  \item{French}{
logical. Should labels be written in french? (default=english)
}
  \item{Color}{
logical. Should the representation be in color (alternative: black and white)? (default = color) 
}
}

\details{
See References below, in particular \emph{Timmermans (2012)}, Chapter 1, or \emph{Timmermans and von Sachs (2010)}.
}               

\value{
This function is invoked for its side effect which is to produce a graphical representation of the expansion of a series in its unbalanced Haar wavelet basis. 
The series is represented on the top of the graph, with the time axis at the bottom of the main figure. This main figure is the representation of the Unbalanced Haar basis, row by row, with rank k=0 (constant vector) on the top. Vectors are expressed as a function of time (horizontaly) and the height of that function is given by the \emph{blue to red} color scale (if \code{Color = TRUE}) or relatively to a zero level, that is indicated by a dotted horizontal line for each rank. Vertically, the detail coefficients are represented rank by rank at the same level as the corresponding basis vectors. This is the expansion of the series in its associated Unbalanced Haar basis, starting from rang k= 0 on the top of the gaph - wich is represented missing for graphical purpose and continuing downwards with rang k increasing. If you sum those detail coefficients times their associated basis vectors, you get back the initial series. 
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

The function \code{\link{BUUHWE_2D}} in this package is similar to the function uh.bu.2d  (copyrighted Fryzlewicz 2014) in the package "shah_code", available on the webpage of Piotr Fryzlewicz: http://stats.lse.ac.uk/fryzlewicz/shah/shah_code.R , which accompanies the paper Fryzlewicz and Timmermans (2015).
}


\author{
Catherine Timmermans, Institute of Statistics, Biostatistics and Actuarial Sciences, UCLouvain, Belgium. 

Contact: \email{catherine.timmermans@uclouvain.be}
}
\note{
 The equivalent of \code{BUUHWE.plot} for images is \code{\link{BUUHWE_2D.plot}}.  Another way to represent the BUUHWE transform of a series is through function \code{\link{BD.plot}}. 
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{BUUHWE}}, \code{\link{BD.plot}},\code{\link{BUUHWE_2D.plot}}
}
\examples{
x = c(0,0,1,0,0, 3, 5, 0, 0)
BUUHWE.plot(BUUHWE(x))
BUUHWE.plot(BUUHWE(x), Color= FALSE)     }


