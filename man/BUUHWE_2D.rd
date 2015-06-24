\name{BUUHWE_2D}
%\alias{BUUHWT_2D} % this functions exists as an internal alias.
\alias{BUUHWE_2D}
\alias{SHAH}
\alias{Signature_2D}

%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Two-dimensional Bottom-Up Unbalanced Haar Wavelet Expansion of an image
}
\description{
This function computes the two-dimensional Bottom-Up Unbalanced Haar Wavelet Expansion (2D-BUUHWE) of an image (encoded as a matrix). See Timmermans (2012) for details.  The 2D-BUUHWE is termed SHaped-Adaptive Haar (SHAH) expansion in Timmermans and Fryzlewicz (2012). 
}
\usage{
BUUHWE_2D(im)
SHAH(im)
Signature_2D(out.BUUHWE_2D)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{im}{
\code{im}: a numeric matrix encoding an image. Missing values are not allowed.
}
\item{out.BUUHWE_2D}{
\code{out.BUUHWE_2D}: the output of \code{BUUHWE_2D} or \code{SHAH}.}
}
\details{
More details can be found in Timmermans (2012), Chapter 4, or Timmermans and Fryzlewicz (2012). The function implements the 2D-BUUHWE (= SHAH) for images observed on a regular quadratic grid. The image is encoded as a matrix, of which the entries are labeled by column.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
The output of   \code{BUUHWE_2D} or \code{SHAH} is a list with
\item{d}{a vector of two elements giving the dimension of the encoded image.}
\item{decomp.hist}{The decomposition history of the image, which provides its BUUHWE expansion (=SHAH transform). For each \code{i} in \code{d[1]*d[2]-1},  matrix \code{decomp.hist[,,i]} is a matrix with the following entries: 
 \code{decomp.hist[1,1,i]} is the label of the input node at step \code{d[1]*d[2]-i}, \code{decomp.hist[1,2,i]} is the label of the output node at step \code{d[1]*d[2]-i}, \code{decomp.hist[2,1,i]} is the weight of the input node at step \code{d[1]*d[2]-i}, \code{decomp.hist[2,2,i]} is the weight of the output node at step \code{d[1]*d[2]-i} , \code{decomp.hist[3,1,i]} is the detail   \code{d[1]*d[2]-i}, \code{decomp.hist[3,2,i]} is always zero.
}

The output of \code{Signature_2D} is a matrix containing the signature of the image. This is a matrix of which row i is made of the components x1,y1,x2,y2, detail and abs(detail) related to rank i in the 2D-BUUHWE (SHAH) of an image.
%% ...
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
Piotr Fryzlewicz, Department of Statistics, London School of Economics.

Catherine Timmermans, Institut de Statistique, Biostatistique et Sciences Actuarielles, Universite catholique de Louvain. 
<catherine.timmermans@uclouvain.be>
}
\note{
A graphical representation of the tranform is provided by \code{\link{BUUHWE_2D.plot}} ( or equivalently \code{\link{SHAH.plot}}). The 2D-BUUHWE (SHAH) is related to a basis expansion. The basis can be obtained and represented using  \code{\link{BUUHWE_2D_Stepwise}} ( or equivalently \code{\link{SHAH_Stepwise}}). An efficient way to store the information defing the 2D-BUUHWE (SHAH) is through the signature of the image, obtained using \code{\link{Signature_2D}}. 

\code{\link{BUUHWE}} provides with the Bottom-Up Unbalanced Haar Wavelet Expansion of a curve. Pairs of images can be compared through their 2D-BUUHWE, using the BAGIDIS semi-distance computed with \code{\link{semimetric.BAGIDIS_2D}}. See Timmermans (2012) for details. 
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{BUUHWE_2D.plot}},\code{\link{SHAH.plot}} ,\code{\link{BUUHWE_2D_Stepwise}}, \code{\link{SHAH_Stepwise}}, \code{\link{BUUHWE}}.  
}
\examples{
im = rbind(c(1,2,3),c(2,7,8),c(1,0,0))
BUUHWE_2D(im)
SHAH(im)
Signature_2D(SHAH(im))

SHAH_Stepwise(im)$details
Signature_2D(SHAH(im))
}

