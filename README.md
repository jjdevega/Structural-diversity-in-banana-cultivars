# Characterising subgenome recombination and chromosomal imbalances in banana varietal lineages


This repository contains the code used in the analysis of our paper Higgins et al. [citation TBA]. Please read the Methods in the paper

We delimited population structure and clonal lineages in a diversity panel of 188 banana and plantain accessions from the most common cultivars using admixture, principal component, and phylogenetic analyses. We used new scalable alignment-based methods, Relative Averaged Alignment (RAA) and Relative Coverage, to infer subgenome composition (AA, AAB, etc.) and interspecific recombination. 

The code is organised into two subfolders:


- Introgression_detection: This subfolder contains the code to obtain and plot the new metrics, called *Relative Averaged Alignment (RAA) and Relative Coverage* starting from BAM alignment files (e.g. from BWA or Bowtie) for each sample.

- Population_structure: SNP calling pipeline (based on BWA, GATK and BCFTOOLS); and bash and R code for Principal Component Analysis, phylogenetic analysis and tree plotting, and bash and R scripts to analyse with STRUCTURE 



## Relative Averaged Alignment (RAA) and Relative Coverage

In Higgins et al. [citation TBA] we demonstrated alignment-based RAA and Relative Coverage can *identify subgenome composition and introgressions* with similar results to more complex approaches based on SNP databases. Our species-agnostic methods can be used without sequencing a panel of wild ancestors to find private SNPs, or in recently diverged pools where private SNPs are uncommon. 

Ancestry determination (sometimes called ancestry mosaics) are typically built by firstly identifying SNPs exclusively present in each of the (wild) ancestral subspecies (private SNPs). These is costly, both economically (sequencing costs) and time (complex bioinformatic analysis). 

### RAA
We established a new method, called RAA, by quantifying the normalised relative alignment from each accession to three reference banana genomes, which are representative of the A, B and S genome donors. We called this normalised alignment metric “Relative averaged alignment” (RAA). The RAA accounts for the technical variation between samples and reference bias, ie. the phylogenetic distance between a variety and a genome reference. 

### RC

We used comparisons of read depth, which we called Relative Coverage, to identify introgressions. 

### Advantages

We believe our alignment-based methods (RAA and Relative Coverage) offer several advantages: 
- The alignment-based methods do not require sequencing a large number of donors to find private SNPs exclusive to each donor gene pools.
- The alignment-based methods can be used in closely related gene pools, even within one single species, where private SNPs can be hard to find because of recent divergence. This has allowed us to identify introgressions between indica and japonica rice (Higgins et al. 2021), or between Andean and Mesoamerican beans (in prep).
- The alignment-base methods can be easily scaled up, as they do not require SNP calling and analysis, allowing to quick incorporation in the studies of new diversity panels and the increasing number of long-read genome assemblies. On the other hand, the main disadvantage of Relative Coverage is it requires experience to distinguish introgressions in low donor ratios.



### Protocol

- Preprocessing reads to obtained clean trimmed reads, then align with BWA-MEM v0.7.17, using the options -M and -k 35 them to **THE CONCATENATED REFERENCE WITH THE ANCESTORS** (i.e. one reference Fasta from the concatenation of both ancestors Fasta). Chrs names were renamed to indicate origin, e.g. AA_chr1, BB_chr1, etc.
- BAM files were sorted and duplicated reads were removed. Only uniquely mapped reads were retained by excluding reads with the tags 'XA:Z:' and 'SA:Z:', and further filtered to retain only properly mapped paired reads (-f 0x2).
- BEDtools genomeCoverageBed with the alignments from each sample (BAM input) to obtain a Bedgraph file for each sample.
- BEDtools map to obtain the median of the read coverage or read depth values in the positions within a given 100 Kbp window in the concatenated reference
- All-vs-all every 100 Kbp windows in the A-genome and B-genome were aligned to each other using minimap2 v2.22 (-x asm10) to identify homologous windows
- Plot using R and ggplot
