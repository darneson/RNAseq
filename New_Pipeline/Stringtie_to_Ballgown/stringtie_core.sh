source /u/local/Modules/default/init/modules.sh
PATH=$PATH:/u/home/d/darneson/stringtie-1.0.4.Linux_x86_64

bam=/u/home/d/darneson/nobackup-xyang123/RNA_Seq_Project_Yuqi/samtools/HLZ_"$No".sorted.bam

mkdir /u/home/d/darneson/nobackup-xyang123/RNA_Seq_Project_Yuqi/stringtie_ballgown/HLZ_"$No"

stringtie -o /u/home/d/darneson/nobackup-xyang123/RNA_Seq_Project_Yuqi/stringtie_ballgown/HLZ_"$No"/HLZ_"$No".gtf \
-p 8 -B \
-G /u/home/d/darneson/nobackup-xyang123/RNA_Seq_Project_Yuqi/cuffmerge/merged.gtf \
-l HLZ_"$No" \
$bam