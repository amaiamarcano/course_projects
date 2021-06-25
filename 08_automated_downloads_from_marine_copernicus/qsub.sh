#!/bin/bash

# qsub -q all.q -cwd -o ${PWD}/qsub.out -e ${PWD}/qsub.err test.sh;
qsub -q all.q -cwd -o ${PWD}/data/output/main${1}.out -e ${PWD}/data/output/main${1}.err ./main.sh ${PWD};
