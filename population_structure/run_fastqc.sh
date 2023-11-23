libList=$1 # A text file of samples

#janet.higgins@earlham.ac.uk####

#bash run_fastqc.sh samlist.txt 

for ID in `cat ${libList}`

do

mkdir Stat_${ID}

sbatch -c 1 -N 1 -o out_${ID}.log -p ei-medium --mem=50G -J fastqc --wrap "source fastqc-0.11.5;fastqc -o Stat_${ID} /ei/projects/d/ddb748f8-e2d0-444c-a7f9-30680b49af25/data/libraries/${ID}/*gz"

done;