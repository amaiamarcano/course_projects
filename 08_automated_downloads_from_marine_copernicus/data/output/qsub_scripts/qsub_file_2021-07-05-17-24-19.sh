#!/bin/bash
env/bin/python -m motuclient         --motu https://nrt.cmems-du.eu/motu-web/Motu         --service-id GLOBAL_ANALYSIS_FORECAST_PHY_001_024-TDS         --product-id global-analysis-forecast-phy-001-024         --longitude-min -180         --longitude-max 179.91         --latitude-min -80         --latitude-max 90         --date-min 2021-07-05         --date-max 2021-07-05         --depth-min 0.493         --depth-max 0.4942         --variable uo         --variable vo         --out-dir ${PWD}/data/output --out-name 2021-07-05_GLOBAL_ANALYSIS_FORECAST_PHY_001_024-TDS.nc         --user ${1} --pwd ${2}
        