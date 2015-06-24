\name{BAGIDIS-package}
\alias{BAGIDIS-package}
\alias{Bagidis-package}
\alias{BAGIDIS}
\alias{Bagidis}
\docType{package}
\title{
BAGIDIS (BAses Giving DIStances). A New Set of Tools for Investigating Functional Data With Sharp Local Patterns 
}
\description{
This is the companion package of a PhD thesis entitled "Bases Giving Distances. A new paradigm for investigating functional data with applications for spectroscopy" by \emph{Timmermans (2012)}. See references below for details and related publications. 

The core of the BAGIDIS methodology is a functional wavelet based semi-distance that has been introduced by \emph{Timmermans and von Sachs (2010, 2015) and Timmermans, Delsol and von Sachs (2013)}. This semi-distance allows for comparing curves with sharp local patterns that might not be well aligned from one curve to another. It is data-driven and highly adaptive to the curves being studied.  Its main originality is its ability to consider simultaneously horizontal and vertical variations of patterns, which proofs highly useful when used together with clustering algorithms or visualization method. BAGIDIS is an acronym for \emph{BAsis GIving DIStances}. The extension of BAGIDIS to image data relies on the same principles and has been described in \emph{Timmermans and Fryzlewicz (2012), Fryzlewicz and Timmermans (2015)}. 

}
\details{
\tabular{ll}{
Package: \tab Bagidis\cr
Type: \tab Package\cr
Version: \tab 2.0\cr
Date: \tab 2012-05-03\cr
License: \tab GPL-3 \cr
LazyLoad: \tab yes\cr
}

The BAGIDIS methodology  aims at answering the need for a method able to detect the closeness of curves or images whose significant sharp features might not be well aligned. It has been developped and studied by \emph{Timmermans and von Sachs (2010, 2015)}, \emph{Timmermans, Delsol and von Sachs (2013)} and \emph{Timmermans and Fryzlewicz (2012), Fryzlewicz and Timmermans (2015)} and you should refer to these papers for detailed information about its use, and hence about the purpose of this package (see \url{http://hdl.handle.net/2078.1/154928} and \url{http://hdl.handle.net/2078.1/118369},  for curves and \url{http://hdl.handle.net/2078.1/110529} and \url{http://stats.lse.ac.uk/fryzlewicz/shah/shah.pdf} for images). Its approach is based upon the definition of a semi-distance that is functional, in the sense  that the ordering of the data is explicitly taken into account, and wavelet-based, in the sense that it relies on a basis function expansion in which positions and amplitudes of a pattern are encoded. However, this method overcome the dyadic restriction that is attached with classical wavelet expansions, and do not require any preliminary smoothing of the data. Furthermore, a major originality of the method is that it relies on projections on basis functions that are different from one series to another.

\emph{Timmermans (2012)} (\url{http://hdl.handle.net/2078.1/112451}) provides a comprehensive survey of the method. Regarding curves, the main ideas are as follows:

\itemize{
\item{Preliminary Observation.} We consider series that are made of regularly spaced observations of a curve. We note that patterns in a series can be described as a set of level changes.
\item{Finding an \emph{Optimal} Basis for Each Curve.} As a first step, we want to expand each series in a basis that is best suited to it, in the sense that its first basis vectors should carry the main features of the series, while subsequent basis vectors support less significant patterns. In that respect, we are looking for a basis that is organized in a \emph{hierarchical} way. As a consequence, there will be a particular basis associated to each series. As the series are thought of as described by their level changes, we will consider that the meaningful features for describing them are both locally important level changes (jumps, peaks, troughs) and level changes affecting a large number of data (discontinuities of the mean level).  From this point of view, Unbalanced Haar wavelet bases are good candidates for our expansion. This family of bases have been introduced by \emph{Girardi and Sweldens (1997)}  as a way to circumvent the dyadic restriction of classical wavelets.
\item{Taking Advantage of the Hierarchy of those Bases.} Given this, we will define a semi-distance, that is at the core of the BAGIDIS methodology. This semi-distance takes advantage of the hierarchy of the well-adapted unbalanced Haar wavelet bases: basis vectors of similar rank in the hierarchy (and their associated coefficients in the expansion of the series) are compared to each other, and the resulting differences are weighted according to that rank.
This is actually a clue for decrypting the name of the methodology, as the name BAGIDIS stands for \emph{BAsis GIving DIStances}.  
}

Function \code{\link{BUUHWE}} computes the Unbalanced Haar Wavelet Expansion (BUUHWE) of a series in the Unbalanced Haar basis that is best suited to it according to the bottom-up algorithm developped by \emph{Fryzlewicz (2007)}. Function \code{\link{Breakpoints}} and Function \code{\link{Details}} are used to encode the BUUHWE in a efficient compact way. Functions \code{\link{BUUHWE.plot}} and \code{\link{BD.plot}} give two different graphical representations of the BUUHWE expansion of a series.
Function \code{\link{BAGIDIS.dist}} computes the BAGIDIS semidistance between two series encoded by their BUUHWE expansions. Function \code{\link{BAGIDIS.dist.BD}} computes the BAGIDIS semidistance between two series encoded by their breakpoints and details.  \code{\link{semimetric.BAGIDIS}} computes the BAGIDIS semidistance between two series encoded as a numeric series.  If \code{\link{semimetric.BAGIDIS}} is applied to matrices of series to be compared, it returns the dissimilarity matrix between them, as computed using the BAGIDIS semi-distance.

The BAGIDIS semi-distance between images relies on very similar principles. An optimal unbalanced Haar wavelet basis is associated to each image through the 2-dimensional Bottom-Up unbalanced Haar wavelet expansion (2D-BUUHWE). This expansion is rather termed SHape Adaptive  Haar in \emph{Timmermans and Fryzlewicz (2012), Fryzlewicz and Timmermans (2015)} and both terminology are used here in the functions name. The 2D-BUUHWE or SHAH is obtained thanks to function  \code{\link{BUUHWE_2D}} and its alias \code{\link{SHAH}}. An efficient way to encode this expansion is through the \emph{signature} of the image, obtained by applying  \code{\link{Signature_2D}} to the output of   \code{\link{BUUHWE_2D}} (or \code{\link{SHAH}}). A representation of the transform process is obtained using  \code{\link{BUUHWE_2D.plot}} and its alias \code{\link{SHAH.plot}}. The transform process is linked with the definition of a well-suited unbalanced Haar basis for the image. This basis and its representation can be obtained using  \code{\link{BUUHWE_2D_Stepwise}} and its alias \code{\link{SHAH_Stepwise}}. The BAGIDIS semi-distance between images is then computed using  \code{\link{semimetric.BAGIDIS_2D}}.

 
}
\author{
Catherine Timmermans, Institute of Statistics, Biostatistics and Actuarial Sciences, UCLouvain.  \cr
Maintainer: <catherine.timmermans@uclouvain.be>
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





\keyword{ package }
%\seealso{
%~~ Optional links to other man pages, e.g. ~~
%~~ \code{\link[<pkg>:<pkg>-package]{<pkg>}} ~~
%}
%\examples{
%~~ simple examples of the most important functions ~~
%}
