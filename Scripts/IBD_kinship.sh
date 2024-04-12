#!bin/bash

genotypeFile="/homes/bilala/BedTools/GWAS/raw_data/1KG.EAS.auto.snp.norm.nodup.split.rare002.common015.missing" #!!! Please add your own path here.  "1KG.EAS.auto.snp.norm.nodup.split.rare002.common015.missing" is the prefix of PLINK bed file.
IBD_kinship_results="/homes/bilala/BedTools/GWAS/Results/IBD_kinship"
prune_results="/homes/bilala/BedTools/GWAS/Results/Filtered_SNPs/Filtered_SNPs.prune.in"
plink \
    --bfile ${genotypeFile} \
    --extract ${prune_results} \
    --genome \
    --out ${IBD_kinship_results}/IBD_kinship

# --bfile: the prefix of PLINK bed file
# --extract: the file contains the SNPs that are in high linkage disequilibrium with each other
# --genome: calculate the IBD kinship coefficient
# --out: the output file
#This script will generate a file named "IBD_kinship.genome" in the output directory.
#The file contains the IBD kinship coefficient of each pair of individuals.
#The IBD kinship coefficient is calculated as the proportion of the genome that is identical by descent (IBD) between two individuals.
#The IBD kinship coefficient ranges from 0 to 1. A value close to 0 indicates no genetic relationship, while a value close to 1 indicates a high genetic relationship.
#The output file will contain the following columns:
#FID1: Family ID of individual 1
#IID1: Individual ID of individual 1
#FID2: Family ID of individual 2
#IID2: Individual ID of individual 2
#RT: Relationship type
#EZ: Zero-IBD estimate
#Z0: Proportion of IBD=0
#Z1: Proportion of IBD=1
#Z2: Proportion of IBD=2
#PI_HAT: Estimated IBD sharing
#PHE: Phenotypic correlation
#DST: Genetic distance
#PPC: Posterior probability of IBD=2
#The relationship type (RT) column indicates the genetic relationship between two individuals based on the IBD kinship coefficient.
#The zero-IBD estimate (EZ) column indicates the proportion of the genome that is estimated to be IBD=0 between two individuals.
#The proportion of IBD=0 (Z0), IBD=1 (Z1), and IBD=2 (Z2) columns indicate the proportion of the genome that is IBD=0, IBD=1, and IBD=2 between two individuals, respectively.
#The estimated IBD sharing (PI_HAT) column indicates the estimated IBD sharing between two individuals.
#The phenotypic correlation (PHE) column indicates the phenotypic correlation between two individuals.
#The genetic distance (DST) column indicates the genetic distance between two individuals.
#The posterior probability of IBD=2 (PPC) column indicates the posterior probability of IBD=2 between two individuals.
#Let us include an awk command to filter out the pairs of individuals with IBD kinship coefficient greater than 0.2.
#PI_HAT is the IBD estimation. Please check https://www.cog-genomics.org/plink/1.9/ibd for more details.