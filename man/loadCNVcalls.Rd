% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/loadCNVcalls.R
\name{loadCNVcalls}
\alias{loadCNVcalls}
\title{loadCNVcalls}
\usage{
loadCNVcalls(path, chr.column, start.column, end.column,
  coord.column = NULL, cnv.column, sample.column, gene.column = NULL,
  deletion = "deletion", duplication = "duplication", sep = "\\t",
  skip = 0, genome = "hg19", exclude.non.canonical.chrs = TRUE)
}
\arguments{
\item{path}{Path to csv/tsv file containing the CNV calls.}

\item{chr.column}{Which column stores the chr location of the CNV.}

\item{start.column}{Which column stores the start location of the CNV.}

\item{end.column}{Which column stores the end location of the CNV.}

\item{coord.column}{CNV location in the chr:start-end format. Example: "1:538001-540000". If NULL, \code{chr.column},
\code{start.column} and {end.column} columns will be used. (Defaults to NULL)}

\item{cnv.column}{Which column stores the type of CNV (deletion or duplication).}

\item{sample.column}{Which column stores the sample name.}

\item{gene.column}{Which columns store the gene or genes affected (optional). (Defaults to NULL)}

\item{deletion}{Text used in the \code{cnv.column} to represent deletion CNVs. (Defaults to "deletion")}

\item{duplication}{Text used in the \code{cnv.column} to represent duplication CNVs. (Defaults to "duplication")}

\item{sep}{Separator symbol to load the csv/tsv file. (Defaults to "\\t")}

\item{skip}{Number of rows that shoud be skipped when reading the csv/tsv file. (Defaults to 0)}

\item{genome}{The name of the genome. (Defaults to "hg19")}

\item{exclude.non.canonical.chrs}{Whether to exclude non canonical chromosomes (Defaults to TRUE)}
}
\value{
A \code{GRanges} with a range per each CNV and the metadata columns:
 - \code{cnv}: type of CNV, "duplication" or "deletion"
 - \code{sample}: sample name
}
\description{
Loads CNV calls from a csv/tsv file
}
\details{
Loads a csv/tsv file containing CNV calls, and transform it into a GRanges with \code{cnv} and \code{sample} metadata columns.
}
\examples{
# Load CNVs data
cnvs.file <- system.file("extdata", "DECoN.CNVcalls.csv", package = "CNVfilteR", mustWork = TRUE)
cnvs.gr <- loadCNVcalls(path = cnvs.file, chr.column = "Chromosome", start.column = "Start", end.column = "End", cnv.column = "CNV.type", sample.column = "Sample")


}
