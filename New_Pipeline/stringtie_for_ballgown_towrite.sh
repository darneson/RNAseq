#!/bin/bash

Nums=(14 15 16 17 22 23 24 25)
for No in ${Nums[*]}
do
	echo "#!/bin/bash" > "stringtie_$No.sh"
	echo "#$ -cwd" >> "stringtie_$No.sh"
	echo "#$ -j y" >> "stringtie_$No.sh"
	echo "#$ -pe dc* 8" >> "stringtie_$No.sh"
	echo "#$ -l h_data=16G,h_rt=12:00:00" >> "stringtie_$No.sh"
	echo "#$ -v QQAPP=openmpi" >> "stringtie_$No.sh"
	echo "#$ -M darneson@ucla.edu" >> "stringtie_$No.sh"
	echo "#  Notify at beginning and end of job" >> "stringtie_$No.sh"
	echo "#$ -m bea" >> "stringtie_$No.sh"
	echo "#  Uncomment the next line to have your environment variables used by SGE" >> "stringtie_$No.sh"
	echo "#$ -V" >> "stringtie_$No.sh"

	echo "No=$No" >> "stringtie_$No.sh"
	cat stringtie_core.sh >> "stringtie_$No.sh"

done