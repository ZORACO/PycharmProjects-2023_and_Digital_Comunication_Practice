%%% DPCM Transmitter and Receiver
% Input Sinusoidal Signal
clear all; close all; clc;
fm = 4; % Message Frequency
fs = 20*fm; % Sampling Frequency
am = 2; % Amplitude
t = 0:1/fs:1; % Time
x = am*cos(2*pi*fm*t); % Sinusoidal Signal
figure(1);
plot(t,x,'r-') ;
hold on
xlabel('Time')
ylabel('Amplitude')
%title('Input Sinusoidal Signal')

%%Transmitter 
for n = 1:length(x)
    if n ==1
        e(n) = x(n);
        eq(n) = round(e(n));
        xq(n) = eq(n);
    else
        e(n) = x(n) - xq(n - 1);
        eq(n) = round(e(n));
        xq(n) = eq(n) + xq(n - 1);
    end
end

%% Receiver
for n = 1:length(x)
    if n ==1
        xqr(n) = eq(n);
    else
        xqr(n) = eq(n) + xqr(n - 1);
    end
end
plot(t,xqr,'k-')
xlabel('Time')
ylabel('Amplitude')
%title('Reconstructed Signal')
legend('Original','Reconstructed');


%%% Low Pass Filtering
[num den] = butter(2,4*fm/fs); % Butterworth Filter
rec_op = filter(num, den, xqr); % Low Pass Filtering
figure(2);
plot(t,rec_op,'k-')
xlabel('Time')
ylabel('Amplitude')
title('Smoothed Signal')