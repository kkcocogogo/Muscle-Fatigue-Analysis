function median_frequency=psd_analysis(signal,frequency)

[pxx,frequency_bins]=periodogram(signal,[],[],frequency);
pxx=10*log10(pxx);
plot(frequency_bins,pxx);
title('Power Spectrum Using Log Scale')
xlabel('frequency/Hz')
ylabel('Power/dBm')
pxx_sum=cumsum(pxx);
index=find(abs(pxx_sum-pxx_sum(1))>abs(pxx_sum(end))/2,1);
median_frequency=frequency_bins(index);
% draw a vertical line to mark up median freq
hx = graph2d.constantline(median_frequency, 'LineStyle','-.', 'Color',[1 0 0]);
changedependvar(hx,'x');
