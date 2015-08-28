#!/bin/bash
#$ -cwd
#$ -j y
#$ -pe dc* 8
#$ -l h_data=16G,h_rt=3:00:00
#$ -v QQAPP=openmpi
#$ -M darneson@ucla.edu
#  Notify at beginning and end of job
#$ -m bea
#  Uncomment the next line to have your environment variables used by SGE
#$ -V

source /u/local/Modules/default/init/modules.sh

module load cufflinks/2.2.1

cuffmerge -p 8 \
-g /u/home/d/darneson/nobackup-xyang123/RNA_Seq_Project_Yuqi/Reference/mm10.ensembl-for-stringtie.gtf \
-s /u/home/d/darneson/nobackup-xyang123/RNA_Seq_Project_Yuqi/Reference/genome.fa \
-o /u/home/d/darneson/nobackup-xyang123/RNA_Seq_Project_Yuqi/cuffmerge \
/u/home/d/darneson/nobackup-xyang123/RNA_Seq_Project_Yuqi/Scripts_To_Run/cuffmerge/assemblies.txt