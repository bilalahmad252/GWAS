#!bin/bash
#modified by Cloudfield

genotypeFile="/homes/bilala/BedTools/GWAS/raw_data/1KG.EAS.auto.snp.norm.nodup.split.rare002.common015.missing" #!!! Please add your own path here.  "1KG.EAS.auto.snp.norm.nodup.split.rare002.common015.missing" is the prefix of PLINK bed file. 
MAF_results="/homes/bilala/BedTools/GWAS/Results/MAF" #!!! Please add your own path here.  "1KG.EAS.auto.snp.norm.nodup.split.rare002.common015.missing" is the prefix of PLINK bed file.
plink \
    --bfile ${genotypeFile} \
    --freq \
    --out ${MAF_results}/MAF

    # --bfile: the prefix of PLINK bed file
    # --freq: calculate the missing rate or minor allele frequency
    # --out: the output file
