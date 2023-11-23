libList=$1 # A text file of samples

#janet.higgins@earlham.ac.uk####

#bash run_align_AABBSS.sh samlist.txt 

for ID in `cat ${libList}`

do

sbatch /ei/projects/d/ddb748f8-e2d0-444c-a7f9-30680b49af25/data/JAH_scripts/align_AABB_M_k35.sh ${ID}

done;