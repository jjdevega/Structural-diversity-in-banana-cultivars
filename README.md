# Characterising subgenome recombination and chromosomal imbalances (introgressions) using Relative Averaged Alignment (RAA) and Relative Coverage (RC) metrics.


This repository contains the code used in the analysis of our paper Higgins et al. [citation TBA], where we delimited population structure and clonal lineages in a diversity panel of 188 banana and plantain accessions from the most common cultivars using admixture, principal component, and phylogenetic analyses. 

**We developed two novel scalable alignment-based methods, named Relative Averaged Alignment (RAA) and Relative Coverage (RC), to infer subgenome composition (AA, AAB, etc.) and interspecific recombination.** 


## Re-use and Cite; how to obtain help

Please reuse our code and ideas. If you use anything in this repository, please cite: Higgins et al. [citation TBA]

If you need help to use or adapt any of these scripts, or to develop your own code on these method ideas, please open an issue in this repository. This will help to create a FAQ that will be of benefit to others.



## Go bananas! Straight-forward detection of introgressions from BAM files (+ evidence the methods work)

In Higgins et al. [citation TBA] we demonstrated RAA and Relative Coverage can *identify subgenome composition and introgressions* with similar results to more complex approaches that rely on SNP databases, which require sequencing a panel of wild ancestors to find private SNPs. Our methods can be used without a panel of ancestors as rely on alignment from the hybrids or allopolyploids in the ancestor reference genomes.

[images and plots to be added here]




## Advantages of alignment-based methods
Ancestry determination (sometimes called ancestry mosaics) are typically built by first identifying SNPs exclusively present in each of the (wild) ancestral subspecies (private SNPs). 
These approaches are costly, both economically (sequencing costs) and time (complex bioinformatic analysis). 

By contrast, we believe these alignment-based methods (RAA and Relative Coverage) offer several advantages over other methods. 
- The alignment-based methods do not require sequencing a large number of donors to find private SNPs exclusive to each donor gene pools.
- The alignment-based methods can be used in closely related gene pools, even within one single species, where private SNPs can be hard to find because of recent divergence. This has allowed us to identify introgressions between indica and japonica rice (Higgins et al. 2021), or between Andean and Mesoamerican beans (in prep).
- The alignment-base methods can be easily scaled up, as they do not require SNP calling and analysis, allowing to quick incorporation in the studies of new diversity panels and the increasing number of long-read genome assemblies.
- On the other hand, the main disadvantage of "Relative Coverage" is it requires experience to distinguish introgressions in low donor ratios.





## Relative Coverage (RC): Protocol


We used comparisons of read depth, which we called Relative Coverage, to identify introgressions. It is key to notice that we do not use SNPs. The method builds on the idea that the reads in a e.g. AAB hybrid need to map twice to the A reference for each one alignment to the B reference *on average* and any deviation from this expectation is indicative of introgressions. 

- After preprocessing reads to obtain clean trimmed reads (e.g. trim_galore), proceed to align with BWA-MEM, using the options -M and -k 35 them to **THE CONCATENATED REFERENCE WITH THE ANCESTORS** (i.e. one reference Fasta from the concatenation of both ancestors Fasta). Chrs names were renamed to indicate origin, e.g. AA_chr1, BB_chr1, etc.

  ```
  cat A_ancestor.fa B_ancestor.fa > AB.fa
  
  bwa index AABB.fa AABB.fa
  
  for myID in $(hybrids_list.txt); do
    bwa mem -M -k 35 -R "@RG\tID:${myID}\tSM:${myID}" -t 1 AB.fa \
     <(gzip -dc ${myID}/basic/*_R1_val_1.fq.gz) <(gzip -dc ${myID}/basic/*_R2_val_2.fq.gz) \
    | samtools view -@ 1 -b -S -h - | samtools sort -@ 1 -T ${myID}.tmp -o ${myID}_AB_sort.bam;
  done;

  
  ```
- BAM files were sorted and duplicated reads were removed. Only uniquely mapped reads were retained by excluding reads with the tags 'XA:Z:' and 'SA:Z:', and further filtered to retain only properly mapped paired reads (-f 0x2).

- BEDtools genomeCoverageBed with the alignments from each sample (BAM input) to obtain a Bedgraph file for each sample.
- BEDtools map to obtain the median of the read coverage or read depth values in the positions within a given 100 Kbp window in the concatenated reference
- All-vs-all every 100 Kbp windows in the A-genome and B-genome were aligned to each other using minimap2 v2.22 (-x asm10) to identify homologous windows
- Plot using R and ggplot


  
NOTE: When the sequence is equal between the two ancestral genomes (e.g. no sequence divergence between A and B ancestors), some reads mapping over the conserved sequences can be assigned to the incorrect donor, so generating a background signal. On average, over a 100Kb window, there is plenty of variation between the references to distinguish background noise from the proportion of mapping reads evaluated, so it does not affect the method significantly. 


## RAA: Protocol
We established a new method, called RAA, by quantifying the normalised relative alignment from each accession to three reference banana genomes, which are representative of the A, B and S genome donors. We called this normalised alignment metric “Relative averaged alignment” (RAA). The RAA accounts for the technical variation between samples and reference bias, ie. the phylogenetic distance between a variety and a genome reference. 


- Preprocessing reads to obtained clean trimmed reads, then 



## Code used in the paper [citation TBA]
The paper's code is organised into two subfolders:

- Folder Introgression_detection: This subfolder contains the code to obtain and plot the new metrics, called *Relative Averaged Alignment (RAA) and Relative Coverage* starting from BAM alignment files (e.g. from BWA or Bowtie) for each sample.

- Folder Population_structure: SNP calling pipeline (based on BWA, GATK and BCFTOOLS); and bash and R code for Principal Component Analysis, phylogenetic analysis and tree plotting, and bash and R scripts to analyse with STRUCTURE 

The code is uploaded as it is, and will require changes to adapt to your needs.

## Plotting code used in the paper [citation TBA]
