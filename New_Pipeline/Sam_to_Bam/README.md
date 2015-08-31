##Samtools for Converting Sam to Bam

Because the outputs for HISAT are in SAM format, we need BAM format files for the next step in the pipeline (StringTie) <br />
Use samtools view to convert the SAM file into a BAM file. Bam is a binary format corresponding to the SAM text format. <br />
SAM example batch scripts are available in the [SAM_to_BAM Folder](https://github.com/darneson/RNAseq/tree/master/New_Pipeline/Sam_to_Bam) <br />
Run: <br />
`samtools view -bS eg2.sam > eg2.bam` <br />
Scripts to run are located in: <br />
`/u/home/d/darneson/nobackup-xyang123/RNA_Seq_Project_Yuqi/Scripts_To_Run/sam_to_bam` <br />
Output is located in: <br />
`/u/home/d/darneson/nobackup-xyang123/RNA_Seq_Project_Yuqi/samtools` <br />


[Return to Contents](https://github.com/darneson/RNAseq/blob/master/New_Pipeline#new-rnaseq-pipeline)
