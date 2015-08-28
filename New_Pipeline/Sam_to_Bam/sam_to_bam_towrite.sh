#!/bin/bash

Nums=(14 15 16 17 22 23 24 25)
for No in ${Nums[*]}
do
	echo "#!/bin/bash" > "sam_to_bam_$No.sh"
	echo "#$ -cwd" >> "sam_to_bam_$No.sh"
	echo "#$ -j y" >> "sam_to_bam_$No.sh"
	echo "#$ -l h_data=8G,h_rt=1:00:00" >> "sam_to_bam_$No.sh"
	echo "#$ -M darneson@ucla.edu" >> "sam_to_bam_$No.sh"
	echo "#  Notify at beginning and end of job" >> "sam_to_bam_$No.sh"
	echo "#$ -m bea" >> "sam_to_bam_$No.sh"
	echo "#  Uncomment the next line to have your environment variables used by SGE" >> "sam_to_bam_$No.sh"
	echo "#$ -V" >> "sam_to_bam_$No.sh"

	echo "No=$No" >> "sam_to_bam_$No.sh"
	cat sam_to_bam_core.sh >> "sam_to_bam_$No.sh"

done