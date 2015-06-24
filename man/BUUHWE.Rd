\name{BUUHWE}
\alias{BUUHWE}
\alias{Breakpoints}
\alias{Details}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Bottom Up Unbalanced Haar Wavelet Expansion
}
\description{
Function of a time series x returning its unbalanced Haar wavelet expansion, as obtained with a bottom-up algortithm. BUUHWE is an acronym for Bottom-Up Unbalanced Haar Wavelets Expansion.
}
\usage{
BUUHWE(x)
Breakpoints(Dataset.BUUHWE)
Details(Dataset.BUUHWE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
 a numeric vector of length N
}
\item{Dataset.BUUHWE}{
 a list of outputs of \code{BUUHWE} applied to a dataset of curves.
}
}
\details{

See \code{\link{BAGIDIS-package}} for an overview  about the BAGIDIS methodology and References for details, in particular \emph{Timmermans (2012)}, Chapter 1, \emph{Timmermans and von Sachs (2010)} or \emph{Fryzlewicz (2007)}.

}
\value{
\code{BUUHWE(x)} returns a list with

\item{detail}{ detail coefficients starting from rank k=0 up to k=N-1.} 
\item{basis}{  unbalanced Haar basis vectors ordered by colums. First column is the constant vector of rank k=0. This is a matrix of dimensions N xN.}
\item{split.abs}{ localization index. For consistency with basis matrix and detail vector dimensions, this is a vector of length N but first coefficient is \code{NA}. Index are then ordered by increasing rank k.   }
\item{series}{ the initial series \code{x}.}

\code{Breakpoints} returns the breakpoints of the Unbalanced Haar wavelet basis, from rank k=1 to rank k=N-1.   In case it is applied to a  list of BUUHWE provided for M series of length N, it returns the breakpoints for each elements of the list, as a matrix with M columns and N-1 rows.

\code{Details} returns the details of the Unbalanced Haar wavelet basis, from rank k=1 to rank k=N-1.   In case it is applied to a  list of outputs of \code{BUUHWE} provided for M series of length N, it returns the details for each elements of the list, as a matrix with M columns and N-1 rows. 

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
This function can be compared to function \code{uh.bu} in package \pkg{unbalhaar} of Piotr Fryzlewicz. Nevertheless outputs are differents as \code{uh.bu} is intented for denoising. The unbalanced Haar basis expansion is thus not explicitely obtained in \code{uh.bu}.   Function \code{\link{BUUHWE.plot}} provides with a representation of the  unbalanced Haar basis expansion.

Function \code{\link{BUUHWE_2D}} is the image equivalent of \code{\link{BUUHWE}}. 
                                                                      

The BUUHWE expansion is the starting step for comparing curves through the BAGIDIS semi-distance. See function \code{\link{semimetric.BAGIDIS}}.

Breakpoints and details define what is called \emph{the signature of the series in the b-d plane}. See references for details. A representation of the signature is obtained with \code{\link{BD.plot}}. 
}
%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{semimetric.BAGIDIS}}, \code{\link{BUUHWE.plot}}, \code{\link{BUUHWE_2D}},\code{\link{BD.plot}}.
}
\examples{
x= c(1,7,3,0,-2,6,4,0,2)
BUUHWE(x)
Breakpoints(list(BUUHWE(x)))
y= c(1,7,5,5,-2,1,4,0,2)
Breakpoints(list(BUUHWE(x),BUUHWE(y)))

}
%## The function is currently defined as
%function(x){
%x.init =x 
%N =length(x)
%axis.weights =rep(1,N)
%group =rep(1,N)
%split.rel = NULL
%sin.phi.vect = NULL
%detail.vect = NULL
%new.basis = NULL
%split.abs =NULL
%for (step in (1:(N-1))){ ## START LOOP
%M = N-step +1
%x.plus = x[-1]
%x.minus=x[-M]                                         
%axis.weights.plus =axis.weights[-1]
%axis.weights.minus =axis.weights[-M]
%norm = sqrt(axis.weights.plus^2 + axis.weights.minus^2)
%cos.phi = axis.weights.plus/norm
%sin.phi = axis.weights.minus/norm
%detail = cos.phi*x.minus - sin.phi*x.plus
%somme  = sin.phi*x.minus + cos.phi*x.plus
%i = min(which(abs(detail) == min(abs(detail))))
%split.rel = c(split.rel,i)
%sin.phi.vect = c(sin.phi.vect, sin.phi[i])
%detail.vect =  c(detail.vect,detail[i])
%new.vect =rep(0,N)
%middle.index = sum(group[1:i]) +1
%start.index = middle.index - group[i]
%end.index = middle.index + group[i+1]
%na=group[i]
%nb=group[i+1]
%ntot =na+nb
%new.vect[start.index:(middle.index-1)]=  sqrt(nb/na*(1/ntot)*(1/cos.phi[i]^2) ) * cos.phi[i]
%new.vect[middle.index:(end.index-1)] = - sqrt(na/nb*(1/ntot)*(1/sin.phi[i]^2)  ) *sin.phi[i]
%new.basis = cbind(new.vect, new.basis)
%split.abs = c(split.abs,(middle.index-1))
%x=x[-i]
%x[i]=somme[i]
%axis.weights = axis.weights[-i]
%axis.weights[i] = norm[i]
%group[i] = group[i]  + group[i+1]
%group = group[-(i+1)]   
%  }## END LOOP.
%       
%new.basis =cbind(rep(sqrt(N)/N,N),new.basis)
%detail.vect = c(detail.vect,x)
%split.rel = c(split.rel,NA)
%sin.phi.vect = c(sin.phi.vect, NA)
%split.abs =c(split.abs,NA)
%return(list("detail"=rev(detail.vect),"basis" = new.basis, "split.abs" = rev(split.abs), "series" = x.init))
%  }
%}
%% Add one or more standard keywords, see file 'KEYWORDS' in the
%% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
