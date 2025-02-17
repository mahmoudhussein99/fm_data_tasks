#SBATCH --export=NONE
# BATCH=$1
# LR=$2
# TEMP=$3
# SIZE=$4
# PRODUCT=$5
# AUG=$6
conda activate unidm-env

DATASETS=("WDC-Computers" "WDC-Shoes" "WDC-Watches" "WDC-Cameras" "MusicBrainz20k" "DBLP-GoogleScholar")
# "DBLP-GoogleScholar" "MusicBrainz20k"
for DATASET in "${DATASETS[@]}"
do
    python fm_data_tasks/run_inference.py \
    --use_local_model \
    --data_dir data/datasets/entity_matching/structured/$DATASET \
    --sample_method random \
    --num_run 20 \
    --num_trials 3 \
    --do_test 
    # --k 3 \
    # --dry_run \

    
done

