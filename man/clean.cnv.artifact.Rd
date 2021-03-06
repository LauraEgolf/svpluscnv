% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clean.cnv.artifact.r
\name{clean.cnv.artifact}
\alias{clean.cnv.artifact}
\title{Remove likely artifacts from segmentation data and fill gaps in segmentation data}
\usage{
clean.cnv.artifact(
  cnv,
  n.reps = 4,
  cnv.size = 5e+06,
  pc.overlap = 0.99,
  fill.gaps = TRUE,
  verbose = TRUE
)
}
\arguments{
\item{cnv}{(S4) an object of class svcnvio containing data type 'cnv' validated by validate.cnv}

\item{n.reps}{(numeric) number of samples with identical segment to consider artifact}

\item{cnv.size}{(numeric) only smaller segments will be modified in the cnv data.frame}

\item{pc.overlap}{(numeric) minimun percentage overlap for a pair of segments to be consider identical}

\item{verbose}{(logical)}

\item{fill}{(logical) whether to fill gaps from the segmentaed file after filtering artifacts}
}
\value{
a data.frame containing CNV data
}
\description{
Remove likely artifacts from segmentation data and fill gaps in segmentation data
}
\examples{

## validate input data.frame
cnv <- validate.cnv(segdat_lung_ccle)

clean.cnv.artifact(cnv)
}
\keyword{CNV,}
\keyword{filter}
\keyword{segmentation,}
