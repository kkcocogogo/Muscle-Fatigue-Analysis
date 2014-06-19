function fatigue_analysis(filename)
% This function does the whole deal
close all;
% first import data
frequency = 1000;
hugeData = lvm_import(filename);
hugeData = hugeData.Segment1.data;
time = hugeData(:,1);
duration=size(time,1);
volts = hugeData(:,2);
clear hugeData

%perform a truncation over all data
figure(1)
clf
plot(volts);
title('preview')
% [x, y] = ginput;
% x = floor(x); clear y;
% time = time(x:end);
% volts = volts(x:end);
median_frequency=[];
for i=1:1000:duration-999
    subplot(211)
    median_temp=psd_analysis(volts(1:i+999),frequency);
    median_frequency=[median_frequency median_temp];
    subplot(212)
    plot(median_frequency,'--rs');
    hold on
    pause(.01)
end
figure
plot(median_frequency)