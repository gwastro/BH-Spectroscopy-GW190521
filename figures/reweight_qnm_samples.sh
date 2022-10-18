#!/usr/bin/bash
# Run the reweight script to reweight the Kerr results to one corresponding
# to a prior that is uniform in mass ratio
python reweight_qnm_samples.py \
    --input-file \
        ../../reruns/more_livepoints/220_330/samples-06.hdf \
    --output-file \
        ../posteriors/reweighted/reweighted_samples-kerr-220_330-06ms.hdf 

pycbc_inference_extract_samples --verbose --force \
    --input-file \
        ../posteriors/reweighted/reweighted_samples-kerr-220_330-06ms.hdf \
    --output-file ../posteriors/reweighted/REWEIGHTED_KERR-220_330-06MS.hdf \
    --skip-groups sampler_info
