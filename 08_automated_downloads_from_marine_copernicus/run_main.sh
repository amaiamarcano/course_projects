#!/bin/bash

# ------------------------------------------------------------------------------------------------

# qsub -q all.q -cwd -o ./data/output/main${1}.out -e ./data/output/main${1}.err ./main.sh ${PWD};
# previous line doest not work because the nodes can't run env/bin/python

# ------------------------------------------------------------------------------------------------


./main.sh ${PWD};
