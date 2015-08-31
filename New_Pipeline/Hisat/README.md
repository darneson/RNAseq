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

[Return to Contents](https://github.com/darneson/RNAseq/blob/master/New_Pipeline#new-rnaseq-pipeline)
