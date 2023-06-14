import h5py, numpy
from matplotlib import pyplot
from pycbc.results import str_utils

# Amplitude fits from Borhanian et al., CQG 37 (2020)
alpha33 = 0.4433
def q33(amp33):
    # A_33 = alpha_33 * delta
    cond = amp33 <= alpha33
    amp = amp33[cond]
    massratio = (alpha33 + amp) / (alpha33 - amp)
    return massratio

# Load data from posterior files
kerr_file = '../posteriors/kerr/220_330/KERR-220_330-06MS.hdf'
fp_kerr = h5py.File(kerr_file, 'r')
amp330 = fp_kerr['samples/amp330'][()]

# Reweighted IMR files for mass ratio
imr_files = {'phenom':'../posteriors/reweighted/REWEIGHTED_IMR-XPHM.hdf',
             'nrsur':'../posteriors/reweighted/REWEIGHTED_IMR-NRSUR.hdf'}
mass_ratios = {}
for waveform in imr_files:
    fp = h5py.File(imr_files[waveform])
    mass_ratios[waveform] = 1./fp['samples/q'][()]
    fp.close()
# Reweighted ringdown results for mass ratio
kerr_reweighted = '../posteriors/reweighted/REWEIGHTED_KERR-220_330-06MS.hdf'
fp_kerr_reweighted = h5py.File(kerr_reweighted, 'r')
amp330_reweighted = fp_kerr_reweighted['samples/amp330'][()]
mass_ratios['kerr'] = 1./q33(amp330_reweighted)

#Make figure
def plot_percentiles(ax, samples, color):
    plotp = numpy.percentile(samples, [5, 95])
    for val in plotp:
        ax.axvline(x=val, ls='dashed', color=color, lw=2, zorder=5)
def get_interval(samples):
    values_min, values_med, values_max = numpy.percentile(samples, [5, 50, 95])
    negerror = values_med - values_min
    poserror = values_max - values_med
    return '${0}$'.format(str_utils.format_value(
            values_med, negerror, plus_error=poserror))

fig = pyplot.figure(); 
ax = fig.add_subplot(111)

# Top panel: amplitude distribution
amp330_color = 'navy'
fillcolor = 'lightsteelblue'
ax.hist(amp330, label='Ringdown 330 mode',
        edgecolor=amp330_color, facecolor=fillcolor,
        bins=50, range=(0,alpha33), density=True,
        histtype='stepfilled', lw=2)
plot_percentiles(ax, amp330, amp330_color)

ax.set_xlabel('amplitude ratio $A_{330}/A_{220}$', fontsize=14)
ax.set_xlim(0, alpha33)
ax.set_yticks([])
ax.set_yticklabels([])
#ax.xaxis.tick_top()
ax.legend(loc='upper right')

fig.set_dpi(250)
fig.savefig('Figure4a.png')
