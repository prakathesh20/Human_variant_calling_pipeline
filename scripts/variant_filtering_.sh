#!/bin/bash

bcftools filter -i 'QUAL>=30 && DP>=10' \
results/variants/na12878_chr22.vcf.gz -Oz \
-o results/variants/na12878_chr22.filtered.vcf.gz

bcftools index results/variants/na12878_chr22.filtered.vcf.gz

bcftools stats results/variants/na12878_chr22.filtered.vcf.gz \
> results/variants/na12878_chr22.stats
