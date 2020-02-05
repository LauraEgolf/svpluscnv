---
title: "Introduction to svcnvplys"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Introduction to svcnvplys}
  %\VignetteEngine{knitr::rmarkdown}
  \usepackage[utf8]{inputenc}
---



<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
  document.querySelector("h1").className = "title";
});
</script>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
  var links = document.links;  
  for (var i = 0, linksLength = links.length; i < linksLength; i++)
    if (links[i].hostname != window.location.hostname)
      links[i].target = '_blank';
});
</script>
<style type="text/css" scoped>
body {
  margin: 0px auto;
  max-width: 1134px;
  font-family: sans-serif;
  font-size: 10pt;
}

/* Table of contents style */

div#TOC ul {
  padding: 0px 0px 0px 45px;
  list-style: none;
  background-image: none;
  background-repeat: none;
  background-position: 0;
  font-size: 10pt;
  font-family: Helvetica, Arial, sans-serif;
}

div#TOC > ul {
  padding: 0px 150px 0px 65px;
  font-size: 12pt;
}

div#TOC > ul > li {
  padding: 5px 0px 0px 0px;
}

div#TOC ul ul {
  font-size: 11pt;
}

div#TOC.tocify ul {
  padding: 0px;
  font-size: inherit;
  font-family: inherit;
}

div#TOC.tocify li {
  padding: 5px;
  font-size: inherit;
  font-family: inherit;
}

p, dl {
  padding: 0px 150px 0px 65px;
  text-align: justify;
}

/* vertical content spacing */
p, img, table {
  margin-top: 10px;
  margin-bottom: 10px;
}

/* lists */
ol, ul {
  padding: 0px 150px 0px 100px;
  list-style: square;
}

li ol, li ul {
  padding: 0px 0px 0px 35px;
}

li p {
  padding: 0;
}

pre {
  margin: 0em 150px 0.5em 0em;
  padding: 0px 0px 0px 65px;
  border: 0px none;
  background-color: #f0f0f0;
  white-space: pre;
  overflow-x: auto;
  font-size: 90%;
}

li pre {
  margin: 0em 0px 0.5em -65px;
  padding: 0px 0px 0px 65px;
}
pre code {
  background-color: inherit;
  display: block;
  padding: 10px 10px 10px 0px;
  overflow-x: inherit;
  font-size: 100%;
}

/* markdown v1 */
pre code[class] {
  background-color: inherit;
}

/* markdown v2 */
pre[class] code {
  background-color: inherit;
}

tt, code, pre {
   font-family: 'DejaVu Sans Mono', 'Droid Sans Mono', 'Lucida Console', Consolas, Monaco, monospace;
}

h1, h2, h3, h4, h5, h6 { 
  font-family: Helvetica, Arial, sans-serif;
  margin: 1.2em 150px 0.6em 0em;
/* hanging headings */
  padding-left: 65px;
  text-indent: -65px;
}

h1.title {
  color: #87b13f;
  line-height: 1.1em;
  margin-top: 25px;
  border-bottom: 0px;
}

h1 {
  line-height: 1.4em;
  border-bottom: 1px #1a81c2 solid;
}

h1, h2, h3 {
  color: #1a81c2;
}

h1 {
  font-size: 18.0pt;
}

h2 {
  font-size: 14.5pt;
}

h3, h4 {
  font-size: 12pt;
}

span.header-section-number {
  float: left;
  width: 65px;
}

/* document header */

p.author-name {
  font-size: 14.5pt;
  font-weight: bold;
  font-style: italic;
  text-align: left;
}

.date {
  text-indent: 0px;
  font-weight: bold;
}

.abstract, .package {
  font-weight: bold;
}

/* formatting of inline code */
code { 
  background-color: #f0f0f0;
  color: #404040;
  font-size: 90%;
}

/* figures */

.figure { 
  margin: 0em 0px 0.5em;
}

img {
  max-width: 100%;
  display: block;
  padding: 0px 150px 0px 130px;
}

p > img {
  padding-left: 65px;
  padding-right: 0px;
}

img.smallfigure {
  padding-left: 195px;
  padding-right: 280px;
}

p > img.smallfigure {
  padding-left: 130px;
  padding-right: 130px;
}

img.widefigure {
  padding-left: 65px;
  padding-right: 85px;
  margin-right: -65px;
}

p > img.widefigure {
  padding-left: 0px;
  padding-right: 0px;
  margin-right: -65px;
}

p.caption, caption {
  color: inherit;
  font-size: 8pt;
}

p.caption {
  padding-left: 130px;
  padding-right: 85px;
  margin-bottom: 20px;
}

caption {
  padding: 0px;
  margin-bottom: 10px;
  min-width: 583;
}
span.caption-title {
  color: #1a81c2;
  font-weight: bold;
}

span.caption-label {
  font-weight: bold;
}

/* tables */

table {
  margin-left: 130px;
  margin-right: 85px;
}

.table {
  max-width: 518px;
}

/* definition lists */

dd {
  margin-left: 65px;
  margin-bottom: 10px;
}

/* code folding buttons */

.code-folding-btn {
  position: relative;
  margin-top: -26px;
  top: 26px;
}

.col-md-12 {
  min-height: 0px;
}

/* footnotes as sidenotes */

.sidenote {
  float: right;
  clear: right;
  margin-right: -150px;
  width: 130px;
  margin-top: 0;
  margin-bottom: 1rem;
  font-size: 8pt;
  line-height: 1.3;
  vertical-align: baseline;
  position: relative;
  text-align: left;
}

.sidenote-number, .affil-mark {
  position: relative;
  vertical-align: super;
  font-size: 7.5pt;
  font-weight: normal;
  font-style: normal;
  line-height: normal;
}

input.margin-toggle { display: none; }

label.sidenote-number { display: inline; }

label.margin-toggle:not(.sidenote-number) { display: none; }

/* Class described in https://benjeffrey.com/posts/pandoc-syntax-highlighting-css
   Colours from https://gist.github.com/robsimmons/1172277 */

code > span.kw { color: #E07020; } /* Function calls */
code > span.dt { color: #404040; } /* Function args */
code > span.dv { color: #D02070; } /* DecVal (decimal values) */
code > span.bn { color: #d14; } /* BaseN */
code > span.fl { color: #D02070; } /* Float */
code > span.ch { color: #40A040; } /* Char */
code > span.st { color: #40A040; } /* String */
code > span.co { color: #808080; font-style: italic; } /* Comment */
code > span.ot { color: #2020F0; } /* Keywords */
code > span.al { color: #ff0000; font-weight: bold; } /* AlertToken */
code > span.fu { color: #E07020; } /* Function calls */ 
code > span.er { color: #FF0000; } /* ErrorTok */

code > span.identifier { color: #404040; }
code > span.number { color: #D02070; }
code > span.string { color: #40A040; }
code > span.comment { color: #808080; font-style: italic; }
code > span.keyword { color: #2020F0; }
code > span.literal { color: #2020F0; }
code > span.operator { color: #000000;}
code > span.paren { color: #000000;}

/* proper positioning of ggplotly graphics, see https://support.bioconductor.org/p/97609/ */

.js-plotly-plot .plotly {
  padding-left: 65px;
}
</style>
  


## svncvplus: R toolkit for the analysis of structural variants and complex genomic rearrangements

`svncvplus` is an R package designed for integrative analyses of somatic DNA copy number variations (CNV) and other structural variants (SV).`svcnvplus` comprises multiple analytical and visualization tools that can be applied to large datasets from cancer patients such as [TCGA](https://www.cancer.gov/about-nci/organization/ccg/research/structural-genomics/tcga) and cancer cell lines [CCLE](https://portals.broadinstitute.org/ccle).
  
CNV data can be derived from genotyping and CGH arrays, as well as next generation sequencing; different segmentation algorithms are used to obtain dosage variations (gains and losses) across the genome. Alternatively, SV calls can be inferred from discordantly aligned reads from whole genome sequencing (WGS) using different algorithms (e.g [manta](https://github.com/Illumina/manta)[], [lumpy](https://github.com/arq5x/lumpy-sv), etc).
  
SV calls provide linkage information from discordantly aligned reads and read pairs, allowing the discovery of chromosomal translocations and variants that do not necessarily involve dosage change, such as inversions and insertions. Segmentation CNVs and alignment based SV calls produce orthogonal as well as complementary results. The integration of both data types can by highly informative to understand the somatic alterations driving many cancers and is essential to characterize complex chromosomal alterations such as chromothripsis and chromoplexy.
  
Most currently available cancer genomics datasets incorporate CNV characterization whereas SVs (derived from WGS) are scarcer. For this reason, `svcnvplus` tools implement functions that work with both data types separately as well as integrated.


## Index:

* [Install svcnvplus](#install-svcnvplus)
* [Input data](#input-data)
* [Validate data types](#validate-data-types)
    * [Validate segmentation data format](#validate-segmentation-data-format)
    * [Validate structural variant data format](#validate-structural-variant-data-format)
* [CNV analysys and visualization](#cnv-analysys-and-visualization)
    * [CNV frequency plot](#cnv-frequency-plot)
    * [Chromosome arm CNV determination](#chromosome-arm-cnv-determination)
* [Assessment of chromosomal instability](#assessment-of-chromosomal-instability)
    * [Percent genome change](#percent-genome-change)
    * [Breakpoint burden analysis](#breakpoint-burden-analysis)
* [Co-localization of breakpoints](#co\-localization-of-breakpoints)
* [Identification of shattered regions](#identification-of-shattered-regions)
    * [Chromosome shattering combining SV and CNV](#chromosome-shattering-using-sv-and-cnv)
    * [Chromosome shattering using CNV data only](#chromosome-shattering-using-cnv-data-only)
    * [Visualization of shattered regions](#visualization-of-shattered-regions)
    * [Recurrently shattered regions](#recurrently-shattered-regions)
* [Recurrently altered genes](#recurrently-altered-genes)
    * [Gene level CNV](#gene-level-cnv)
    * [Recurrently altered genes overlapping with SV and CNV breakpoints](#recurrently-altered-genes-overlapping-with-sv-and-cnv-breakpoints)
    * [Integrated visualization of SVs and CNV in recurrently altered genes](#integrated-visualization-of-svs-and-cnv-in-recurrently-altered-genes)

------------

## Install svcnvplus

Install development version from GitHub

```r
devtools::install_github("gonzolgarcia/svcnvplus")
```



## Input data

Two data types are allowed:
  
__CNV segmentation data:__ 6 columns are required in the folowing order: `sample`, `chrom`, `start`, `end`, `probes` & `segmean`. Most algorithms studying CNVs produce segmented data indicating genomic boundaries and the segment mean copy number value (segmean); `svcnvplus` assumes CNV expresed as log-ratios: __e.g.:__ $\log2(tumor/normal)$ Those values do not necesarily represent entire copy number states as many samples may contain admixture or subclonal populations.
  
__Structural Variant calls:__ 8 columns are required in the folowing order: `sample`, `chrom1`, `pos1`, `strand1`, `chrom2`, `pos2`, `strand2` & `svclass`. SV calls are obtained from WGS by identifying reads and read-pairs that align discordantly to the reference genome. The types accepted in the svclass field are: duplication(DUP), deletion(DEL), inversion(INV), insertion(INS), translocation(TRA) and breakend(BND) for undefined variants.
  
All functions accept multiple samples. Functions that make use of both CNV and SV calls expect a common set of ids in the `sample` field.
  
In order to explore the  functionalities of svcnvplus, two datasets have been included with the package:
  
* CCLE lung cancer derived cell lines <https://depmap.org/portal/download/>; Two data.frames contain information about CNV segments and structural variants respectively:
    * `svcnvplus::segdat_lung_ccle`
    * `svcnvplus::svdat_lung_ccle`
* [TARGET neuroblastoma dataset](https://ocg.cancer.gov/programs/target) based on Complete Genomics WGS and structural variant calls:
    * `svcnvplus::nbl_segdat`
    * `svcnvplus::nbl_svdat`  
Both datasets are `lazy` loaded with `svcnvplus`


```r
library(svcnvplus)
head(nbl_segdat)
```

```
##   Sample Chromosome    Start      End Num_markers  Seg_CN
## 1 PAISNS          1    11000   833000         337 -0.0270
## 2 PAISNS          1   835000  2715000         916 -1.0257
## 3 PAISNS          1  2717000  5969000        1552 -0.8316
## 4 PAISNS          1  5971000 12481000        3256 -0.9593
## 5 PAISNS          1 12483000 12777000         148 -0.2305
## 6 PAISNS          1 12779000 15551000        1287 -0.0083
```

```r
head(nbl_svdat)
```

```
##   TARGET.USI LeftChr LeftPosition LeftStrand RightChr RightPosition RightStrand Type
## 1     PAISNS    chr1     12481576          -     chr7     123358964           +  TRA
## 2     PAISNS    chr1    120543859          -     chr2      65103235           -  TRA
## 3     PAISNS    chr2    231680218          +    chr21      40045998           +  TRA
## 4     PAISNS    chr3     54814482          -    chr17      42657036           +  TRA
## 5     PAISNS    chr4     97761321          -     chr4      97765146           +  INV
## 6     PAISNS    chr4    190936134          +     chr9      68411170           +  TRA
```

## Validate data types

* `validate.cnv()` segmentation data.frame parser
* `validate.svc()` structural variant data.frame parser

### Validate segmentation data format

Validate and reformat CNV segmentation `data.frame` to be used by svcnvplus tools


```r
cnvdf <- validate.cnv(nbl_segdat)
head(cnvdf)
```

```
##   sample chrom    start      end probes segmean
## 1 PAISNS  chr1    11000   833000    337 -0.0270
## 2 PAISNS  chr1   835000  2715000    916 -1.0257
## 3 PAISNS  chr1  2717000  5969000   1552 -0.8316
## 4 PAISNS  chr1  5971000 12481000   3256 -0.9593
## 5 PAISNS  chr1 12483000 12777000    148 -0.2305
## 6 PAISNS  chr1 12779000 15551000   1287 -0.0083
```


### Validate structural variant data format 

Validate and format structural variant `data.frame` to be used by svcnvplus tools


```r
svcdf <- validate.svc(nbl_svdat)
head(svcdf)
```

```
##   sample chrom1      pos1 strand1 chrom2      pos2 strand2 svclass
## 1 PAISNS   chr1  12481576       -   chr7 123358964       +     TRA
## 2 PAISNS   chr1 120543859       -   chr2  65103235       -     TRA
## 3 PAISNS   chr2 231680218       +  chr21  40045998       +     TRA
## 4 PAISNS   chr3  54814482       -  chr17  42657036       +     TRA
## 5 PAISNS   chr4  97761321       -   chr4  97765146       +     INV
## 6 PAISNS   chr4 190936134       +   chr9  68411170       +     TRA
```

## CNV analysys and visualization

### CNV frequency plot

Visualization of CNV gain/loss frequencies across the genome; aggregates samples for a given genomic window size, which copy number log-ratio differs from 0. The thresshold `fc.pct` is represented as percentage (e.g. 0.2 -> 20% fold change compared to the referece).


```r
cnv_freq <- cnv.freq(cnvdf, fc.pct = 0.2, plot=TRUE)  # plot cnv frequencies
```

<img src="figure/plot1-1.png" title="Genome wide CNV frequencies" alt="Genome wide CNV frequencies" style="display: block; margin: auto;" />


```r
head(cnv_freq$freqsum)  # data.frame contains every genomic bin 
```

```
##                       chr   start     end freq.gains freq.loss
## chr1_11000_1011000   chr1   11000 1011000 0.02962963 0.3333333
## chr1_1011000_2011000 chr1 1011000 2011000 0.02962963 0.3333333
## chr1_2011000_3011000 chr1 2011000 3011000 0.02222222 0.3333333
## chr1_3011000_4011000 chr1 3011000 4011000 0.02222222 0.3333333
## chr1_4011000_5011000 chr1 4011000 5011000 0.02222222 0.3407407
## chr1_5011000_6011000 chr1 5011000 6011000 0.02222222 0.3407407
```


### Chromosome arm CNV determination

The function `chr.arm.cnv` obtains the segment weighted average log-ratios for each chromosome arm and sample; it returns a matrix formated output.


```r
charm.mat <- chr.arm.cnv(cnvdf, genome.v = "hg19", verbose = FALSE)

# heatmap plot of chromosome arm level CNV
require(gplots,quietly = TRUE,warn.conflicts = FALSE)
heatmap.2(charm.mat[order(rownames(charm.mat))[1:42],],Rowv=NA,trace='none',cexCol=.5, lhei=c(0.25,1), dendrogram='col', key.title="Copy number",
        col=colorRampPalette(c("blue","white","red"))(256))
```

<img src="figure/plot1.2-1.png" title="SV versus CNV breakpoint burden" alt="SV versus CNV breakpoint burden" style="display: block; margin: auto;" />

## Assessment of chromosomal instability

Chromosomal instability (CIN) is common in cancer and has a fundamental pathogenic role. CNV profiles allow quantification of this events by evaluating the percentage of the genome  copy number differing from diploid or the burden of genomic alterations in a given sample.

### Percent genome change

Per sample measure of genome instability; calculates what percentage of the genome's copy number log2-ratio differs from 0 (aka. diploid for autosomal chromosomes) above a certain threshold.


```r
pct_change <- pct.genome.changed(cnvdf, fc.pct = 0.2)
head(pct_change)
```

```
##       PAISNS       PAIVZR       PAIXFZ       PAKZRH       PALKXJ       PALNVP 
## 0.2449286786 0.0439952736 0.0003125753 0.0004199808 0.4302685820 0.2972370088
```

### Breakpoint burden analysis

In addition to percentage of genome changed, we can measure the total burden of breakpoints derived from CNV segmention and SV calls. Both the percent genome change and breakpoint burden measures are expected to show positive correlation.


```r
# define breakpoints from SV data
svc_breaks  <- svc.breaks(svcdf)  

# define breakpoints from cnv data based on certain CNV log-ratio change cutoff
cnv_breaks  <- cnv.breaks(cnvdf,fc.pct = 0.2,verbose=FALSE)  

# scatter plot comparing CNV and SV breakpoint burden and percent genome changed, for a set of common samples
common_samples <- intersect(names(svc_breaks@burden),names(cnv_breaks@burden))

dat1 <- log2(1+cbind(svc_breaks@burden[common_samples],
                    cnv_breaks@burden[common_samples]))

dat2 <- log2(1+cbind(pct_change, 
                     cnv_breaks@burden[names(pct_change)]))

par(mfrow=c(1,2))
plot(dat1, xlab="log2(1+SV break count)", ylab="log2(1+CNV break count)")
legend("bottomright",paste("Pearson's cor=",sprintf("%.2f",cor(dat1)[1,2]), sep=""))
plot(dat2, xlab="percentage genome changed", ylab="log2(1+CNV break count)")
legend("bottomright",paste("Pearson's cor=",sprintf("%.2f",cor(dat2)[1,2]), sep=""))
```

<img src="figure/plot2-1.png" title="SV versus CNV breakpoint burden" alt="SV versus CNV breakpoint burden" style="display: block; margin: auto;" />



## Co-localization of breakpoints

Both CNV segmentation profiles and SV calls produce orthogonal results for variants that involve dosage changes (duplications and deletions). The function `match.breaks` compares the breakpoints derived from both approaches by identifying their co-localizing. This function can also be used to compare two sets of CNV brekpoints obtaind from different algorithms or SV callers since the format of both CNV and SV breaks objects have the same format within `svcnvplus`.


```r
common.breaks <- match.breaks(cnv_breaks, svc_breaks, 
                              maxgap=100000, verbose=FALSE)

# average percentage of colocalizing breaks
restab <- data.frame(common.breaks$restab)[order(common.breaks$restab$total.brk2),]
m2 <- sprintf("%.1f",100*mean(restab$matched.brk2/restab$total.brk2)) 

# Plot the proportion of SV breakpoints that have colocalizing CNV breakpoints
# This analysis has animportant quality control use case by identifying samples with low number of orthogonaly validated breakpoints
barplot(rbind(restab$matched.brk2, restab$total.brk2 - restab$matched.brk2),
        border=NA,las=2,xlab="",horiz=FALSE,cex.main=.7,cex.names=.4, names=rownames(restab))
legend("top",paste("SV breaks matched by CNV breaks\n","Average = ",m2,"%",sep=""),bty='n')
grid(ny=NULL,nx=NA)
```

<img src="figure/plot3-1.png" title="Common breakpoints by sample" alt="Common breakpoints by sample" style="display: block; margin: auto;" />


## Identification of shattered regions

Complex chromosomal rearrangements such as chromothripsis and chromoplexy are widespread events in many cancers and may have important pathogenic roles. `svcnvplus` incorporates tools to map and visualize shattered regions across multiple samples.

We used LUNG cancer cell line profiles from the CCLE in order to illustrate these tools:

Validate segmentation and SV data.frames

```r
cnvdf <- validate.cnv(segdat_lung_ccle)
# remove likely artifacts from segmentation data and fill gaps in the segmentation data (optional)
cnvdf_clean <- clean.cnv.artifact(cnvdf, verbose=FALSE,n.reps = 4,fill.gaps = TRUE)  

svcdf <- validate.svc(svdat_lung_ccle)
```

### Chromosome shattering combining SV and CNV 

1) Identification of genomic bins with high density of breakpoints
    * The genome is binned into 10Mb windows (`window.size == 10`) and slide into 2Mb (`slide.size == 2`).
    * Breakpoints are defined using `cnv.breaks` (CNV), `svc.breaks` (SV) and `match.breaks` (common) and then mapped into bins; minimum thresholds are set using `num.cnv.breaks = 6`, `num.svc.breaks = 6` and `num.common.breaks = 3` respectively.
    * The number of breaks must be of shattered regions are spected to be out-liers therefor the n times above the average in each sample can be defined using `num.cnv.sd = 5`, `num.svc.sd = 5` and `num.common.sd = 0`

2) Identification if shattered regions
    * Contiguous bins with high density of breakpoints are collapsed into shattered regions
    * To discard complex focal events such as circular amplifications or double minutes, the interquartile average of the distances between breaks is set to `dist.iqm.cut = 150000`.
    * Finally, shattered regions such as chromothripsis and chromoplexy produce interleaved SVs. We set the percentage of interleaved SVs with `interleaved.cut = 0.33` to discard regions with less than 33% interleaved variants.

(more info `?shattered.regions`)


```r
shatt_lung <- shattered.regions(cnvdf, svcdf, fc.pct = 0.1,  min.num.probes = 3, clean.brk = 4,
                                window.size = 10, slide.size = 2, num.cnv.breaks = 5, 
                                num.cnv.sd = 3, num.svc.breaks = 5, num.svc.sd = 3, 
                                num.common.breaks = 2, num.common.sd = 0, interleaved.cut = 0.33,
                                dist.iqm.cut = 100000,verbose=FALSE)
shatt_lung
```

```
## An object of class chromo.regs from svcnvplus containing the following stats: 
## Number of samples tested= 97 
## Number of samples with shattered regions= 93 
## Number of samples with high-confidence shattered regions= 84 
## Number of samples with low-confidence shattered regions= 75
```

### Chromosome shattering using CNV data only

A simplified version of `shattered regions` uses only CNV segmentation data, which is available in more often and in larger datasets. The `shattered.regions.cnv` follows the same approach but disregards parameters that are only available for SV data.


```r
# our example data is derived from cell lines and may contain germline common CNVs, for this reason we use the filtered version 'cnvdf_clean' obtained above
shatt_lung_cnv <- shattered.regions.cnv(cnvdf_clean, fc.pct = 0.1, clean.brk = 4, window.size = 10,
                                        min.num.probes = 3, slide.size = 2,num.breaks = 7, 
                                        num.sd = 5, dist.iqm.cut = 100000,verbose=FALSE,)
shatt_lung_cnv
```

```
## An object of class chromo.regs from svcnvplus containing the following stats: 
## Number of samples tested= 185 
## Number of samples with shattered regions= 184 
## Number of samples with high-confidence shattered regions= 183 
## Number of samples with low-confidence shattered regions= 134
```
 
### Visualization of shattered regions

Circos plotting is available via [circlize](https://cran.r-project.org/web/packages/circlize/index.html) package wrapper function  `circ.chromo.plot`, which takes an object generated by `shattered.regions` function. The circular plot represents (inward to outward): Structural variants, CNVs, shattered regions (purple) and the ideogram. 


```r
# plotting functions are available for whole genome and chromosomes with shattered regions (both combined CNV and SV and CNV only) 
par(mfrow=c(1,3))
circ.wg.plot(cnvdf,svcdf,sample.id = "SCLC21H_LUNG")
circ.chromo.plot(shatt_lung_cnv,sample.id = "SCLC21H_LUNG")
circ.chromo.plot(shatt_lung,sample.id = "SCLC21H_LUNG")
```

<img src="figure/plot4.1-1.png" title="Circos plot representing c LUNG cancer cell lines with chromothripsis" alt="Circos plot representing c LUNG cancer cell lines with chromothripsis" style="display: block; margin: auto;" />





### Recurrently shattered regions

To establish whether certain regions suffer chromosome shattering above expectation, we evaluate the null hypothesis that shattered regions occur throughout the genome at random; To this end we first create an empirical null distribution based on the sample set under study. The null is then compared with the observed distribution (`shatt_lung_cnv$high.density.regions.hc`) to obtain empirical adjusted p-values. The bins with corrected p-values deemed statistically significant define regions under selection pressure for chromosome shattering. Since the genomic bins might span low coverage regions where no CNV or SVs are mapped we removed remove bins with frequency = 0 setting the `zerofreq=TRUE`.


```r
null.test <- freq.p.test(shatt_lung@high.density.regions.hc, 
                         method="fdr", p.cut = 0.05)
```

<img src="figure/plot4.2-1.png" title="Circos plot representing c LUNG cancer cell lines with chromothripsis" alt="Circos plot representing c LUNG cancer cell lines with chromothripsis" style="display: block; margin: auto;" />


plot(density(null.test@observed),col="salmon")

We can visualize the aggregate map of shattered regions for all samples with `shattered.map.plot`. The peaks that rise above `null.test$freq.cut` define recurrently shattered regions


```r
shattered.map.plot(shatt_lung, freq.cut = null.test@freq.cut)
```

<img src="figure/plot5-1.png" title="Recurrently shattered regions map" alt="Recurrently shattered regions map" style="display: block; margin: auto;" />

And finally collect groups of samples with recurrent shattered regions as defined by the empirical test described above. 


```r
# obtain genomic bins within above the FDR cutoff

hotspots <- hot.spot.samples(shatt_lung, freq.cut=null.test@freq.cut)
hotspots$peakRegionsSamples
```

```
## $`chr1 30061735 48061735`
##  [1] "COLO668_LUNG"  "CORL24_LUNG"   "CORL88_LUNG"   "NCIH1184_LUNG" "NCIH1694_LUNG" "NCIH1836_LUNG" "NCIH1963_LUNG" "NCIH2122_LUNG" "NCIH510_LUNG" 
## [10] "NCIH520_LUNG"  "NCIH889_LUNG" 
## 
## $`chr8 32031254 46031254`
##  [1] "CHAGOK1_LUNG"  "NCIH1105_LUNG" "NCIH1184_LUNG" "NCIH1435_LUNG" "NCIH1437_LUNG" "NCIH1618_LUNG" "NCIH1869_LUNG" "NCIH1876_LUNG" "NCIH520_LUNG" 
## [10] "SCLC21H_LUNG" 
## 
## $`chr8 120031254 138031254`
##  [1] "CORL23_LUNG"   "CORL311_LUNG"  "HCC44_LUNG"    "HCC827_LUNG"   "NCIH1869_LUNG" "NCIH2122_LUNG" "NCIH2171_LUNG" "NCIH23_LUNG"   "NCIH446_LUNG" 
## [10] "NCIH460_LUNG"  "NCIH510_LUNG"  "SCLC21H_LUNG" 
## 
## $`chr12 24150442 34150442`
## [1] "CORL23_LUNG"   "NCIH1437_LUNG" "NCIH1793_LUNG" "NCIH1836_LUNG" "NCIH2171_LUNG" "NCIH661_LUNG"  "NCIH69_LUNG"   "NCIH889_LUNG"
```

```r
chr8p <- hotspots$peakRegionsSamples[[3]]
```

Beyond this point the user can test case/control hipothesys for chromosome shattering of specific genomic regions within the dataset under study.


## Recurrently altered genes

Somatic pathogenic variants are characterized by presenting in recurrent patterns. Evaluating the recurrence of structural variations involve challenges as their interpretation more complicated than other variant types (e.g. SNVs). We evaluate the recurrence of structural variants using two criteria: dosage changes at the gene level and analysis of breakpoints overlapping with known genes.

### Gene level CNV

The function `gene.cnv` generates a matrix with gene level CNVs from a segmentation. The gene CNV matrix can be queried using `amp.del` to obtain the ranking of amplifications and deep deletions.


```r
# obtain gene level CNV data as the average log ratio of each gene's overlapping CNV segments
genecnv_data <- gene.cnv(cnvdf_clean,genome.v = "hg19",fill.gaps = FALSE,verbose=FALSE)
# retrieve amplifications and deep deletion events using a log-ratio cutoff = +- 2
amp_del_genes <- amp.del(genecnv_data, logr.cut = 2)
```

The output of the function `amp.del` contains a ranking of genes based on the number of amplification and deletion events as well as lists containing the sample ids that can be used to build oncoprints or other visualizations. We can simply visualize the top of the ranking as below:


```r
par(mfrow=c(1,2),mar=c(4,7,1,1))
barplot(amp_del_genes$amplified.rank[1:20],col="red",
        las=1,main="Amplified genes",horiz=TRUE,xlab="#samples")
barplot(amp_del_genes$deepdel.rank[1:20],col="blue",
        las=1,main="Candidate homozigously deleted genes",horiz=TRUE,xlab="#samples")
```

<img src="figure/plot6-1.png" title="Recurrently altered genes with overlapping CNV breakpoints" alt="Recurrently altered genes with overlapping CNV breakpoints" style="display: block; margin: auto;" />



### Recurrently altered genes overlapping with SV and CNV breakpoints

Instead of focusing on high-level dosage changes, we evaluate whether CNV breakpoints overlap with known genes or upstream regions (gene level CNVs are studied [above](#gene-level-cnv)). `cnv.break.annot` evaluates segmentation data and returns a list of genes and associated breakpoints that can be retrieved for further analyses. In addition every gene is associated via list to the sample ids harboring the variants.


```r
results_cnv <- cnv.break.annot(cnvdf, 
                               fc.pct = 0.2, genome.v="hg19",clean.brk = 8,upstr = 100000,verbose=FALSE)
```
SV calls do not incorporate dosage information, therefore we study the localization of breakpoints with respect to known genes. The annotation identifies small segmental variants overlapping with genes. For translocations (TRA) and large segmental variants (default > 200Kb) only the breakpoint overlap with genes are considered. `svc.break.annot` returns a list of genes and associated variants that can be retrieved for further analyses. In addition, every gene is associated via list to the sample ids harboring variants.


```r
results_svc <- svc.break.annot(svcdf, svc.seg.size = 200000, genome.v="hg19",upstr = 100000, verbose=FALSE)
```

We can then integrate results obtained from scanning SV and CNV breks using the 'merge2lists' function 

```r
# intersect elements from two lists
disruptSamples <- merge2lists(results_cnv@disruptSamples,results_svc@disruptSamples, fun="intersect")
upstreamSamples <- merge2lists(results_cnv@upstreamSamples,results_svc@upstreamSamples, fun="intersect")

# plot a ranking of recurrently altered genes
par(mar=c(5,10,1,1),mfrow=c(1,2))
barplot(rev(sort(unlist(lapply(disruptSamples,length)),decreasing=T)[1:20]),horiz=T,las=1)
```

```
## Error in barplot.default(rev(sort(unlist(lapply(disruptSamples, length)), : 'height' must be a vector or a matrix
```

```r
barplot(rev(sort(unlist(lapply(upstreamSamples,length)),decreasing=T)[1:20]),horiz=T,las=1)
```

```
## Error in barplot.default(rev(sort(unlist(lapply(upstreamSamples, length)), : 'height' must be a vector or a matrix
```



### Integrated visualization of SVs and CNV in recurrently altered genes

Integrating segmentation and SV calls is critical to understand the role of structural variants in recurrently altered genes. `svcnvplus` includes an integrated visualization tool `svc.model.view` that overlays data from CNV segmentation data and SV calls. This function allows to glance all variants affecting a specified genomic region (e.g. gene locus). This functionality is complemented with a genomic track plot function (`gene.track.view`) that can be used to build layouts; The `gene.track.view` function can also be used to retrieve information about isoforms and exonic regions of each gene.


```r
# we use gene.track.view to obtain the start and end positions of our gene of interests PTPRD (one of the top altered genes shown above)
gene <- "PTPRD"
df <- gene.track.view(symbol = gene, plot=FALSE, genome.v = "hg19")$df
start <- min(df$txStart) - 200000
stop <- max(df$txEnd) + 50000
chr <- df$chrom[1]

#  The function `svc.model.view` has builtin breakpoint search capabilities. 
# The argument 'sampleids' allows selecting the list of samples to be show; if null, 
# samples with breakpoints will be searched in the defined genomic region
# In this case we are using the list of samples with SV breakpoints disrupting PTPRD as determined with `svc.break.annot`

sampleids <- sort(results_svc@disruptSamples[[gene]])

# We build a layout to combine `svc.model.view` and `gene.track.view` using the same set of genomic coordinates
layout(matrix(c(1,1,2,2),2,2 ,byrow = TRUE),heights = c(8,2))
par(mar=c(0,10,1,1))
sv.model.view(svcdf, cnvdf[which(cnvdf$sample %in% svcdf$sample),], chr, start, stop, sampleids=sampleids, 
              addlegend = 'both', addtext=c("TRA"), cnvlim = c(-2,2), 
              cex=.7,cex.text =.8, summary = FALSE)
gene.track.view(chr=chr ,start=start, stop=stop, addtext=TRUE, cex.text=1, 
                summary = FALSE)
```

<img src="figure/plot9-1.png" title="Visualizaion of structural variants in PTPRD" alt="Visualizaion of structural variants in PTPRD" style="display: block; margin: auto;" />
    

