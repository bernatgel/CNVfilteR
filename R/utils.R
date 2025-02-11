# Constant: color schema used for plotting CNVs with CopyNumberPlots package
CNV_COLORS <- c("0" = "black", "orange", "gray", "purple","black","black","black","black")


#' auxAddCNcolumn
#'
#' @description
#' Adds a 'cn' column to the \code{cnvs.gr} data.frame or GRanges.
#'
#' @details
#' For each row, \code{cn} column is filled with 1 if \code{cnv} is "deletion", 3 if \code{cnv} is "duplication"
#'
#' @param cnvs.gr \code{data.frame or GRanges} containing the column 'cnv' with "deletion" or "duplication" as values
#'
#'
#' @return
#' input \code{cnvs.gr} with the new column 'cn'
#'
auxAddCNcolumn <- function(cnvs.gr){
  cnvs.gr$cn <- 0
  if (length(cnvs.gr[cnvs.gr$cnv == "deletion"]) > 0) {
    cnvs.gr[cnvs.gr$cnv == "deletion"]$cn <- 1
  }
  if (length(cnvs.gr[cnvs.gr$cnv == "duplication"]) > 0){
    cnvs.gr[cnvs.gr$cnv == "duplication"]$cn <- 3
  }
  return (cnvs.gr)
}

