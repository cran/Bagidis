\name{semimetric.BAGIDIS_2D}
\alias{semimetric.BAGIDIS_2D}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
The BAGIDIS semi-distance for datasets of images
}
\description{
Function for computing the Bagidis semidistance between images.
}
\usage{
semimetric.BAGIDIS_2D(Data1, Data2 = Data1, NbROW = NULL, wk=NULL,
 lambdaV = NULL, lambdaH = NULL, Type = c( "Array","Vector", "BD", "Flex"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Data1}{A dataset of images. The way this dataset is encoded depend on Type. See Details. There must be at least two images.
}
  \item{Data2}{
A dataset of images encoded in the same way as \code{Data1}.
}
  \item{NbROW}{
If \code{Type} = "Vector", the number of row of the matrix representation associated to the image. Otherwise ignored.
}
  \item{wk}{
The weight function. For images  of size N*M, this is a vector of length N*M-1 if  \code{Type} in c("Vector", "Array", "BD") and a matrix of N*M-1 row and 6 columns if \code{Type} ="Flex". In the latter case, the columns refer to the weights associated to x1,y1,x2,y2, details and abs(details) respectively and the rows refer to the rank k = 1 to N-1 in the 2D-BUUHWE (SHAH). The 6th columns is usually 0. See References for details. 
}
  \item{lambdaV}{ If  \code{Type} in c("Vector", "Array", "BD"), the scaling parameter in the vertical direction. Otherwise ignored. It must be in [0,1] with   \code{lambdaV}+ \code{lambdaH} <=1. 
%%     ~~Describe \code{lambdaV} here~~
}
  \item{lambdaH}{ If  \code{Type} in c("Vector", "Array", "BD"), the scaling parameter in the vertical direction. Otherwise ignored. It must be in [0,1] with   \code{lambdaV}+ \code{lambdaH} <=1. 
}
  \item{Type}{
One amongst ( "Array","Vector" "BD","Flex").  This indicates the way \code{Data1} and \code{Data2} encode the images  to be compared. It also accounts for the specific form used for the BAGIDIS semidistance. See Details below.
}
}
\details{

if \code{Type}="Vector" , the images are stored as vector of values encoded by row in the matrix \code{Data1} (and \code{Data2}. There is one row per image and one column per pixel. The parameter \code{NROW} is required to specify the  shape of the  image (which is then a matrix constructed row by row).

If \code{Type}=  "Array" , the images are stored as matrices along the third dimension of the array \code{Data1} (or \code{Data2}). For instance, the first image is \code{Data1[,,1]}.
 

If \code{Type}=  "BD" or "Flex" , the images are encoded through their signatures (obtained from \code{\link{Signature_2D}}). \code{Data1} (or \code{Data2}) is a list of signatures.

If  \code{Type} in c("Vector", "Array", "BD"), the BAGIDIS semi-distance is used in its constrained form, with a vector weight function and three scaling parameters (\code{lambdaV} along the vertical direction, \code{lambdaH} along the horizontal diirection and a scaling parameter along the detail direction) which sum to 1. See References for more details, in particular \emph{Timmermans (2012)}, Chapter 4, and \emph{Timmermans and Fryzlewicz (2012)}. The values of   \code{lambdaV} and \code{lambdaH} fix the scaling in the detail direction as 1 -  \code{lambdaV} -  \code{lambdaH}, which must remain nonnegative. Default values are provided if \code{wk}, \code{lambdaV} and \code{lambdaH} are nonspecified, as follows: \code{wk = log(N+1-(1:N))/log(N+1)} with N the number of pixels - 1, \code{lambdaV=lambdaH=1/3} if both are nonspecified,   \code{lambdaH= (1-lambdaV)/2} or \code{lambdaV= (1-lambdaH)/2} if only one is supplied. 

If \code{Type} ="Flex",  the BAGIDIS semi-distance is used in its general form with the matrix \code{wk} encoding a matrix weighting specifying the components of the signature at each rank. See References below, in particular \emph{Timmermans (2012)}, Chapter 4, and \emph{Timmermans and Fryzlewicz (2012)}. The absolute value of the detail is included in the signature, but can be ignored by defining the 6th column of \code{wk} as a vector of 0.

If only two images have to be compared to each other, both must be in \code{Data1}, and \code{Data2 = Data1}.
  
}
\value{
%%  ~Describe the value returned
 The matrix of Bagidis semidistances between the \code{nrow(DATA1)} ima ges of \code{DATA1} and the \code{nrow(DATA2)} images of \code{DATA2}. Dimensions: \code{nrow(DATA1) x nrow(DATA2)} . 
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

Data1= rbind(as.numeric(im),as.numeric(im2))
semimetric.BAGIDIS_2D(Data1, NbROW= 3, Type= 'Vector')

Data1= abind(im,im2, along=3)
semimetric.BAGIDIS_2D(Data1, Type= 'Array')

Data1= list(Signature_2D(SHAH(im)),Signature_2D(SHAH(im2)))
semimetric.BAGIDIS_2D(Data1, Type= 'BD')

Data1= list(Signature_2D(SHAH(im)),Signature_2D(SHAH(im2)))
wk = matrix(0, nrow=nrow(Data1[[1]]), ncol=ncol(Data1[[1]]))
wk[1:2,1:5] = rep(1,10)
semimetric.BAGIDIS_2D(Data1, Type= 'Flex', wk=wk)

  }


