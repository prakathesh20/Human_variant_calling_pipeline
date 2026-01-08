#hHuman variant calling pipeline(chromosome 22)

##overview
This project implements an end to end short read variant calling pipeline on human chromosome 22 using standard bioinformatics tools. This pipeline demonstrates core genomic concepts including read alignment, pileup generation, variants calling, filtering and statistical analysis.

##Dataset
- Paired end Illumina reads (NA12878)
-Reference genome: GRCh38 (chromosome 22)

##Pipeline_overview
FASTQ -> QC -> Alignment(BWA) -> BAM -> variant calling (bcftools) -> VCF -> Filtering -> Statistics

##Algorithm Explained
###BWA (Burrow Wheeler Transform & FM index)
BWA uses the Burrow Wheeler Transform and FM index to efficiently align short read to the reference genome with low memory usage.

###Pileup
A pileup summarizes all aligned bases at each genomic position,forming the basis for statistical variant calling.

###Variant calling
bcftools uses probabilistic models based on base quality,mapping quality and depth to distinguish true variants from sequencing noise.

###Variant filtering stratergy
Variants were filtered using:
	-QUAL >=30
	-Read Depth >=10

This removes low confidence and weakly supported calls.

##Results(chromosome 22)
	-Total variants: ~91,700
	-SNP: ~89,800
	-Indels: ~1,900
	-Multiallelic sites: ~1%

These values are consistent with known patterns of human genetic variantion indicating high quality variant calling.

##Comparison with DeepVariant

|Feature | bcftools | Deepvairant |
|-----------------------------------|
|Method | Statistical | DeepLEarning |
|Accuracy | Good | State of art |
|Speed | Fast | slower |
|Compute | Low | High |
|Interpretability | High | Lower|

This project provides a transparent baseline pipeline while DeepVariant represents modern ML based approaches used in large scale and clinical genomics.

##How to run
``` bash
conda env create -f environment.yml
conda activate variant-calling
bash scripts/qc_.sh
bash scripts/alignment_.sh
bash scripts/variant_calling_.sh
bash scripts/variant_filtering_.sh
