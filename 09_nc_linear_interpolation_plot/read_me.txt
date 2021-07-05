INPUTS:
- data to be interpolated & plotted: json files in data/input
- copernicus credentials located at: ../../../cmems.json

OUTPUTS:
- interpolated data in data/output
- plot files in data/output

# =============================================================================
# =============================================================================
# =============================================================================

# import data from CMEMS
src/extract_data.py

# read data: extract variables from NETCDF
src/read_data.py

# interpolate values and save the interpolate values into a file
src/interpolate.py

# plot interpolation saved in the previously created file & save the plot into a file
src/plot_data.py
