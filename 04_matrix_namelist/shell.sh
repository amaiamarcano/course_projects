#!/bin/bash

# we change the values inside the namelist file according to the loop iteration: ${1}
n=${1};
target_file_output="\"file_matrix${1}.txt\"";

target_file="parameters_matrix.list";
generic_file="parameters_matrix.list.generic";

echo "namelist:";
cat ${target_file};

cp ${generic_file} ${target_file};

sed -i "s:---n---:${n}:" ${target_file};
sed -i "s:---target_file---:${target_file_output}:" ${target_file};

echo "updated namelist:";
cat ${target_file};

bash compile_gfortran.sh ${1};

sleep 30;

# now we 'clean up'
# we move the output_file 'up' to the previous working directory
mv file_matrix${1}.txt ../;
# we delete the directory copy
cd .. ;
bash tidy_up.sh;
# rm -r output${k};
