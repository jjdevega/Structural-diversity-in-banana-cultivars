BED_FILE=190sam_balb_DH_PKW_MISS3_MAF_01.bed
OUTDIR=musa_balb_ad

for ((K=2; K<=15; K+=1)); do
	echo Starting run for K=${K}
	for ((i=1; i<=10; i++)); do
    	echo Beginning loop K="$K"_"$i"
    	mkdir K${K}_R${i}_$OUTDIR
    	cd K${K}_R${i}_$OUTDIR
    	sbatch -J Badmx -o admix$K$i.log --mem 20G -c 1 -N 1 -p ei-medium --wrap "source admixture-1.3.0;admixture --cv ../$BED_FILE ${K}"
		cd ..		
	done
done 
