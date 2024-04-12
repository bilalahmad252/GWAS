#!bin/bash

genotypeFile="/homes/bilala/BedTools/GWAS/raw_data/1KG.EAS.auto.snp.norm.nodup.split.rare002.common015.missing" #!!! Please add your own path here.  "1KG.EAS.auto.snp.norm.nodup.split.rare002.common015.missing" is the prefix of PLINK bed file. 
inbreeding_F_results="/homes/bilala/BedTools/GWAS/Results/inbreeding_F"
prune_results="/homes/bilala/BedTools/GWAS/Results/Filtered_SNPs/Filtered_SNPs.prune.in"
plink \
    --bfile ${genotypeFile} \
    --extract ${prune_results} \
    --het \
    --out ${inbreeding_F_results}/inbreeding_F
    
    #High F may indicate a relatively high level of inbreeding.
    #Low F may suggest the sample DNA was contaminated.
    # --bfile: the prefix of PLINK bed file
    # --extract: the file contains the SNPs that are in high linkage disequilibrium with each other
    # --het: calculate the inbreeding coefficient
    # --out: the output file
    #This script will generate a file named "inbreeding_F.het" in the output directory.
    #The file contains the inbreeding coefficient of each individual.
    #The inbreeding coefficient is calculated as F=(O-H)/E, where O is the observed number of homozygotes, H is the expected number of homozygotes under Hardy-Weinberg equilibrium, and E is the expected number of homozygotes.
    #The inbreeding coefficient ranges from -1 to 1. A positive value indicates inbreeding, while a negative value indicates outbreeding.
    #The closer the value is to 1, the higher the level of inbreeding.
    #The closer the value is to -1, the higher the level of outbreeding/contamination
    #The closer the value is to 0, the lower the level of inbreeding/outbreeding/contamination
    #A commonly used method is to exclude samples with heterozygosity F deviating more than 3 standard deviations (SD) from the mean. 
    #Some studies used a fixed value such as +-0.15 or +-0.2.
    #We will use the default value of 0.1 here
    #The output file will contain the following columns:
    #FID: Family ID
    #IID: Individual ID
    #O(HOM
    #E(HOM)
    #N(NM)
    #F: Inbreeding coefficient
    # Let us include an awk command to filter out the samples with inbreeding coefficient deviating more than 0.1 from the mean.
    awk 'NR>1 && $6 > 0.1 || $6 < -0.1' ${inbreeding_F_results}/inbreeding_F.het > ${inbreeding_F_results}/inbreeding_F_outliers.het