#!bin/bash
#We do not need to keep the SNPs that are in high linkage disequilibrium with each other.
#We will use the PLINK software to perform this test.
#--maf 0.01 : exlcude snps with maf<0.01
#--geno 0.02 :filters out all variants with missing rates exceeding 0.02
#--mind 0.02 :filters out all samples with missing rates exceeding 0.02
#--hwe 1e-6 : filters out all variants which have Hardy-Weinberg equilibrium exact test p-value below the
#To keep the SNPs that are in high linkage disequilibrium with each other, 
#we will use the parameter --indep-pairwise 50 5 0.2
genotypeFile="/homes/bilala/BedTools/GWAS/raw_data/1KG.EAS.auto.snp.norm.nodup.split.rare002.common015.missing" #!!! Please add your own path here.  "1KG.EAS.auto.snp.norm.nodup.split.rare002.common015.missing" is the prefix of PLINK bed file. 
Filtered_SNPs="/homes/bilala/BedTools/GWAS/Results/Filtered_SNPs"

plink \
    --bfile ${genotypeFile} \
    --maf 0.01 \
    --geno 0.02 \
    --mind 0.02 \
    --hwe 1e-6 \
    --indep-pairwise 50 5 0.2 \
    --out ${Filtered_SNPs}/Filtered_SNPs