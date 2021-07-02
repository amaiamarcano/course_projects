#!/bin/bash
env/bin/python -m motuclient         --motu https://nrt.cmems-du.eu/motu-web/Motu         --service-id IBI_ANALYSISFORECAST_PHY_005_001-TDS         --product-id cmems_mod_ibi_phy_anfc_0.027deg-3D_P1D-m         --longitude-min -19         --longitude-max 5         --latitude-min 26         --latitude-max 56         --date-min 2021-07-02         --date-max 2021-07-02         --depth-min 0.493         --depth-max 0.4942         --variable uo         --variable vo         --out-dir ${PWD}/data/output --out-name 2021-07-02_IBI_ANALYSISFORECAST_PHY_005_001-TDS.nc         --user ${1} --pwd ${2}
        