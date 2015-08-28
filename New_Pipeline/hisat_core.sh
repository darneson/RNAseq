source /u/local/Modules/default/init/modules.sh
PATH=$PATH:/u/home/d/darneson/hisat-0.1.6-beta

FQ=/u/nobackup/xyang123/zhaoyuqi/RNA-seq/Yu_project/Sample_HLZ_"$No"/HLZ_"$No".fastq

hisat -p 8 -t \
-x /u/nobackup/xyang123/zhaoyuqi/RNA-seq/mm10_hisat/mm10_hisat \
-q -U $FQ \
-S /u/home/d/darneson/nobackup-xyang123/RNA_Seq_Project_Yuqi/hisat/HLZ_"$No.sam"