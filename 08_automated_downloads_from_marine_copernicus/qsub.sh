#!/bin/bash

# qsub -q all.q -cwd -o ./data/output/main${1}.out -e ./data/output/main${1}.err ./main.sh ${PWD};
./main.sh ${PWD};
