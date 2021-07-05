import glob
import json
from downloadcmems import *
import subprocess

# recover the json files
# extract the info from the jsons
# download the data related to each json

json_files_paths = []

# recover the json files
for json_file in glob.glob("./data/input/*.json"):
    json_files_paths.append(json_file)

for each_file in json_files_paths:

    # extract json information
    data = json.load(open(each_file, 'r'))

    downloadcmems(data)
