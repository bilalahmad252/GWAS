#!bin/bash
#Format conversion from text to binary and vice versa
#We will keep the only data after pruning

genotypeFile="/homes/bilala/BedTools/GWAS/raw_data/1KG.EAS.auto.snp.norm.nodup.split.rare002.common015.missing" #!!! Please add your own path here.  "1KG.EAS.auto.snp.norm.nodup.split.rare002.common015.missing" is the prefix of PLINK bed file.
pruned_data_text="/homes/bilala/BedTools/GWAS/pruned_data/text_format"
pruned_data_binary="/homes/bilala/BedTools/GWAS/pruned_data/binary_format"
prune_results="/homes/bilala/BedTools/GWAS/Results/Filtered_SNPs/Filtered_SNPs.prune.in"

plink \
    --bfile ${genotypeFile} \
    --extract ${prune_results} \
    --make-bed \
    --out ${pruned_data_binary}/pruned_data_binary

#This script will generate a new PLINK bed file with the prefix "pruned_data" in the output directory.
#The new PLINK bed file will contain the SNPs that are in high linkage disequilibrium with each other.
#The "--make-bed" flag will output the new PLINK bed file in binary format.
#The new PLINK bed file will be used for downstream analysis such as association testing and principal component analysis.
#The pruned data will help to reduce the computational burden and improve the efficiency of the analysis.

#######Take the pruned data from bed to text format#########3
plink \
    --bfile ${pruned_data_binary}/pruned_data_binary \
    --recode \
    --out ${pruned_data_text}/pruned_data_text