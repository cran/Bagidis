\name{BUUHWE_2D.plot}
\alias{BUUHWE_2D.plot}
\alias{SHAH.plot}
\alias{BUUHWE_2D_Stepwise}
\alias{SHAH_Stepwise}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Graphical representation of the 2D-BUUHWE (or SHAH) of an image
}
\description{
Graphical representation of the 2D-BUUHWE or SHAH transform of an image. The representation of the process is either through the evolving network representation or through the successively built basis matrices of the Unbalanced Haar wavelet basis associated to the transform. 
}
\usage{
BUUHWE_2D.plot(out.BUUHWE_2D, Evol = TRUE)
SHAH.plot(out.BUUHWE_2D, Evol = TRUE)
BUUHWE_2D_Stepwise(Data,Plot)
SHAH_Stepwise(Data,Plot)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{out.BUUHWE_2D}{
the result of \code{BUUHWE_2D} or \code{SHAH} applied to an image.
}
  \item{Evol}{ Logical. Should the evolution of the complete network be represented? Default is TRUE and is more informative but applies only for images of reasonable size (otherwise graphics are not readable). if FALSE, only segments linking the input and output nodes at each step are represented and superimposed.  
%%     ~~Describe \code{Evol} here~~
}
  \item{Data}{
a matrix encoding an image
}
  \item{Plot}{ Logical. Should all the basis matrices be represented? Default is TRUE. Otherwise not representation is provided, but the matrices are returned by the function so that they can be represented separetely.
}
}
\details{
See \code{\link{BAGIDIS-package}} for an overview  about the BAGIDIS methodology and References for details, in particular \emph{Timmermans (2012)}, Chapter 4, and \emph{Timmermans and Fryzlewicz (2012)}.
}
\value{


\code{BUUHWT_2D_Stepwise} or \code{SHAH_Stepwise} returns a list with 
\item{basis}{An array of the basis matrices of the 2D-BUUHWT (SHAH)}
\item{details }{the detail coefficients for ranks NM-1 to 1 (with N*M the dimension of the image) (i.e. in their ordre of construction)}
\item{d0}{the detail coefficients for ranks 0}
\item{im}{the initial image}
\item{labels.hist}{the evolution of the labels associated to the pixels}

The function are mainly used for their side-effect \code{Plot=TRUE}. Functions \code{BUUHWE_2D.plot} or \code{SHAH.plot} are only used for their side-effect.
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
The equivalent function for curves is \code{\link{semimetric.BAGIDIS}}.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
 \code{\link{BUUHWE_2D}}, \code{\link{SHAH}}, \code{\link{semimetric.BAGIDIS}}. 
}
\examples{
im = rbind(c(1,2,3), c(5,3,2), c(1,1,2))
im2 = rbind(c(1,1,5), c(5,5,2), c(1,0,0))

SHAH(im)
SHAH_Stepwise(im)

SHAH.plot(SHAH(im))

SHAH.plot(SHAH(im),Evol=FALSE)

SHAH_Stepwise(im)$details
Signature_2D(SHAH(im))

}
