#!/bin/bash

bwa mem -t 2 data/reference/Homo_sapiens.GRCh38.dna.chromosome.22.fa \
data/fastq/SRR622461_1.fastq.gz \
data/fastq/SRR622461_2.fastq.gz | \
samtools sort -m 1G -o results/alignment/na12878_chr22.bam

samtools index results/alignment/na12878_chr22.bam
