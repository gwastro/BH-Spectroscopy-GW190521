#!/usr/bin/bash

pycbc_inference_plot_posterior \
    --input-file ../posteriors/nongr/NONGR-220_330-06MS.hdf \
    --output-file posterior-nongr_delta_330-6ms.png \
    --parameters "delta_f330:$\delta f_{{330}}$" "delta_tau330:$\delta \tau_{{330}}$" "(1+delta_f330)*f330:$ f_{{330}}(1+\delta f_{{330}})$" \
    --plot-density \
    --density-cmap "inferno" \
    --contour-percentiles 90 50 \
    --contour-linestyles "dashed" "solid" \
    --contour-color "white" \
    --plot-contours \
    --plot-marginal \
    --marginal-percentiles 5 95 \
    --expected-parameters delta_f330:0 delta_tau330:0 \
    --expected-parameters-color "limegreen" \
    --plot-prior ../configuration/nongr/NONGR-220_330-06MS.ini

pycbc_inference_plot_posterior \
    --input-file ../posteriors/nongr/NONGR-220_221-M7MS.hdf \
    --output-file posterior-nongr_delta_221-m7ms.png \
    --parameters "delta_f221:$\delta f_{{221}}$" "delta_tau221:$\delta \tau_{{221}}$" "(1+delta_f221)*f221:$ f_{{221}}(1+\delta f_{{221}})$" \
    --plot-density \
    --density-cmap "inferno" \
    --contour-percentiles 90 50 \
    --contour-linestyles "dashed" "solid" \
    --contour-color "white" \
    --plot-contours \
    --plot-marginal \
    --marginal-percentiles 5 95 \
    --expected-parameters delta_f221:0 delta_tau221:0 \
    --expected-parameters-color "limegreen" \
    --plot-prior ../configuration/nongr/NONGR-220_221-M7MS.ini
