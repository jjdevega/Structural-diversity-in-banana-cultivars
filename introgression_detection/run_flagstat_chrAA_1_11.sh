libList=$1 # A text file of samples

#janet.higgins@earlham.ac.uk####

#bash /ei/projects/d/ddb748f8-e2d0-444c-a7f9-30680b49af25/data/JAH_scripts/run_flagstat_chrAA_1_11.sh list190.txt

for ID in `cat ${libList}`

do
	#mkdir ${ID}_stat
	cd ${ID}_stat
	for chromosome in {1..11}
		do
			sbatch -J stats --mem 20G -c 1 -N 1 -p ei-medium -t 1-0 --wrap "source samtools-1.7;samtools flagstat ${chromosome}_${ID}_AA.bam > stats_${chromosome}_${ID}_AA.bam.txt" 
	done
	cd ..
done;