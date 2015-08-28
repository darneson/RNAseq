#!/bin/bash

Nums=(14 15 16 17 22 23 24 25)
for No in ${Nums[*]}
do
	echo "#!/bin/bash" > "hisat_$No.sh"
	echo "#$ -cwd" >> "hisat_$No.sh"
	echo "#$ -j y" >> "hisat_$No.sh"
	echo "#$ -pe dc* 8" >> "hisat_$No.sh"
	echo "#$ -l h_data=16G,h_rt=12:00:00" >> "hisat_$No.sh"
	echo "#$ -v QQAPP=openmpi" >> "hisat_$No.sh"
	echo "#$ -M darneson@ucla.edu" >> "hisat_$No.sh"
	echo "#  Notify at beginning and end of job" >> "hisat_$No.sh"
	echo "#$ -m bea" >> "hisat_$No.sh"
	echo "#  Uncomment the next line to have your environment variables used by SGE" >> "hisat_$No.sh"
	echo "#$ -V" >> "hisat_$No.sh"

	echo "No=$No" >> "hisat_$No.sh"
	cat hisat_core.sh >> "hisat_$No.sh"

done