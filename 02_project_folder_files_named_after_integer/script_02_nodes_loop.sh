#!/bin/bash

# 2) Do another bash script that send different jobs of the script 1 to the nodes running a loop from 1 to 10

echo "running ${pwd}/script_02_nodes_loop.sh...";

# creating a folder in our current directory to keep the results of the jobs (creating folder and files)
mkdir qsub_output_script_02_nodes_loop;
echo "the directory qsub_output_02_script_nodes_loop was successfully created";

# initial loop from 1 to 10 as asked, these will be the input integers we'll use in our bash
for i in {1..10};

    do
        # we'll send 5 jobs of the bash script of question 1 to the nodes
        for job_number in {1..5};

            do
                echo "sending job n°${job_number} to the nodes...";
                # sending the job to the nodes, outputting in the folder we made
                qsub -q all.q -e ${pwd}/qsub_output_script_02_nodes_loop/script_02_nodes_loop_error -o ${pwd}/qsub_output_script_02_nodes_loop/script_02_nodes_loop_output ./script_01_folders_files_integer.sh ${i}
                echo "the job was successfully sent";

            done;
done;

echo "script_02_nodes_loop.sh was successfully run. done.";

# we then run:
# bash script_02_nodes_loop.sh
