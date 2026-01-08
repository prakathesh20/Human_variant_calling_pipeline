#!/bin/bash

bcftools mpileup -Ou \
-f data/reference/Homo_sapiens.GRCh38.dna.chromosome.22.fa \
results/alignment/na12878_chr22.bam | \
bcftools call -mv -Oz \
-o results/variants/na12878_chr22.vcf.gz 
