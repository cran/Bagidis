\name{semimetric.BAGIDIS}
\alias{semimetric.BAGIDIS}
\alias{semimetric.BAGIDIS.BD}
\alias{semimetric.BAGIDIS.TS}
\alias{BAGIDIS.dist.BD}
\alias{BAGIDIS.dist}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Computing the BAGIDIS semidistance between series
}
\description{
Functions for computing the Bagidis semidistance between series of measurements.
}
\usage{
semimetric.BAGIDIS(DATA1,DATA2=DATA1, p = 2,  wk=NULL, Param=0.5,
 wdw= min(ncol(DATA1),30),   Evol =FALSE,  Overlap = wdw-1,  method = c('TS','BD'))

semimetric.BAGIDIS.TS(DATA1,DATA2=DATA1, p = 2,  wk=NULL, Param=0.5,
 wdw= min(ncol(DATA1),30),   Evol =FALSE,  Overlap = wdw-1)
  
semimetric.BAGIDIS.BD(Details1, Breakpoints1,Details2=Details1,
 Breakpoints2=Breakpoints1,NbSubseries =1,p = 2,  wk=NULL, Param=0.5, Evol =FALSE)

BAGIDIS.dist(BUUHWE.out.1, BUUHWE.out.2, p = 2, wk=NULL, Param=0.5)

BAGIDIS.dist.BD(Details1, Breakpoints1,Details2, Breakpoints2,
p = 2, wk=NULL, Param=0.5)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
\item{DATA1}{
matrice containing the series to be compared row by row.with the rows of \code{DATA2}  Each row of \code{DATA1} has its semidistance being computed with every row of \code{DATA2}. If only \code{DATA1} is provided, then \code{DATA2} is taken to be equal to \code{DATA1}. We must have \code{ncol(DATA1)= ncol(DATA2)}.  
}
  \item{DATA2}{
Optional. Matrice containing the series to be compared row by row.with the rows of \code{DATA1}  Each row of \code{DATA1} has its semidistance being computed with every row of \code{DATA2}. If only \code{DATA1} is provided, then \code{DATA2} is taken to be equal to \code{DATA1}. We must have \code{ncol(DATA1)= ncol(DATA2)}}.
  \item{p}{
the kind of norm to be used for computing the partial distance in the B-D plane.  Must be numeric or \code{Inf}.
}
  \item{wk}{
a vector of weights of length \code{ncol(DATA1)-1}. If not provided, \code{wk = log(N+1-(1:N))/log(N+1)} with \code{N= ncol(DATA1)-1}.
}
  \item{Param}{
the balance parameter between the differences along the breakpoint axis and along the detail axis. Param must be in [0;1]. \code{Param= 1} means that only breakpoints differences are taken into account. \code{Param=0} means that only details differences are taken into account.
}
  \item{wdw}{
In case distances are measured between "long" series, it could be advantageous to make use of a windowed semimetric. \code{wdw} encode the length of the window in which the semimetric will be computed between the subseries. By default there is no windowing if the length of the series ( \code{= ncol(DATA1)} ) is smaller than or equal to 30, and a windows length of 30 otherwise.
}
  \item{Evol}{
Logical. In case a windowing is applied, should the matrices of local (windowed) dissimilarities be returned? Default is \code{FALSE}.
}
  \item{Overlap}{
In case a windowing of the series is applied, \code{Overlap} determines how the subseries overlap each other. By default, a one-step-sliding distance is computed.
}

\item{method}{either 'TS' (default) or 'BD' : the method for computing the matrix of semi-distances in case of multiple series. Results are identical. 'TS' recompute the BUUHWE transform for each pairwise comparison, 'BD' computes all signatures beforehand and store them before computing the distances. 'TS' requires more time, 'BD' requires more storage.  
With method 'TS', computation time is affected by the number of rows in \code{DATA1} and \code{DATA2}. 
If \code{nrow(DATA1)> nrow(DATA2)}, it increases the number of operations to be computed. 
On the opposite, if \code{nrow(DATA2)>nrow(DATA1)}, it increases the memory usage.}


\item{BUUHWE.out.1 }{BUUHWE expansion of a series, as obtained from function \code{BUUHWE}.}

\item{BUUHWE.out.2}{BUUHWE expansion of a second series, as obtained from function \code{BUUHWE}.}


\item{Details1}{matrixcontaining the details of series out of a dataset DATA1 containing a set of series of identical length.}  

\item{Breakpoints1}{matrix containing the breakpoints of series out of a dataset DATA1 containing a set of series of identical length.}  

\item{Details2}{matrixcontaining the details of series out of a dataset DATA2 containing a set of series of identical length as in DATA1.}  

\item{Breakpoints2}{matrix containing the breakpoints of series out of a dataset DATA2 containing a set of series of identical length as in DATA1.}  
      
\item{NbSubseries}{in case an evolving (windowed) semidistance must be computed, Nbsubseries gives the  number of data measurements in a windowed segment.}  
}


\details{
Function \code{semimetric.BAGIDIS} computes the Bagidis semidistance between curves.
If several curves are provided, it returns a matrix of semidistances.
The function is an interface for either \code{semimetric.BAGIDIS.TS} or \code{semimetric.BAGIDIS.BD}, depending on the value of the parameter \code{method}.

Function \code{Bagidis.dist} computes the BAGIDIS semidistance between two series, encoded through their BUUHWE expansion obtained from function \code{\link{BUUHWE}}. Function \code{Bagidis.dist.BD} computes the BAGIDIS semidistance between two series, encoded through their breakpoints and details obtained from functions \code{\link{Breakpoints}} and \code{\link{Details}}. 

See \code{\link{BAGIDIS-package}} for an overview  about the BAGIDIS methodology and References for details, in particular \emph{Timmermans (2012)}, Chapter 1, and \emph{Timmermans and von Sachs (2010)}.
}
\value{
\itemize{
\item{dissimilarity.matrix}  Matrix of semidistances between the \code{nrow(DATA1)} series of \code{DATA1} and the \code{nrow(DATA2)} series of \code{DATA2}. Dimensions: \code{nrow(DATA1) x nrow(DATA2)} . 
\item{dissimilarity.evol}  Array of local matrices of semidistances between the windowed series of \code{DATA1} and \code{DATA2}. Dimensions: \code{nrow(DATA1) x nrow(DATA2) x Nb_subseries.} \code{Nb_subseries} is determined by the three quantities \code{nrow(DATA1)}, \code{wdw} and \code{Overlap}.   
}}         
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
The equivalent function for image is \code{\link{semimetric.BAGIDIS_2D}}.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
 \code{\link{BUUHWE}}, \code{\link{semimetric.BAGIDIS_2D}}. %% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
x= 1:10
y=2:11
A=rbind(x,y)
semimetric.BAGIDIS(A)

B= rbind(x,x,y)
semimetric.BAGIDIS(A,B)

x= 1:30
y= 1:30
A= rbind(x,y)
B= rbind(x,x, y)
semimetric.BAGIDIS(A,B, wdw =15, Evol =TRUE, Overlap =0)

x= c(1,7,3,0,-2,6,4,0,2)
y= c(1,7,5,5,-2,1,4,0,2)
BAGIDIS.dist(BUUHWE(x), BUUHWE(y))

         }
%## The function is currently defined as
%function(DATA1,
%                             DATA2=DATA1,
%                             p = 2, 
%                             wk=NULL, 
%                             Param=0.5,
%                             wdw= min(ncol(DATA1),30),  
%                             Evol =FALSE,
%                             Overlap = wdw-1 
%                             ){  
%if (is.vector(DATA1)){
%DATA1 = matrix(DATA1, nrow=1,byrow=TRUE)}
%if  (is.vector(DATA2) ){ 
%DATA2 =matrix(DATA2,nrow=1,byrow=TRUE) }
%if (ncol(DATA1) != ncol(DATA2)){
%stop('ERROR: Lengths of the series in DATA1 and DATA2 should be equals')}
%if (wdw > ncol(DATA1)){
%wdw= min(ncol(DATA1),30)
%warning('WARNING: The length of the window (wdw) cannot be higher than the length of the series. wdw is set to its default value.')
%  }
%if (wdw < 2){
%stop('ERROR: The length of the window (wdw) cannot be smaller than 2.')
%  }
%if (Overlap > wdw-1 ){
%stop('ERROR: The Overlap parameter cannot be higher than the wdw-1.')
%  }
%if (Overlap < 0){
%stop('ERROR: the Overlap parameter must be non negative.')
%  }
%if (Param < 0 | Param > 1){
%stop('ERROR: the balance parameter Param must be included in [0;1].')}
%if (length(p) !=1){
%stop('ERROR: p must be a single numeric value, not a vector.')}
%if (!is.null(wk) & length(wk)!= (wdw-1) ){
%stop('ERROR: wk must be a numeric vector of length wdw-1, or must be set to NULL (so that its default value is applied).')}
%if (!is.logical(Evol)){
%warning('WARNING: Evol must be boolean. It is set to its default value (FALSE).')} 
% 
%Decalage = wdw-Overlap       # Default: =1.
%NbSubseries= (ncol(DATA1) - wdw +1) # Nb of subseries in case of Decalage = 1.
%NbSubseries_overlap= floor((ncol(DATA1) - wdw)/(wdw-Overlap))+1 #ceiling(NbSubseries/Decalage ) # Nb of subseries for which the semidistance will be calculated. If Overlap is set to its default value, NbSubseries_overlap = NbSubseries.
%if (NbSubseries_overlap !=  (ncol(DATA1) - wdw)/(wdw-Overlap) +1) {
%warning('WARNING: the length of the series (ncol(DATA1)) is not a multiple of the Overlap parameter. The series are thus truncated to the closer multiple of Overlap. ')
%  }
%dissimilarity.matrix = matrix(nrow=nrow(DATA1),ncol=nrow(DATA2))
%if (Evol) { 
%dissimilarity.evol = array(dim=c(nrow(DATA1),nrow(DATA2),NbSubseries_overlap) )}
%        
%        DefineSubseries =function(Y,NbSubseries,wdw,Decalage){                          
%        Y.Windowed_tmp = matrix(NA,nrow=wdw, ncol=NbSubseries)
%        for (k in 1:NbSubseries){Y.Windowed_tmp[,k]= Y[k:(k+wdw-1)]}        
%        Y.Windowed = Y.Windowed_tmp[,seq(1,ncol(Y.Windowed_tmp),by =Decalage)]
%        return(Y.Windowed) }
%        
%DATA2_Subseries = matrix(apply(DATA2,1,DefineSubseries, NbSubseries,wdw,Decalage), nrow =wdw, ncol = NbSubseries_overlap*nrow(DATA2))
%        
%BUUHWE.DATA2 = array(apply(DATA2_Subseries,2,BUUHWE), dim=c(NbSubseries_overlap,nrow(DATA2)))       
%    
%    ComputeDissimVec = function(BUUHWE.DATA2.rowj, BUUHWE.DATA1.rowi, NbSubseries_overlap, p, wk, Param){ 
%        Dissim = rep(NA, NbSubseries_overlap)
%        for(k in 1:NbSubseries_overlap){Dissim[k]= BAGIDIS.dist(BUUHWE.DATA1.rowi[[k]],
%                                           BUUHWE.DATA2.rowj[[k]],
%                                           p=p,
%                                           wk =wk,
%                                           Param=Param)} # eo FOR ( index in 1:NbSubseries_overlap) 
%    return(Dissim)    
%    } 
%    
%        
%if (identical(DATA1,DATA2)){ #----------------------------------if DATA1 = DATA2
%for (i in 1:nrow(DATA1)){  #### We work row by row in DATA1 
%BUUHWE.DATA1.rowi =  BUUHWE.DATA2[,i]
%DissimRowsData2toDATA1rowi = apply(array(BUUHWE.DATA2[,i:ncol(BUUHWE.DATA2)],dim =c(NbSubseries_overlap,nrow(DATA2)-i+1)), 2, ComputeDissimVec,BUUHWE.DATA1.rowi, NbSubseries_overlap, p, wk, Param) 
% 
%dissimilarity.matrix[i,i:ncol(BUUHWE.DATA2)]=  apply(matrix(DissimRowsData2toDATA1rowi, ncol =nrow(DATA2)-i+1) ,2 ,sum)        
%dissimilarity.matrix[i:ncol(BUUHWE.DATA2),i]=  apply(matrix(DissimRowsData2toDATA1rowi, ncol =nrow(DATA2)-i+1) ,2 ,sum)        
%if (Evol) { 
%dissimilarity.evol[i,i:ncol(BUUHWE.DATA2),] = t(DissimRowsData2toDATA1rowi)       
%dissimilarity.evol[i:ncol(BUUHWE.DATA2),i,] = t(DissimRowsData2toDATA1rowi) }          
%     
%  } # eo FOR 
%  } else { #----------------------------------------------------------------- ELSE
%for (i in 1:nrow(DATA1)){  #### We work row by row in DATA1 
%    X= as.numeric(DATA1[i,])
%    X.Windowed = DefineSubseries(X,NbSubseries,wdw,Decalage)
%       
%    
%    BUUHWE.DATA1.rowi  = apply(matrix(X.Windowed,ncol=NbSubseries_overlap)  , MARGIN=2,FUN= BUUHWE)    
%DissimRowsData2toDATA1rowi = apply(BUUHWE.DATA2, 2, ComputeDissimVec,BUUHWE.DATA1.rowi, NbSubseries_overlap, p, wk, Param) 
%dissimilarity.matrix[i,]=  apply(matrix(DissimRowsData2toDATA1rowi, ncol =nrow(DATA2)),2 ,sum)        
%if (Evol) { 
%dissimilarity.evol[i,,] = t(DissimRowsData2toDATA1rowi) }       
%   
%  } # eo FOR (row in DATA1)    
%  } # eo IF (DATA1 ?= DATA2)
%if (!Evol){
%return(dissimilarity.matrix)}
%else{
%return(list('dissimilarity.matrix' =dissimilarity.matrix,
%              'dissimilarity.evol' =dissimilarity.evol))}
%  }#EOF
%}
%% Add one or more standard keywords, see file 'KEYWORDS' in the
%% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
%