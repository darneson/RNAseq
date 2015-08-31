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

[Return to Contents](https://github.com/darneson/RNAseq/blob/master/New_Pipeline#new-rnaseq-pipeline)
