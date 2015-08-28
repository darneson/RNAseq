#$ -cwd
#$ -j y
# -pe dc* 4 -now n
#$ -l h_data=16G,h_rt=24:00:00
# -l highp
# -v QQAPP=openmpi
#$ -M zhaoyuqi616@ucla.edu
#$ -m n
#$ -V
source /u/local/Modules/default/init/modules.sh
source /u/local/bin/set_qrsh_env.sh
#RNA-seq quality control
#The FASTX-Toolkit is a collection of command line tools for Short-Reads FASTA/FASTQ files preprocessing.
#Next-Generation sequencing machines usually produce FASTA or FASTQ files, containing multiple short-reads sequences (possibly with quality information).
module load fastx_toolkit
samples=("14" "15" "16" "17" "22" "23" "24" "25")
for i in "${samples[@]}"
do
Input_File="HLZ_"$i".fq"
Output_file="HLZ_"$i".fastq"
#############################
##fastx_quality_stats will produce a summary table for the reads quality. 
#Out_File="HLZ_"$i"_QC_stats.txt"
#Quality_Figure="Sample_HLZ_"$i"_QC_Plot.png"
#fastx_quality_stats -Q33 -i Sample_HLZ_$i/$Input_File -o Quality_Control/$Out_File
#fastq_quality_boxplot_graph.sh -i Quality_Control/$Out_File -o Quality_Control/$Quality_Figure -t "Sample_$i"
#fastx_nucleotide_distribution_graph.sh -i Quality_Control/$Out_File -o "Sample_$i"_nuc.png -t "Sample_$i"
############################
#Based on the evaluation of reads quality, we should 1)remove reads of poor quality and 2)trim one base from 5 primer.
############################
fastx_trimmer -Q33 -l 100 -i Sample_HLZ_$i/$Input_File -o Sample_HLZ_$i/T1_$Input_File
fastq_quality_filter -i Sample_HLZ_$i/T1_$Input_File  -o Sample_HLZ_$i/$Output_file -q 20 -p 80 -Q 33 -v
done

