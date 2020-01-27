#' Class to store breakpoint annotations
#' @param cnvmat (data.frame): chromosome for the first breakpoint
#' @param genesdf (data.frame): gene info 
#' @param seg (data.frame): segmentation data with 6 columns: sample, chromosome, start, end, probes, segment_mean
#' @param param (list):
#' @return an instance of the class 'genecnv' containing gene level copy number info
#' @export
#' 
genecnv <- setClass("genecnv",
                        representation(
                            cnvmat  = "matrix",
                            genesdf = "data.frame",
                            seg = "data.frame",
                            param = "list"
                        ))


setMethod("show","genecnv",function(object){
    writeLines(paste("An object of class genecnv from svcnvplus containing gene level CNV data
                \nNumber of samples=",ncol(object@cnvmat),
                "\nAltered genes=",nrow(object@cnvmat)))
})


#' Obtain a matrix with the weighted average CN per chromosome arm 
#' @param seg (data.frame) segmentation data with 6 columns: sample, chromosome, start, end, probes, segment_mean
#' @param genome.v (hg19 or hg38) reference genome version to draw chromosome limits and centromeres
#' @param chrlist (character) list of chromosomes to include chr1, chr2, etc...
#' @param geneid (character) only "Symbol" accepted; if NULL, entrez ID will be used
#' @param fill (logical) whether to fill the gaps in the segmentation file using gap neighbour segmean average as log ratio
#' @param verbose (logical) 
#' @keywords CNV, segmentation, genes
#' @export
#' @examples
#' 
#' ## validate input data.frames
#' seg <- validate.seg(segdat_lung_ccle)
#' 
#' gene.cnv(seg)

gene.cnv <- function(seg, 
                     genome.v="hg19",
                     chrlist=NULL, 
                     geneid="Symbol",
                     fill.gaps=FALSE,
                     verbose=TRUE){

segdat <- validate.seg(seg)

if(is.null(chrlist)) chrlist <- unique(segdat$chrom)
chrlist <- chr.sort(chrlist)

if(fill.gaps) segdat <- segment.gap(seg, chrlist=chrlist, verbose=verbose)

genesgr <- get.genesgr(genome.v=genome.v,chrlist=chrlist)

genes_df <- remove.factors(as.data.frame(genesgr))
genes_df <- genes_df[order(genes_df$start),]
genes_df <- genes_df[order(genes_df$seqnames),]
rownames(genes_df) <- genes_df$gene_id


geneLimits_gr <- with(genes_df, GRanges(seqnames, IRanges(start=start, end=end)))
segdat_gr <- with(segdat, GRanges(chrom, IRanges(start=start, end=end)))

hits <-GenomicAlignments::findOverlaps(geneLimits_gr,segdat_gr)

overlaps_all <- pintersect(geneLimits_gr[queryHits(hits),], segdat_gr[subjectHits(hits),])
width_overlap <- width(overlaps_all)


df<-data.frame(segdat[subjectHits(hits),c("sample","segmean")],genes_df[queryHits(hits),"gene_id"],width_overlap)
colnames(df) <- c("sample","segmean","gene_id","width")

cnvmat <- matrix(ncol=length(unique(segdat$sample)), nrow=nrow(genes_df) )
colnames(cnvmat) <- unique(segdat$sample)
rownames(cnvmat) <- genes_df$gene_id

if(verbose){
  message("Calculating gene level CNV")
  pb <- txtProgressBar(style=3)
  cc <-0
  tot <- ncol(cnvmat)
}
for(i in unique(segdat$sample)){ 
  dfi <- df[which(df$sample == i),]
  num <- aggregate(segmean~gene_id,dfi,mean)
  
  gene_cn <- as.numeric(num[,2])
  names(gene_cn) <- as.character(num[,1])
  cnvmat[names(gene_cn),i] <- gene_cn
  
  if(verbose) cc <- cc+1
  if(verbose) setTxtProgressBar(pb, cc/tot)
  }
if(verbose) close(pb)
#cnvmat<- na.omit(cnvmat)

out <- genecnv(
    cnvmat=cnvmat,
    genesdf=genes_df[rownames(cnvmat),],
    seg=segdat,
    param=list(genome.v=genome.v,
               chrlist=chrlist, 
               geneid=geneid,
               fill.gaps=fill.gaps,
               verbose=verbose
    )
)
return(out)

}




#' Retrieve amplification events from a 'genecnv.obj' generated by 'gene.cnv' function
#' @param genecnv.obj an instance of the class 'genecnv' containing gene level copy number info
#' @param logr.cut (numeric) the log-ratio cutoff above which genes are considered amplified (e.g 2 = 8 copies for amplification and 0.5 copies for deep deletions, in diploid regions)
#' @keywords CNV, segmentation, genes
#' @export
#' @examples
#' 
#' ## validate input data.frames
#' seg <- validate.seg(segdat_lung_ccle)
#' 
#' genecnv.obj <- gene.cnv(seg)
#' 
#' geneampdel <- amp.del(genecnv.obj, logr.cut = 2)
#' 



amp.del <- function(genecnv.obj, logr.cut=2){
    
    amp_list <- apply(genecnv.obj@cnvmat, 1, function(x) names(which(x >= 2)))
    amp_list <- amp_list[which(unlist(lapply(amp_list,length)) > 0)]
    amp_rank <- sort(unlist(lapply(amp_list,length)),decreasing=TRUE)

    del_list <- apply(genecnv.obj@cnvmat, 1, function(x) names(which(x <= -2)))
    del_list <- del_list[which(unlist(lapply(del_list,length)) > 0)]
    del_rank <- sort(unlist(lapply(del_list,length)),decreasing=TRUE)
    
    return(list(amplified.list = amp_list,
                amplified.rank = amp_rank,
                deepdel.list = del_list,
                deepdel.rank = del_rank))
}


