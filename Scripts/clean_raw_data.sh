#!bin/bash

genotypeFile="/homes/bilala/BedTools/GWAS/raw_data/1KG.EAS.auto.snp.norm.nodup.split.rare002.common015.missing" #!!! Please add your own path here.  "1KG.EAS.auto.snp.norm.nodup.split.rare002.common015.missing" is the prefix of PLINK bed file.
clean_data="/homes/bilala/BedTools/GWAS/Results/clean_data"
prune_results="/homes/bilala/BedTools/GWAS/Results/Filtered_SNPs/Filtered_SNPs.prune.in"
inbreeding_F_results="/homes/bilala/BedTools/GWAS/Results/inbreeding_F"
plink \
    --bfile ${genotypeFile} \
    --extract ${prune_results} \
    --maf 0.01 \
    --geno 0.02 \
    --mind 0.02 \
    --hwe 1e-6 \
    --remove ${inbreeding_F_results}/inbreeding_F_outliers.het \
    --keep-allele-order \
    --make-bed \
    --out ${clean_data}/clean_data
#This script will generate a new PLINK bed file with the prefix "clean_data" in the output directory.
#The new PLINK bed file will contain the SNPs that pass the following quality control filters:
#Minor allele frequency (MAF) > 0.01
#Genotype missing rate (GENO) < 0.02
#Individual missing rate (MIND) < 0.02
#Hardy-Weinberg equilibrium (HWE) p-value > 1e-6
#Samples with inbreeding coefficient deviating more than 0.1 from the mean will be excluded
#The "--keep-allele-order" flag will keep the allele order consistent with the original PLINK bed file.
#The "--make-bed" flag will output the new PLINK bed file in binary format.
#The new PLINK bed file will be used for downstream analysis such as association testing and principal component analysis.
#The quality control filters are commonly used to remove low-quality SNPs and samples that may introduce bias in the analysis.
#The filters are based on empirical thresholds and may need to be adjusted based on the specific study design and data quality.
#The filters aim to remove SNPs and samples that are likely to introduce noise or confound the analysis, while retaining high-quality data for accurate and reliable results.
#The quality control process is an essential step in genome-wide association studies to ensure the validity and robustness of the results.
#The clean data will be used for downstream analysis such as association testing, principal component analysis, and heritability estimation.
#The clean data will help to reduce false positive and false negative associations, improve the accuracy of genetic risk prediction, and enhance the interpretability of the results.
#The clean data will provide a reliable foundation for identifying genetic variants associated with complex traits and diseases, and for understanding the genetic architecture of human phenotypes.
#The clean data will enable researchers to generate meaningful insights into the genetic basis of diseases, and to develop personalized and precision medicine approaches for prevention, diagnosis, and treatment.
#The clean data will contribute to advancing our understanding of the genetic and environmental factors that influence human health and disease, and to improving the health and well-being of individuals and populations.
#The clean data will support the discovery of novel genetic variants, pathways, and mechanisms underlying complex traits and diseases, and the translation of genetic discoveries into clinical applications and public health interventions.
