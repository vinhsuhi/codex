#!/bin/bash
set -e

declare -a sizes=("s" "m" "l")
declare -a sizes=("s")
declare -a models=("rescal" "transe" "complex" "conve" "tucker")
declare -a models=("transe")

for size in "${sizes[@]}"; do
    # Download pretrained model if not already existing
    python download_pretrained.py ${size} link-prediction ${models[@]}

    for model in "${models[@]}"; do
        dir="models/link-prediction/codex-${size}/${model}"
        kge test ${dir}
    done
done
