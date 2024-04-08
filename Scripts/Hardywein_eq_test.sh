#!bin/bash
#modified by Cloudfield
#This script is used to perform Hardy-Weinberg equilibrium test to filter out SNPs with significant deviation 
#from Hardy-Weinberg equilibrium. The ones with lower p-value are more likely to be false positive.
#We will be using the PLINK software to perform this test.

genotypeFile="/homes/bilala/BedTools/GWAS/raw_data/1KG.EAS.auto.snp.norm.nodup.split.rare002.common015.missing" #!!! Please add your own path here.  "1KG.EAS.auto.snp.norm.nodup.split.rare002.common015.missing" is the prefix of PLINK bed file. 
HARDY_results="/homes/bilala/BedTools/GWAS/Results/HARDY" #!!! Please add your own path here.  "1KG.EAS.auto.snp.norm.nodup.split.rare002.common015.missing" is the prefix of PLINK bed file.


plink \
    --bfile ${genotypeFile} \
    --hardy \
    --out ${HARDY_results}/HARDY