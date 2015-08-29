# New RNAseq Pipeline

Contents: <br />
1. [Fastx-Toolkit](https://github.com/darneson/RNAseq/blob/master/New_Pipeline#fastx-toolkit-for-quality-control-of-the-raw-reads) <br />
2. [Hisat](https://github.com/darneson/RNAseq/blob/master/New_Pipeline#hisat-for-aligning-rna-seq-reads-to-a-genome) <br />
3. [Samtools](https://github.com/darneson/RNAseq/tree/master/New_Pipeline#samtools-for-converting-sam-to-bam) <br />
4. [Stringtie 1](https://github.com/darneson/RNAseq/tree/master/New_Pipeline#stringtie-for-assembling-transcripts) <br />
5. [Cuffmerge](https://github.com/darneson/RNAseq/tree/master/New_Pipeline#cuffmerge-for-pooling-transcriptome-and-novel-transcripts) <br />
6. [Stringtie2](https://github.com/darneson/RNAseq/tree/master/New_Pipeline#stringtie-for-ballgown-format) <br />
7. [Ballgown](https://github.com/darneson/RNAseq/tree/master/New_Pipeline#ballgown-for-gene-signatures) <br />

The whole RNAseq analysis can be roughly divided into three steps:
<ol>
  <li>Quality control (sequence check, de-multiplex, etc.)</li>
  <li>Count reads (alignment, assembly, annotation, etc.)</li>
  <li>Interpret data (statistical test, visualization, pathway analysis, etc.)</li>
</ol>
The following RNA-seq dataset will be used as an example: <br />
`/u/nobackup/xyang123/zhaoyuqi/RNA-seq/Yu_project/Sample_HLZ_14 -- Sample_HLZ_25` <br />

**Short Version** (only care about known transcripts present in GTF file) Also note that we use HISAT instead of TopHat:
![alt text][short-pipeline] 

[short-pipeline]: https://cloud.githubusercontent.com/assets/12090136/9558325/0de2342c-4d99-11e5-82b0-31eb90a4a629.png

**Long Version** (when we care about novel transcripts) Again we use HISAT, not TopHat: <br />
![alt text][long-pipeline]

[long-pipeline]: https://cloud.githubusercontent.com/assets/12090136/9558326/0de22fea-4d99-11e5-8f23-3b851bbfaa53.png

[Return to Contents](https://github.com/darneson/RNAseq/blob/master/New_Pipeline/README.md#new-rnaseq-pipeline)

## Fastx-Toolkit for Quality Control of the raw reads
The script for the QC is located in the [Fastx_Tookit Folder](https://github.com/darneson/RNAseq/tree/master/New_Pipeline/Fastx_Toolkit), or on Hoffman2: <br />
`/u/nobackup/xyang123/zhaoyuqi/RNA-seq/Yu_project/Quality_Control_FASTX_toolkit.sh` <br />
When you get the raw RNA-seq data, the first step is to check the quality of the reads: <br />
`>>module load fastx_toolkit` <br />
`>>qsub Quality_Control_Fastx_toolkit.sh` <br />
First, generate a summary table for the whole sample. <br />
Also, the codes in the file are for batch running, please modify accordingly. <br />
`>> fastx_quality_stats -Q33 -i Sample_HLZ_14/ HLZ_14.fq -o Quality_Control/HLZ_14_QC_stats.txt` <br />
`>> fastq_quality_boxplot_graph.sh -i Quality_Control/ HLZ_14_QC_stats.txt -o Quality_Control/Sample_HLZ_14_QC_Plot.png -t "Sample_HLZ_14"` <br />
`>> fastx_nucleotide_distribution_graph.sh -i Quality_Control/ HLZ_14_QC_stats.txt -o Sample_HLZ_14_nuc.png -t Sample_HLZ_14` <br />
Based on the plots, the last nucleotide shows wide quality span, which will we will be removed for the following analysis. <br />
![alt text][qualityscores]

[qualityscores]: https://cloud.githubusercontent.com/assets/12090136/9559029/cb6f7182-4da1-11e5-9461-884b88b8a9ac.png

`>> fastx_trimmer -Q33 -l 100 -i Sample_HLZ_14/HLZ_14.fq -o Sample_HLZ_14/T1_ HLZ_14.fq` <br />
In addition, filter the reads with very low quality. <br />
`>> fastq_quality_filter -i Sample_HLZ_14/ T1_ HLZ_14.fq -o Sample_HLZ_14/ HLZ_14.fastq -q 20 -p 80 -Q 33 –v` <br />
Now the reads can be used for the next alignment step.

[Return to Contents](https://github.com/darneson/RNAseq/blob/master/New_Pipeline/README.md#new-rnaseq-pipeline)

## Hisat for Aligning RNA-Seq Reads to a Genome

The HISAT (Hierarchical Indexing for Spliced Alignment of Transcripts) program can be obtained from [Here](https://ccb.jhu.edu/software/hisat/index.shtml). <br />
It is also available on Hoffman2 under Yuqi's directory and we are looking to add it to Hoffman2 permanently. <br />
`/u/nobackup/xyang123/zhaoyuqi/RNA-seq/hisat-0.1.6-beta/hisat` <br />
It requires specific genome format, which can be downloaded from website or built using: <br />
`hisat2-build [options]* <reference_in> <ht2_index_base>` <br />
For mouse reference genome, the index files were stored in: <br />
`/u/home/z/zhaoyuqi/nobackup-xyang123/RNA-seq/mm10_hisat` <br />
`>> sh hisat_in_batch.sh` <br />
For each sample: <br />
`>> hisat -p 4 -x ../../mm10_hisat/mm10_hisat -U ./HLZ_14/unmapped.fastq -S ./HLZ_14/HLZ_14.sam` <br />
For paired end reads: <br />
`hisat -p 4 -x reference_index -1 PE_reads1 -2 PE_reads -U -S output.sam` <br />
HISAT example batch scripts are available in the [HISAT Folder](https://github.com/darneson/RNAseq/tree/master/New_Pipeline/Hisat) <br />
HISAT alignments are more sensitive and accurate than Tophat2. <br />
The following are the alignment overall alignment statistics for all of the samples: <br />
Hisat Summary: <br />
runtime ~00:05:00 <br />
14 - 87.46% <br />
15 - 90.56% <br />
16 - 90.67% <br />
17 - 90.22% <br />
22 - 90.39% <br />
23 - 90.27% <br />
24 - 89.96% <br />
25 - 90.07% <br />

[Return to Contents](https://github.com/darneson/RNAseq/blob/master/New_Pipeline/README.md#new-rnaseq-pipeline)

##Samtools for Converting Sam to Bam


[Return to Contents](https://github.com/darneson/RNAseq/blob/master/New_Pipeline/README.md#new-rnaseq-pipeline)

##Stringtie for Assembling Transcripts


[Return to Contents](https://github.com/darneson/RNAseq/blob/master/New_Pipeline/README.md#new-rnaseq-pipeline)

##Cuffmerge for Pooling Transcriptome and Novel Transcripts


[Return to Contents](https://github.com/darneson/RNAseq/blob/master/New_Pipeline/README.md#new-rnaseq-pipeline)

##Stringtie for Ballgown Format


[Return to Contents](https://github.com/darneson/RNAseq/blob/master/New_Pipeline/README.md#new-rnaseq-pipeline)

##Ballgown for Gene Signatures


[Return to Contents](https://github.com/darneson/RNAseq/blob/master/New_Pipeline/README.md#new-rnaseq-pipeline)

