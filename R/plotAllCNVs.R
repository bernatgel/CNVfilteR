#' plotAllCNVs
#'
#' @description
#' Plots all CNVs on chromosome ideograms
#'
#' @details
#' Plots all CNVs defined at \code{cnvs.gr} on a view of horizontal ideograms representing all chromosomes.
#'
#' @param cnvs.gr \code{GRanges} containing al CNV definitions returned by \code{filterCNVs} or \code{loadCNVcalls} functions.
#'
#' @return invisibly returns a \code{karyoplot} object
#'
#' @examples
#' cnvs.file <- system.file("extdata", "DECoN.CNVcalls.2.csv", package = "CNVfilteR", mustWork = TRUE)
#' cnvs.gr <- loadCNVcalls(path = cnvs.file, chr.column = "Chromosome", start.column = "Start", end.column = "End", cnv.column = "CNV.type", sample.column = "Sample")
#'
#' # Plot all CNVs
#' plotAllCNVs(cnvs.gr)
#'
#'
#' @import assertthat
#' @importFrom CopyNumberPlots plotCopyNumberCalls
#' @importFrom karyoploteR plotKaryotype
#' @importFrom graphics legend
#' @export plotAllCNVs
#'
plotAllCNVs <- function(cnvs.gr){

  # Add cn column (required by CopyNumberPlots)
  cnvs.gr <- auxAddCNcolumn(cnvs.gr)

  # Plot
  kp <- plotKaryotype(plot.type=1)
  plotCopyNumberCalls(kp, cnvs.gr, r1=0.3, cn.colors = CNV_COLORS, label.cex = 0.6)
  legend("bottomright", legend=c("deletion", "duplication"), fill = c(CNV_COLORS[2], CNV_COLORS[4]), ncol=1, cex = 0.7)

  return(invisible(kp))
}
