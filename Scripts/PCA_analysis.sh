#bin/bash

hild_text="/homes/bilala/BedTools/GWAS/Scripts/high-ld-hg19.txt"
hild="/homes/bilala/BedTools/GWAS/PCA_data"
plink_file="/homes/bilala/BedTools/GWAS/Results/clean_data/clean_data"
hild_set="/homes/bilala/BedTools/GWAS/PCA_data/high-ld-set.set"

plink \
    --bfile ${plink_file} \
    --make-set ${hild_text} \
    --write-set \
    --out ${hild}/high-ld-set

#####Step 1: Extract the high LD SNPs from the clean data
plink2 \
    --bfile ${plink_file} \
    --maf 0.01 \
    --threads 4 \
    --exclude ${hild_set} \
    --indep-pairwise 50 5 0.2 \
    --out ${hild}/step1


#####Step 2: Remove the high LD SNPs from the clean data
plink2 \
    --bfile ${plink_file} \
    --extract ${hild}/step1.prune.in \
    --king-cutoff 0.0884 \
    --threads 4 \
    --out ${hild}/step2


#####Step 3: Perform PCA on the clean data after removing high LD SNPs
plink2 \
    --bfile ${plink_file} \
    --keep ${hild}/step2.king.cutoff.in.id \ 
    --extract ${hild}/step1.prune.in \
    --threads 4 \
    --pca approx allele-wts 10 \
    --freq counts \
    --out ${hild}/step3

#####Step 4 is the projection of the samples onto the principal components
plink2 \
    --bfile ${plink_file} \
    --threads 4 \
    --read-freq ${hild}/step3.acount \
    --score ${hild}/step3.eigenvec.allele 2 6 header-read no-mean-imputation variance-standardize \
    --score-col-nums 7-16 \
    --out ${hild}/step4_projected
