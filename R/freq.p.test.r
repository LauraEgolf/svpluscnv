#' Class to store observed and null distr. as well as ampirical corrected p-values associated with observed values 
#' @param freq.cut (numeric): the value from observed distribution that satisfies certain p-value cutoff
#' @param pvalues (numeric): a vector containing the total number of breakpoints in each sample 
#' @param observed (numeric): vector of observed distribution 
#' @param null (numeric): vector of null distribution
#' @param param (list): a list of parametres provided 
#' @return an instance of the class 'freq.cut'
#' @export
null.freq <- setClass("null.freq", representation(
    freq.cut  = 'numeric',
    pvalues = 'numeric',
    observed = 'numeric',
    null='numeric',
    param = 'list'
))


setMethod("show","null.freq",function(object){
    writeLines(paste("An object of class null.freq from svpluscnv"))
})


#' Obtains significance cutoff for the frequency of binary events encoded in a matrix
#' @param mat (numeric matrix) a binary matrix where columns will be tested for their sum value compared to a permutated matrix
#' @param method (character) the method to pass to p.adjust function
#' @param p.cut (numeric) the cutoff for multiple hypothesis corrected p.value  
#' @param iter (numeric) Number of iterations to produce null distribution (note that null size will be iter*ncol(mat))
#' @param zerofreq (logical) whether to remove bins with observed frequency = 0; It is recommended to set to TRUE when the bins span genomic regions of low coverage   
#' @param plot (logical) whether to generate a histogram comparing observed and null frequency distributions   
#' @return an instance of the class 'freq.cut'
#' @keywords empirical p.value, p.adjust  
#' @export
#' @examples
#' 
#' ## validate input data.frames
#' cnv <- validate.cnv(segdat_lung_ccle)
#' 
#' ## obtain a matrix of genomic bins vs samples indicating high density of breaks
#' shatt.regions <- shattered.regions.cnv(cnv)
#' mat <- shatt.regions@high.density.regions.hc
#' 
#' freq.p.test(mat)



freq.p.test <- function(mat, 
                        method="fdr", 
                        p.cut= 0.05,
                        iter=100,
                        zerofreq=TRUE,
                        plot=TRUE,
                        verbose=TRUE){

stopifnot(is.numeric(mat))

# obtain a frequency vector
highDensitiBinsFreq <- apply(mat,2,sum)

if(zerofreq == TRUE){
    bins.nozero <- names(which(highDensitiBinsFreq > 0))
    mat <- mat[,bins.nozero]
    highDensitiBinsFreq <- highDensitiBinsFreq[bins.nozero]
    if(verbose) message( paste("Testing ",dim(mat)[2],"non-zero bins in ",dim(mat)[1], "samples") )
}else{
    if(verbose) message( paste("Testing ",dim(mat)[2],"bins in ",dim(mat)[1], "samples") )
}


# create null distribution by sample shuffling
highDensitiBinsFreqRandomFreq<-list()
for(i in 1:iter){
    highDensitiBinsRandom<- t(apply(mat,1,sample))
    highDensitiBinsFreqRandomFreq[[i]] <- apply(highDensitiBinsRandom,2,sum)
    }
highDensitiBinsFreqRandomFreqNull <- unlist(highDensitiBinsFreqRandomFreq)
if(zerofreq == TRUE)highDensitiBinsFreqRandomFreqNull[which(highDensitiBinsFreqRandomFreqNull == 0)] <- 1

# obtain the frequency cutoff for statistical significance (e.g. FDR < 0.01)
pvalues <- highDensitiBinsFreq
for(i in 0:max(highDensitiBinsFreq)){
    pvalues[which(highDensitiBinsFreq == i)] <- length(which(highDensitiBinsFreqRandomFreqNull >i))/ length(highDensitiBinsFreqRandomFreqNull)
    }

freq.cut <- min(highDensitiBinsFreq[names(which(p.adjust(pvalues, method=method) < p.cut))])

if(plot == TRUE){
    xstart<- 1
    obsd <- highDensitiBinsFreq[which(highDensitiBinsFreq >= xstart)]
    nulld<- highDensitiBinsFreqRandomFreqNull[which(highDensitiBinsFreqRandomFreqNull >= xstart)]

    max_freq <- max(as.numeric(names(table(obsd))),as.numeric(names(table(nulld))))
    
    h1 <- hist(obsd, breaks=seq(xstart,max_freq,1),plot=FALSE)
    h2 <- hist(nulld, breaks=seq(xstart,max_freq,1),plot=FALSE)
    
    max_density <- max(h1$density,h2$density)
    hist(obsd, breaks=seq(xstart,max_freq,1),col='salmon', border=NA, xlim=c(0,max_freq), ylim=c(0,max_density),
         las=1,cex.axis=1.4,ylab="",prob = TRUE ,main="",xlab="n samples",right = TRUE)
    hist(nulld, breaks=seq(xstart,max_freq,1), add=TRUE,col=scales::alpha('black',.5), 
         border=NA, prob = TRUE)
    legend("top",c("Frequency distr.","Null freq. distr."),
           fill=c('salmon',scales::alpha('black',.5)),border=NA,bty='n',cex=1.1)
    lines(c(freq.cut,freq.cut),c(0,max(h1$density)/2))   # cutoff for statistical significance
    text(freq.cut+max_freq/25,max(h1$density)/3,paste(method, "<", p.cut),srt=90)
}

return(null.freq(
    freq.cut = freq.cut,
    pvalues = pvalues,
    observed = highDensitiBinsFreq,
    null = highDensitiBinsFreqRandomFreqNull,
    param = list(method=method, p.cut= p.cut, iter=iter)
    ))
}


