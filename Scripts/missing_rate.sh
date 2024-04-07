#!bin/bash
#modified by Cloudfield

genotypeFile="/homes/bilala/BedTools/GWAS/raw_data/1KG.EAS.auto.snp.norm.nodup.split.rare002.common015.missing" #!!! Please add your own path here.  "1KG.EAS.auto.snp.norm.nodup.split.rare002.common015.missing" is the prefix of PLINK bed file. 
missinf_rate_results="/homes/bilala/BedTools/GWAS/Results/missing_rate" #!!! Please add your own path here.  "1KG.EAS.auto.snp.norm.nodup.split.rare002.common015.missing" is the prefix of PLINK bed file.
plink \
    --bfile ${genotypeFile} \
    --missing \
    --out ${missinf_rate_results}/missing_rate

    # --bfile: the prefix of PLINK bed file
    # --missing: calculate the missing rate
    # --out: the output file
    #This script will generate a file named "missing_rate.imiss" in the output directory. 
    #The file contains the missing rate of each individual. imiss is the abbreviation of individual missing rate.
    #The other file will be named "missing_rate.lmiss". 
    #It contains the missing rate of each SNP. 
    #lmiss is the abbreviation of locus missing rate.