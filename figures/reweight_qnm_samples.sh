#!/usr/bin/bash
# Run the reweight script to reweight the Kerr results to one corresponding
# to a prior that is uniform in mass ratio
python reweight_qnm_samples.py --input-file \
    ../posteriors/kerr/220_330/KERR-220_330-06MS.hdf \
    --output-file ../posteriors/reweighted/REWEIGHTED_KERR-220_330-06MS.hdf
