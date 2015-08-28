# New RNAseq Pipeline

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

## Fastx-Toolkit for Quality Control of the raw reads
The script for the QC is located in the [Fastx_Tookit Folder](https://github.com/darneson/RNAseq/tree/master/New_Pipeline/Fastx_Toolkit), or on Hoffman2: <br />
`/u/nobackup/xyang123/zhaoyuqi/RNA-seq/Yu_project/Quality_Control_FASTX_toolkit.sh` <br />
When you get the raw RNA-seq data, the first step is to check the quality of the reads: <br />
`>>module load fastx_toolkit` <br />
`>>qsub Quality_Control_Fastx_toolkit.sh` <br />
First, generate a summary table for the whole sample. <br />
Also, the codes in the file are for batch running, please modify accordingly. <br />


![alt text][long-pipeline]

[long-pipeline]: https://cloud.githubusercontent.com/assets/12090136/9558326/0de22fea-4d99-11e5-8f23-3b851bbfaa53.png
