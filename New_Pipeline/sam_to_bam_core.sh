
source /u/local/Modules/default/init/modules.sh

sam=/u/home/d/darneson/nobackup-xyang123/RNA_Seq_Project_Yuqi/hisat/HLZ_"$No.sam"

bam=/u/home/d/darneson/nobackup-xyang123/RNA_Seq_Project_Yuqi/samtools/HLZ_"$No.bam"

sorted=/u/home/d/darneson/nobackup-xyang123/RNA_Seq_Project_Yuqi/samtools/HLZ_"$No.sorted"

samtools view -bS $sam > $bam

samtools sort $bam $sorted