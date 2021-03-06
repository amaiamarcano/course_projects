import subprocess
import datetime
import json

def downloadcmems(data={}):

    # setting missing arguments for data

    if data.get("service") == None:
        data["service"] = "GLOBAL_ANALYSIS_FORECAST_PHY_001_024-TDS"

    if data.get("product") == None:
        data["product"] = "global-analysis-forecast-phy-001-024"

    if data.get("date_min") == None:
        data["date_min"] = datetime.datetime.now().strftime("%Y-%m-%d")

    if data.get("number_of_days") == None:
        data["number_of_days"] = 1

    if data.get("long_min") == None:
        data["long_min"] = -15

    if data.get("lat_min") == None:
        data["lat_min"] = 30

    if data.get("long_max") == None:
        data["long_max"] = 20

    if data.get("lat_max") == None:
        data["lat_max"] = 60

    if data.get("depth_min") == None:
        data["depth_min"] = 0.493

    if data.get("depth_max") == None:
        data["depth_max"] = 0.4942

    # extract cmems username & password
    cmemskeys = json.load(open("../../../cmems.json", 'r'))

    # PARAMETERS:
    # service : service-id
    # product : product-id
    # date_min : by default, today's date (string)
    # number_of_days : for the loops

    # t0 : first date to download (time object)
    t0 = datetime.datetime.strptime(data["date_min"], "%Y-%m-%d")
    # date_max : day after the last day to download, by default today (string)
    date_max = (t0 + datetime.timedelta(days=data["number_of_days"])).strftime("%Y-%m-%d")
    # tf : the last day to download (time object)
    tf = datetime.datetime.strptime(date_max, "%Y-%m-%d")

    # initializating t
    t = t0

    while t != tf:

        # we'll need t's string version for the command
        string_t = t.strftime("%Y-%m-%d")

        # write the command in a bash file

        time_expansion = datetime.datetime.now().strftime("%Y-%m-%d-%H-%M-%S")
        arg1,arg2,arg3 = "${1}","${2}","${PWD}"
        qsub_file_name = f"qsub_file_{time_expansion}"
        qsub_file_path = f"data/output/qsub_scripts/{qsub_file_name}.sh"

        qsub_file = open(qsub_file_path,"w")

        qsub_script = f"""#!/bin/bash\nenv/bin/python -m motuclient \
        --motu https://nrt.cmems-du.eu/motu-web/Motu \
        --service-id {data["service"]} \
        --product-id {data["product"]} \
        --longitude-min {data["long_min"]} \
        --longitude-max {data["long_max"]} \
        --latitude-min {data["lat_min"]} \
        --latitude-max {data["lat_max"]} \
        --date-min {string_t} \
        --date-max {string_t} \
        --depth-min {data["depth_min"]} \
        --depth-max {data["depth_max"]} \
        --variable uo \
        --variable vo \
        --out-dir {arg3}/data/output --out-name {string_t}_{data["service"]}.nc \
        --user {arg1} --pwd {arg2}
        """

        command = f"""chmod +x {qsub_file_path} ; {qsub_file_path} {cmemskeys["username"]} {cmemskeys["password"]}"""
        qsub_file.write(qsub_script)
        qsub_file.close()

        # running the command: download the file
        p = subprocess.Popen(command, shell=True)
        p.wait()

        # preparing next iteration
        t += datetime.timedelta(days=1)

    return ("done :-)")
